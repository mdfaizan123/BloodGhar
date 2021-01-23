<%@page import="java.util.HashMap"%> 
<%
    HashMap hm=(HashMap)session.getAttribute("userDetails");
     if(hm!=null){
         java.util.ArrayList<java.util.HashMap> allMessage=(java.util.ArrayList)session.getAttribute("allMessage1");
         if(allMessage!=null){
%>


                             <% if(allMessage!=null)   { 
                             for(HashMap ms:allMessage) {
                                 if(ms.get("id").equals(hm.get("id")))
                                 { %>
                             
              
				<div class="chat-r">
					<div class="sp"></div>
					<div class="mess mess-r">
						<p><!--<img src="img/emoji-1.png" class="emoji">-->
                                                    <%=ms.get("text")%>
						</p>
						<div class="check">
							<span><%=ms.get("date")%></span>
							<!--<img src="img/check-2.png">-->
						</div>
					</div>
				</div>
                                
                                    <% } else{ %>
                                
				<div class="chat-l">
					<div class="mess">
						<p>
                                                <%=ms.get("text")%>
                                                <img src="img/emoji-2.png" class="emoji">
						</p>
						<div class="check">
							<span><span><%=ms.get("date")%></span>
						</div>
					</div>
					<div class="sp"></div>
				</div>

				<%}}}%>
                        
                       <%
    }
    }
else{
 session.setAttribute("msg", "Please Login First");
                response.sendRedirect("home.jsp");
}
%>