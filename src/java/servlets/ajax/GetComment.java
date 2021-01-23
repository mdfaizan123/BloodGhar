package servlets.ajax;


import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GetComment extends HttpServlet {
 protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
       try{    
               String p_id=request.getParameter("p_id");
               db.DbConnect db=new db.DbConnect();
               
               java.util.ArrayList<java.util.HashMap> allComment=db.getComment(Integer.parseInt(p_id));
               if(! allComment.isEmpty()){
               HashMap am=allComment.get(0);
               session.setAttribute("p_id",p_id);
               session.setAttribute("allMessage", allComment);
               session.setAttribute("c_id",am.get("c_id"));
               response.sendRedirect("message.jsp");
               }else{
                    response.sendRedirect("message.jsp");
               
               }
           
       }catch(Exception ex){
           session.setAttribute("msg", ex);
            response.sendRedirect("profile.jsp");
       }
    }
}
