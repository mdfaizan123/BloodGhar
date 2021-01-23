package servlets.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class GetFeedOnScroll extends HttpServlet {
    private java.util.ArrayList<java.util.HashMap> allFedds1;

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        PrintWriter out=response.getWriter();
        
       try{ 
              
                HashMap pd=(HashMap)session.getAttribute("postDetail");
              
                int p_id=(int)pd.get("p_id");
               
                
               java.util.HashMap postDetail=new java.util.HashMap();
               db.DbConnect db=new db.DbConnect();
               allFedds1=db.getFeed(p_id);
               if(! allFedds1.isEmpty()){
                   HashMap am=allFedds1.get(allFedds1.size()-1);
                   postDetail.put("p_id", am.get("p_id"));
                   session.setAttribute("postDetail", postDetail);
                   session.setAttribute("allFedds1", allFedds1);
                   response.sendRedirect("ajax/scrollfeed.jsp");
//                   feed(out);                                                   //output feed when scroll
               }
               else{
               }
               
           
       }catch(Exception ex){
           session.setAttribute("msg", ex);
//            response.sendRedirect("ajax/scrollfeed.jsp");
       }
    }
//    private void feed(PrintWriter out){
//        for(HashMap pb:allFedds1) {
//                out.print("<div class=\"pjumbotron\">\n" +
//                    "        <div >\n" +
//                    "            <p class=\"text-left-help\">\n" +
//                    "                <span class=\"profile-icon\">\n" +
//                    "                    <a href=\"SearchPost?id="+pb.get("id")+"\" class=\"image-container-post\"><img src=\"GetPost?id="+ pb.get("p_id")+ "\" /></a>\n" +
//                    "                    <button href=\"\" class=\"three-dot\"  data-toggle=\"dropdown\"><i class=\"fas fa-ellipsis-v\"></i></button>\n" +
//                    "                    <span class=\"dropdown-menu\">\n" +
//                    "                      <a class=\"dropdown-item\" href=\"#\">Action</a>\n" +
//                    "                      <a class=\"dropdown-item\" href=\"#\">Another action</a>\n" +
//                    "                      <a class=\"dropdown-item\" href=\"#\">Something else here</a>\n" +
//                    "                    </span>\n" +
//                    "                    <label class=\"p-name\">"+pb.get("name")+"<p class=\"date\">"+pb.get("date")+"</p></label>   \n" +
//                    "                </span>\n" +
//                    "                <p  class=\"text-left-help\">"+pb.get("text")+"</p></p>\n" +
//                    "        </div>\n" +
//                    "\n" +
//                    "        <div ><img class=\"size\" src=\"GetPost?id="+ pb.get("p_id")+"\"></div>\n" +
//                    "        <div class=\"post-icon-margin container\">\n" +
//                    "            <a href=\"\" class=\"help-post-icon1\"><i class=\"far fa-thumbs-up\"></i><span class=\"help-icon-text\">Like</span> </a>\n" +
//                    "            <a href=\"\" class=\"help-post-icon2\"><i class=\"far fa-comment-alt\"></i><span class=\"help-icon-text\">message</span></a>\n" +
//                    "            <a href=\"\" class=\"help-post-icon3\"><i class=\"fa fa-share\" aria-hidden=\"true\"></i><span class=\"help-icon-text\">share</span> </a>\n" +
//                    "        </div>\n" +
//                    "    </div>");
//        }
//        
//    }

}
