package servlets;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Following extends HttpServlet {
    

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
       try{    
               String id=request.getParameter("id");
               
               db.DbConnect db=new db.DbConnect();
               
               java.util.ArrayList<java.util.HashMap> allFollowingDetails=db.getFollowingDetails(id);
                session.setAttribute("allFollowingDetails", allFollowingDetails);
                response.sendRedirect("following.jsp");
               
           
       }catch(Exception ex){
           session.setAttribute("msg", ex);
            response.sendRedirect("profile.jsp");
       }
    }

}
