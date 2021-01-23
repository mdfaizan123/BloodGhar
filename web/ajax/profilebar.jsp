<%@page import="java.util.HashMap"%> 
<%  
    String checkFollower=(String)session.getAttribute("checkFollower");
    HashMap hm=(HashMap)session.getAttribute("userDetails"); 
    HashMap pb=(HashMap)session.getAttribute("publicDetails"); 
     if(hm!=null){
%>

<div id="profilebar">
            <%
                if(pb.get("id").equals(hm.get("id"))) { %>

                <button class="user" style="width: auto">Add Story</button>

            <% }else {%>


            <button class="message"><i class="far fa-comment-alt"></i></button>

            <% if(checkFollower.equals("yes")) { %>
            <div  onclick="sendInfo('RemoveFollower')">
                <button class="user">Unfollow</button>
            </div>

            <% } else{ %>
            <div  onclick="sendInfo('UpdateFollower')">
                <button class="user"><i class="fas fa-user-plus"></i></button>
            </div>

            <% } %>
            
            <% } %>
        
        </div> 
</div>

<%
    
    }
else{
 session.setAttribute("msg", "Please Login First");
                response.sendRedirect("login.jsp");
}
%>