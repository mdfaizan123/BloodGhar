
package servlets;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Update extends HttpServlet {

   
    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException
             {
       HttpSession session=request.getSession();
        try{
            HashMap hm=(HashMap)session.getAttribute("userDetails");
            String id=(String)hm.get("id");
            String dt=request.getParameter("dob");
            String new_name=request.getParameter("name");
            String n=request.getParameter("number");
            String g=request.getParameter("gender");
            String b=request.getParameter("blood");
            String s=request.getParameter("state");
            String c=request.getParameter("city");
            String p=request.getParameter("pin_code");
            java.util.HashMap userDetailUpdate=new java.util.HashMap();
            
            
            
            db.DbConnect db=new db.DbConnect();
            java.util.HashMap allDetails=db.getAllDetails(id);
            if(new_name.equals("")){
                new_name=(String)hm.get("name");
            }
            if(n==""){
                n=(String)allDetails.get("number");
            }
            if(g==""){
                g=(String)allDetails.get("gender");
            }
            if(b.equalsIgnoreCase("0") || b.equalsIgnoreCase("1")){
                b=(String)allDetails.get("blood");
            }
            if(s==""){
                s=(String)allDetails.get("state");
            }
            if(c==""){
                c=(String)allDetails.get("city");
            }
            if(p==""){
                p=(String)allDetails.get("pin_code");
            }
            
            if(dt!=""){
                java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("dd/mm/yyyy");
                java.util.Date date=sdf.parse(dt);
                java.sql.Date d=new java.sql.Date(date.getTime());
                userDetailUpdate.put("dob",d);
            }
            
            if(dt==""){
                userDetailUpdate.put("dob",(java.sql.Date)allDetails.get("dob"));
               
            }
            userDetailUpdate.put("name", new_name);
            userDetailUpdate.put("id",hm.get("id"));
            userDetailUpdate.put("number",n);
            userDetailUpdate.put("gender",g);
            userDetailUpdate.put("blood",b);
            userDetailUpdate.put("state",s);
            userDetailUpdate.put("city",c);
            userDetailUpdate.put("pin_code",p);
            
            String m=db.update(userDetailUpdate);
            if(m.equalsIgnoreCase("Success")){
                HashMap userDetails=new HashMap();
               userDetails.put("id",id);
               userDetails.put("name",new_name);
                session.setAttribute("userDetails", userDetails);
                response.sendRedirect("profile.jsp");   
            }else{
                session.setAttribute("msg", "Updation failed");
                response.sendRedirect("edit.jsp");
            }
            
        }catch (Exception ex) {
            session.setAttribute("msg", "Updation Failed: "+ex);
            response.sendRedirect("edit.jsp");
        }
    
    }
}
