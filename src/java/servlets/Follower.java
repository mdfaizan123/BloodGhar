package servlets;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Follower extends HttpServlet {
    

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
       try{    
               String id=request.getParameter("id");
               
               db.DbConnect db=new db.DbConnect();
               
               java.util.ArrayList<java.util.HashMap> allFollowerDetails=db.getFollowerDetails(id);
                session.setAttribute("allFollowerDetails", allFollowerDetails);
                response.sendRedirect("follower.jsp");
               
           
       }catch(Exception ex){
           session.setAttribute("msg", ex);
            response.sendRedirect("profile.jsp");
       }
    }

}
