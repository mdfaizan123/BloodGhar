package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class sendMessage extends HttpServlet {
    

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
       try{    
               HashMap hm=(HashMap)session.getAttribute("userDetails");
               HashMap pd=(HashMap)session.getAttribute("publicDetail");
               
               String text=request.getParameter("text");
               java.util.HashMap messageDetail=new java.util.HashMap();
               db.DbConnect db=new db.DbConnect();
               messageDetail.put("p_id", (String)pd.get("p_id"));
               messageDetail.put("text", text);
               messageDetail.put("id", (String)hm.get("id"));
               
               String result=db.uploadMessage(messageDetail);
               
               if(! result.equalsIgnoreCase("success")){
                   System.out.println(text);
                   System.out.println(result);
               }
               else{
               session.setAttribute("msg", "sending failid");
               response.sendRedirect("message.jsp");
               }
           
       }catch(Exception ex){
           session.setAttribute("msg", ex);
            response.sendRedirect("message.jsp");
       }
    }

}
