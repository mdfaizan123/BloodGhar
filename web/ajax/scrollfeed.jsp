<%@page import="java.util.HashMap"%> 
<%
    HashMap hm=(HashMap)session.getAttribute("userDetails");
     if(hm!=null){
         java.util.ArrayList<java.util.HashMap> allFedds1=(java.util.ArrayList)session.getAttribute("allFedds1");
         if(allFedds1!=null){
%>

        


     <% if(allFedds1!=null)   { 
     for(HashMap pb:allFedds1) { %>

    <div class="pjumbotron">
        <div >
            <p class="text-left-help">
                <span class="profile-icon">
                    <a href="SearchPost?id=<%=pb.get("id")%>" class="image-container-post"><img src="GetPost?id=<%= pb.get("p_id") %>" /></a>
                    <button href="" class="three-dot"  data-toggle="dropdown"><i class="fas fa-ellipsis-v"></i></button>
                    <span class="dropdown-menu">
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </span>
                    <label class="p-name"><%= pb.get("name") %><p class="date"><%= pb.get("date") %></p></label>   
                </span>
                <p  class="text-left-help"><%= pb.get("text") %></p></p>
        </div>

        <div ><img class="size" src="GetPost?id=<%= pb.get("p_id") %>"></div>
        <div class="post-icon-margin container">
            <a href="" class="help-post-icon1"><i class="far fa-thumbs-up"></i><span class="help-icon-text">Like</span> </a>
            <a href="" class="help-post-icon2"><i class="far fa-comment-alt"></i><span class="help-icon-text">message</span></a>
            <a href="" class="help-post-icon3"><i class="fa fa-share" aria-hidden="true"></i><span class="help-icon-text">share</span> </a>
        </div>
    </div>
    <% } }else{
              out.println("dkhdk"); %>
   <% } %>
   

<% } }
else{
 session.setAttribute("msg", "Please Login First");
                response.sendRedirect("home.jsp");
}
%>