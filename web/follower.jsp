<%@page import="java.util.HashMap"%> 
<%
    HashMap hm=(HashMap)session.getAttribute("userDetails");
     if(hm!=null){
         java.util.ArrayList<java.util.HashMap> allFollowerDetails=(java.util.ArrayList)session.getAttribute("allFollowerDetails");
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
    
    <link rel="stylesheet" href="css\help.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/profile.css">  
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
                        <a class="nav-link" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="help.jsp">Help Emergency</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="donator.jsp">Donator</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="trust.jsp">trust</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">about</a>
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
                        <a class="dropdown-item" href="Logout">Logout</a>
                    </span>
                    
                </ul>
            </div>
        </div>
        
    </nav>
    
    
    <!--folowers-->
    
    
    <div class="pjumbotron" style="background-color: white">
              <% if(allFollowerDetails!=null)   { %>
               <% for(HashMap fd:allFollowerDetails) { %>
               
        
        <div class="list-people">
            <a href="" ><img src="profile.jpg" /></a>
            <label class="p-name-f"> <%=fd.get("name")%> <p class="tag">@<%=fd.get("f_id")%></p></label> 
            <button class="btn btn-info btn-sm">Remove</button>
            <button href="" class="three-dot-f"  data-toggle="dropdown">
                
                <p>  <i class="fas fa-ellipsis-v"></i></p>
            </button>
             <span class="dropdown-menu">
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </span>
        </div>
            <% } } %>
    </div>
        
    
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