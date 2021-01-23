<%@page import="java.util.HashMap"%> 
<%
    HashMap hm=(HashMap)session.getAttribute("userDetails");
     if(hm!=null){
         java.util.ArrayList<java.util.HashMap> allFriend=(java.util.ArrayList)session.getAttribute("allFriend");
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
    <link rel="stylesheet" href="css/friend.css">
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
    
     <!--search bar-->
    <div class="pjumbotron" style="background-color: white">
        <div class="input-group">
        
        <input type="text" placeholder="Search friends" class="form-control" aria-label="Amount (to the nearest dollar)">
        <div class="input-group-append">
            <span class="input-group-text"><a href="hospital_list.jsp"><i class="fa fa-search" aria-hidden="true"></i></a></span>
        </div>
    </div>
    </div>
   
    
    <!-- chat boat-->
    <div class="margin">
        <div class="fjumbotron">
                <div class="you">
                    <% if(allFriend!=null)   { %>
               <% for(HashMap fd:allFriend) { %>
                    <div class="x">
                        <a href="Message?id=<%=fd.get("f_id")%>&name=<%=fd.get("name")%>" accesskey="b"><img src="img/logo.jpg" alt="Avatar" >
                            <p class="last-n"><%=fd.get("name")%></p>
                        <span class="last-m">helllo im faizan</span>
                        <span class="time-right">11:00</span>
                    </div>
                   <% } } %>
                </div>
        </div>
    </div>
    <!--end-->
	
    
    <!-- footer -->
    <nav id="mainNavbar" class="navbar navbar-expand-lg navbar-light bg-light fixed-bottom">
        <div class="container">
            <footer class="blockquote-footer">The design and developer by <cite title="Source Title">MD FAIZAN and MD NADEEM HASAN</cite></footer>
        </div>
        
    </nav>
   
   
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>

<%
    
    }
else{
 session.setAttribute("msg", "Please Login First");
                response.sendRedirect("home.jsp");
}
%>