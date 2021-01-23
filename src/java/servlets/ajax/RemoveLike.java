/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MD FAIZAN
 */
public class RemoveLike extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
       try{
            HashMap hm=(HashMap)session.getAttribute("userDetails"); 
            String p_id=request.getParameter("p_id"); 
            String id=(String)hm.get("id");
            db.DbConnect db=new db.DbConnect();
            String checkLke=db.removeLike(p_id,id);
            session.setAttribute("checkLke", checkLke);
            session.setAttribute("p_id", p_id);
            response.sendRedirect("ajax/likepost.jsp");
               
           
       }catch(Exception ex){
           session.setAttribute("msg", ex);
            response.sendRedirect("ajax/likepost.jsp");
       }
    }
}
