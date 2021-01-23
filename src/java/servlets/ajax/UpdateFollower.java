package servlets.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UpdateFollower extends HttpServlet {
    

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
       try{
            HashMap hm=(HashMap)session.getAttribute("userDetails"); 
            HashMap pb=(HashMap)session.getAttribute("publicDetails"); 
           
             
               String id=(String)hm.get("id");
               String f_id=(String)pb.get("id");
           
               db.DbConnect db=new db.DbConnect();
               String checkFollower=db.insertFollower(id,f_id);
               session.setAttribute("checkFollower", checkFollower);
               response.sendRedirect("ajax/profilebar.jsp");
               
           
       }catch(Exception ex){
           session.setAttribute("msg", ex);
            response.sendRedirect("ajax/profilebar.jsp");
       }
    }

}
