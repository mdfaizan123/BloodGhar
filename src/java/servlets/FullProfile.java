package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class FullProfile extends HttpServlet {
    

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
       try{
               String id=request.getParameter("id");
           
               db.DbConnect db=new db.DbConnect();
               java.util.ArrayList<java.util.HashMap> allUserDetails=db.getMessages(id);
               if(! allUserDetails.isEmpty()){
                   String n=db.getName(id);
                   HashMap publicDetails=new HashMap();
                   publicDetails.put("name", n);
                   publicDetails.put("id", id);
                   session.setAttribute("publicDetails" ,publicDetails);
                   session.setAttribute("allUserDetails", allUserDetails);
                   response.sendRedirect("fullprofile.jsp");
               }
               else{
                   session.setAttribute("msg", "Something wrong"+id);
                   response.sendRedirect("profile.jsp");
               }
               
           
       }catch(Exception ex){
           session.setAttribute("msg", ex);
            response.sendRedirect("profile.jsp");
       }
    }

}
