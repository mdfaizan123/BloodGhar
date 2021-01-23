
package servlets;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class GetPost extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, IOException{
            
            HttpSession session=request.getSession();
         try{
            String i= request.getParameter("id");
            db.DbConnect db=new db.DbConnect();
            byte[] b=db.getPost(Integer.parseInt(i.trim()));
            if(b==null){
               
              FileInputStream fin=new FileInputStream("E:\\o8.jpg");
                    b=new byte[350000];
                    fin.read(b);
            }
            response.getOutputStream().write(b);
            
        }catch(Exception ex){
          session.setAttribute("msg", ex);
          response.sendRedirect("home.jsp");
        }
    }

}
