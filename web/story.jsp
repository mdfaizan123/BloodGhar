<%@page import="java.util.HashMap"%> 
<%
    HashMap hm=(HashMap)session.getAttribute("userDetails");
     if(hm!=null){
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
    <!--profile-->
    <div class="pjumbotron-profile border border-dark d-flex flex-column justify-content-start">
        
        <a href="view.jsp" ><img src="img\slide_img1.jpg" class="w-100" alt="..."></a>
        
    </div>
    
   
    <!--name-->
    <div class="img-border">
        <a href="" ><img src="profile.jpg" class="center" alt="..."></a>
    </div>
    
    <div class="container text-color-red">
        <h4 ><%=hm.get("name")%></h4>
    </div>
     
    
    <!-- friend request row-->
    
    <div class="pjumbotron-add border border-dark d-flex flex-column flex-md-row justify-content-start">
        <button href="" class="three-dot-h"  data-toggle="dropdown">
                        <i class="fas fa-ellipsis-h"></i>

         </button>
        
        

                    <span class="dropdown-menu">
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another</a>
                      <a class="dropdown-item" href="#">Something</a>
                    </span>
        
        
        <button class="message"><i class="far fa-comment-alt"></i></button>
        <button class="user"><i class="fas fa-user-plus"></i></button>
        
        
    </div> 
    
    <!-- profile status-->
    
    <div class="pjumbotron d-flex flex-column flex-md-row justify-content-start" style="background-color: white">
            <h6>went to go <b class="p-status">Delhi</b><h6>
    </div>
    
    <br>
    
    <div class="pjumbotron" style="background-color: white">
        <ul class="nav nav-tabs justify-content-center" id="h" style="font-size: 14px">
            <li class="nav-item">
              <a class="nav-link" id="post" href="profile.jsp">Posts</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="follwers" href="follower.jsp">Followers(900k)</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="following" href="following.jsp">Following(900k)</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="tags" href="tag.jsp">Tags</a>
            </li>
            <li class="nav-item ">
              <a class="nav-link active" id="story" href="story.jsp">Story</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="edit" href="edit.jsp">Edit</a>
            </li>
        </ul>
    </div>
    
    <!--picture-->
    <section id="gallery">
       <div class="pjumbotron" style="background-color: white">
            <div class="row">
                
                <div class="col-lg-2 col-md-3 col-sm-4 col-4">
                    <div class="card">
                        <a href=""><img class="card-img-top" src="img/pattern1.jpeg" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-4 col-4">
                    <div class="card">
                        <img class="card-img-top" src="img/logo.jpg" class="d-block w-100" alt="">
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-4 col-4">
                    <div class="card">
                        <img class="card-img-top" src="img/logo.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-4 col-4">
                    <div class="card">
                        <img class="card-img-top" src="img/logo.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-4 col-4">
                    <div class="card">
                        <img class="card-img-top" src="img/logo.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-4 col-4">
                    <div class="card">
                        <img class="card-img-top" src="img/logo.jpg" alt="">
                    </div>
                </div>
           </div>
       </div>
    </section>
    
    
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