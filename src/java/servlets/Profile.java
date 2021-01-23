
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class Profile extends HttpServlet {

    
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        try{
            
            String e=request.getParameter("email");
            db.DbConnect db=new db.DbConnect();
            java.util.HashMap userDetails=db.getUserDetails(e);
            if(userDetails!=null){
                session.setAttribute("userDetails", userDetails);
                response.sendRedirect("profile.jsp");  
            }else{
                response.sendRedirect("pagenotavailable.html");
            }
            
            
        }catch(Exception ex){
             session.setAttribute("msg", "Login Failed: "+ex);
             response.sendRedirect("home.jsp");
        }
                
    }
    
}
