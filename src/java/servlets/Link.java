package servlets;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Link extends HttpServlet {
    

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
       try{    
               HashMap hm=(HashMap)session.getAttribute("userDetails"); 
               String id=request.getParameter("id");
               
               db.DbConnect db=new db.DbConnect();
               String checkFollower=db.checkFollower(id,(String)hm.get("id"));
               
               java.util.ArrayList<java.util.HashMap> allId=db.getPostId(id);
               HashMap publicDetails=db.getPublicDetails(id);
               HashMap follower=db.getFollowers(id);
               session.setAttribute("checkFollower", checkFollower);
                   session.setAttribute("follower" ,follower);
                   session.setAttribute("publicDetails" ,publicDetails);
                   session.setAttribute("allId", allId);
                   response.sendRedirect("profile.jsp");
               
           
       }catch(Exception ex){
           session.setAttribute("msg", ex);
            response.sendRedirect("profile.jsp");
       }
    }

}
