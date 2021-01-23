
package servlets;

import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Register extends HttpServlet {

   
    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException
             {
       HttpSession session=request.getSession();
        try{
            int i=1;
            String k="Failed";
            String e=request.getParameter("email");
            String n=request.getParameter("name");
            String p=request.getParameter("password");
            String id=n;
            
            java.util.HashMap userDetails=new java.util.HashMap();
              
            userDetails.put("email",e);
            userDetails.put("name",n);
            userDetails.put("password",p);
            
            db.DbConnect db=new db.DbConnect();
            outer:
            while("Failed".equalsIgnoreCase(k)){
              userDetails.remove("id",id);  
              userDetails.put("id",id);
              k=db.checkId(id);
              id=n+i;
              i=i+1; 
              continue outer;
            }
            
            userDetails.put("id", id);
            String m=db.insertUserLogin(userDetails);
            if(m.equalsIgnoreCase("Success")){
                userDetails.remove("password");
                userDetails.remove("email");
                session.setAttribute("userDetails", userDetails);
                response.sendRedirect("home.jsp");   
            }else if(m.equalsIgnoreCase("Already")){
                session.setAttribute("msg", "Email ID Already Exist");
                response.sendRedirect("create_account.jsp");
            }else{
                session.setAttribute("msg", "Registration Failed!");
                response.sendRedirect("create_account.jsp");
            }
            
        }catch (Exception ex) {
            session.setAttribute("msg", "Registration Failed: "+ex);
            response.sendRedirect("create_account.jsp");
        }
    
    }
}
