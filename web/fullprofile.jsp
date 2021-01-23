<%@page import="java.util.HashMap"%> 
<%
    
    HashMap hm=(HashMap)session.getAttribute("userDetails");
     if(hm!=null){
         HashMap pb=(HashMap)session.getAttribute("publicDetails");
         java.util.ArrayList<java.util.HashMap> allUserDetails=(java.util.ArrayList)session.getAttribute("allUserDetails");
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
    <link rel="stylesheet" href="fontawesome-free-5.12.1-web\css\all.css">
    <link rel="stylesheet" href="css\help.css">
    <link rel="stylesheet" href="style.css">
    <title>BloodGhar</title>
</head>
    <body>
        
        
         <!-- navbar -->
        <nav id="mainNavbar" class="navbar navbar-expand-lg navbar-light bg-light navbar-top">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="img\logo.jpg" />BloodGhar</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="home.jsp">Home<span class="sr-only">(current)</span> </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="help.jsp">Help Emergency</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="donator.jsp">Donator</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="trust.jsp">trust</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.jsp">about us</a>
                        </li>
                        <li class="nav-item active">
                             <span class="image-container nav-link" href="profile.jsp"><img src="profile.jpg" /></span>
                        </li>

                        <a href="" class="image-container1"  data-toggle="dropdown">
                                   <img src="profile.jpg" />
                        </a>

                        <span class="dropdown-menu">
                          <a class="dropdown-item" href="profile.jsp">News feed</a>
                        <a class="dropdown-item" href="profile.jsp">Profile</a>
                        <a class="dropdown-item" href="profile.jsp">message</a>
                        <a class="dropdown-item" href="Support.jsp">Support</a>
                        <a class="dropdown-item" href="Privacy.jsp">Privacy</a>
                        <a class="dropdown-item" href="login.jsp">Login</a>
                        <a class="dropdown-item" href="Logout">Logout</a>
                        </span>
                    </ul>
                </div>
            </div>

        </nav>
               
        <!--post-->
         
                           <% if(allUserDetails!=null)   { %>
                          <% for(HashMap ud:allUserDetails) { %>
         
        <div class="pjumbotron">
            <div >

                <p class="text-left-help">
                    <span class="profile-icon">

                        <a href="SearchPost?id=<%=pb.get("id")%>" class="image-container-post"><img src="GetPost?id=<%= ud.get("p_id") %>" /></a>
                        <button href="" class="three-dot"  data-toggle="dropdown">
                            <i class="fas fa-ellipsis-v"></i>

                        </button>
                        
                        <span class="dropdown-menu">
                          <a class="dropdown-item" href="#">Action</a>
                          <a class="dropdown-item" href="#">Another action</a>
                          <a class="dropdown-item" href="#">Something else here</a>
                        </span>
                        
                        <label class="p-name"><%=pb.get("name")%><p class="date"><%=ud.get("date")%></p></label>   

                    </span>
                   
                
                    <p  class="text-left-help">
                        <%=ud.get("text")%></p></p>
            </div>

            <div >
                <img class="size" src="GetPost?id=<%= ud.get("p_id") %>"  allowfullscreen></img>
            </div>
            <div class="post-icon-margin container">
                <a href="" class="help-post-icon1"><i class="fa fa-phone" aria-hidden="true"></i><span class="help-icon-text">Call</span> </a>
                <a href="" class="help-post-icon2"><i class="fa fa-comment" aria-hidden="true"></i> <span class="help-icon-text">message</span></a>
                <a href="" class="help-post-icon3"><i class="fa fa-share" aria-hidden="true"></i><span class="help-icon-text">share</span> </a>
            </div>
           

        </div>
         <% } } %>
        
        <br><br>
        <!-- footer -->
   <nav id="mainNavbar" class="navbar navbar-expand-lg navbar-light bg-light fixed-bottom">
        <div class="container">
            <footer class="blockquote-footer">The design and developer by <cite title="Source Title">MD FAIZAN and MD NADEEM HASAN</cite></footer>
        </div>
        
    </nav>

<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

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