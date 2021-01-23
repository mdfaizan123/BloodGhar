<% 
    String checkLke=(String)session.getAttribute("checkLke"); 
    String p_id=(String)session.getAttribute("p_id");
%>

<% if(checkLke.equals("no")) { %>
    <span class="help-post-icon1 cursor " onclick="sendLike('AddLike','<%= p_id %>')">
        <i class="far fa-thumbs-up"></i><span class="help-icon-text">Like</span>
    </span>
<% }else {%>
    <span class="help-post-icon1 cursor removelike" onclick="sendLike('RemoveLike','<%= p_id %>')">
        <i class="fas fa-thumbs-up"></i><span class="help-icon-text">Like</span>
    </span>
<% } %>
