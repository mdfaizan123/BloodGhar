package servlets;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Feed extends HttpServlet {
    

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        
       try{ 
              //here now get all post not need id
               
               java.util.HashMap postDetail=new java.util.HashMap();
               db.DbConnect db=new db.DbConnect();
               java.util.ArrayList<java.util.HashMap> allFedds=db.getFeed();
               if(! allFedds.isEmpty()){
                   HashMap k=allFedds.get(allFedds.size()-1);
                   postDetail.put("p_id",k.get("p_id"));
                   session.setAttribute("postDetail", postDetail);
                   session.setAttribute("allFedds", allFedds);
                   response.sendRedirect("feed.jsp");
               }
               else{
                   session.setAttribute("msg", "No post found!");
                   response.sendRedirect("feed.jsp");
               }
               
           
       }catch(Exception ex){
           session.setAttribute("msg", ex);
            response.sendRedirect("feed.jsp");
       }
    }

}
