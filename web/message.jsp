<%@page import="java.util.HashMap"%> 
<%
    HashMap hm=(HashMap)session.getAttribute("userDetails");
     if(hm!=null){
         
          HashMap pd=(HashMap)session.getAttribute("publicDetail");
         java.util.ArrayList<java.util.HashMap> allMessage=(java.util.ArrayList)session.getAttribute("allMessage");
%> 


<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
        crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css\help.css">
    <link rel="stylesheet" href="css\message.css">
    
    <title>BloodGhar</title>
</head>
 
<body>
    <!-- navbar -->
    <nav id="mainNavbar" class="navbar navbar-expand-lg navbar-light bg-light navbar-top">
        <div class="container">
            <a class="navbar-brand " href="#"><img src="img\logo.jpg" />BloodGhar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp">Home<span class="sr-only">(current)</span> </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="help.jsp">Help Emergency</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="Feed">News feed</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Friend?id=<%if(hm!=null){%><%=hm.get("id")%><%}%>">message</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="donator.jsp">Donator</a>
                    </li>
                    <li class="nav-item">
                        <a class="image-container nav-link" data-toggle="dropdown" href=""><img src="profile.jpg"/></a>
                        <span class="dropdown-menu">
                            <a class="dropdown-item" href="SearchPost?id=<%if(hm!=null){%><%=hm.get("id")%><%}%>">Profile</a>
                            <a class="dropdown-item" href="about.jsp">about us</a>
                            <a class="dropdown-item" href="Support.jsp">Support</a>
                            <a class="dropdown-item" href="Privacy.jsp">Privacy</a>
                            <a class="dropdown-item" href="login.jsp">Login</a>
                            <a class="dropdown-item" href="Logout">Logout</a>
                        </span>
                    </li>

                        
                </ul>
            </div>
        </div>
        
    </nav>
      

    <input id="id" type="hidden" value="<%=hm.get("id")%>">
    <input id="p_id" type="hidden" value="<%=pd.get("p_id")%>">
    
     
       <%
        String msg=(String)session.getAttribute("msg");
        if(msg!=null)  
        {
    %>
        <div class="pjumbotron">
            <div class="text-center">
                <p><%=msg%></p>
            </div>
        </div>
        <%
            session.setAttribute("msg", null);
            }
        %>
    
    
    <!--chat-->
    <div class="pjumbotron">
		<div class="chat">
			<div class="chat-header">
				<div class="profile">
					<div class="left">
						<img src="profile.jpg" class="arrow">
                                                <input id="p_name" type="hidden" value="<%=pd.get("name")%>">
						<h2><%=pd.get("name")%></h2>
					</div>
					<div class="right">
						<i class="sidei fas fa-ellipsis-v"></i>
					</div>
				</div>
			</div>
			<div class="chat-box" id="scroll">
                            <br><br>
                            <div id="s">
                                
                            </div>
                            
                            
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
                                <div id="b"></div>
                                
			</div>

                        <form  class="chat-footer">
				<textarea  onfocus="scrol();" id="messageText" placeholder="Type a message" autofocus></textarea>
                                <input type="hidden" name="p_id" value="<%=pd.get("p_id")%>" />
				<div class="icons">
					<i class="fas fa-video"></i>
				</div>
                                <span  class="btn" onclick="sendMessage();"><img src="img/mic.png" class="mic"></span>
			</form>
		</div>
	</div>
    <!-- footer -->
    
   
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/message.js"></script>
</body>
   

</html>
<%
    
    }
else{
 session.setAttribute("msg", "Please Login First");
                response.sendRedirect("home.jsp");
}
%>