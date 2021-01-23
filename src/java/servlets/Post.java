
package servlets;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import javax.imageio.ImageIO;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class Post extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException
             {
       HttpSession session=request.getSession();
        try{
            HashMap hm=(HashMap)session.getAttribute("userDetails");
            //code to conver photo into byte
            Part part=request.getPart("photo");
            String t=request.getParameter("text");
            String i=(String)hm.get("id");
            
            InputStream is=part.getInputStream();
            // image compressor
            Image image = ImageIO.read(is);
            if(image!=null){
                int imageWidth = image.getWidth(null);
                int imageHeight = image.getHeight(null);
                if(imageWidth>1080){
                    is= resizeImage(image,1080,imageHeight*1080/imageWidth);
                }
                
            }
            java.util.HashMap userPost=new java.util.HashMap();
            userPost.put("media",is);
            userPost.put("text",t);
            userPost.put("id",i);
            db.DbConnect db=new db.DbConnect();
            String m=db.postUpload(userPost);
            if(m.equalsIgnoreCase("Success")){
                session.setAttribute("msg", "post upload succesful");
                response.sendRedirect("feed.jsp");   
            }
            
            else{
            session.setAttribute("msg", "Failed!");
            response.sendRedirect("feed.jsp");
            }
            
            } catch (Exception ex) {
            session.setAttribute("msg", "Failed: "+ex);
            response.sendRedirect("feed.jsp");
        }
    
    }
    
    private  InputStream resizeImage(Image image, int width, int height) throws IOException {
        final BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        final Graphics2D graphics2D = bufferedImage.createGraphics();
        graphics2D.setComposite(AlphaComposite.Src);
        graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION,RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING,RenderingHints.VALUE_RENDER_QUALITY);
        graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);
        graphics2D.drawImage(image, 0, 0, width, height, null);
        graphics2D.dispose();
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        ImageIO.write(bufferedImage, "jpeg", os);
        InputStream is = new ByteArrayInputStream(os.toByteArray()); 
        return is;
    }
}
