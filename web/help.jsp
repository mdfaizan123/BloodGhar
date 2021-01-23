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
    <link rel="stylesheet" href="fontawesome-free-5.12.1-web\css\all.min.css">
    <link rel="stylesheet" href="css\help.css">
    <link rel="stylesheet" href="style.css">
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
                    <li class="nav-item active">
                        <a class="nav-link" href="help.jsp">Help Emergency</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="Feed">News feed</a>
                    </li>
                    <li class="nav-item">
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
        <!--uploading-->
        <form action="Post" method="post"  data-toggle="validator" enctype='multipart/form-data' >
        <div class="pjumbotron-01 border border-dark d-flex flex-column justify-content-start">
            <h3 id="custom-text">Upload post</h3>
        </div>

        <div class="pjumbotron-p">
            <a href="" class="image-container-upload"><img src="profile.jpg" /></a>
            <textarea name="text" placeholder="Ask from people in public" class="upload-post"></textarea>
        </div> 

        <div class="pjumbotron-0 border border-dark d-flex flex-row justify-content-around" style="height: 50px">
            
            <input type="file" name="photo" id="real-file" hidden="hidden" accept="video/mp4,video/x-m4v,video/*">
            
            <span  class="btn btn-info" id="custom-button"><i class="fas fa-video"></i> Chose a video</span>
            
            
            <button class="btn btn-info"><i class="fas fa-upload"></i> Post</button>
        </div>
        </form>
        
        <!--post-->
         
         
        <div class="pjumbotron">

            <div >

                <p class="text-left-help">
                    <span class="profile-icon">

                        <a href="" class="image-container-post"><img src="profile.jpg" /></a>
                        <button href="" class="three-dot"  data-toggle="dropdown">
                            <i class="fas fa-ellipsis-v"></i>

                        </button>
                        
                        <span class="dropdown-menu">
                          <a class="dropdown-item" href="#">Action</a>
                          <a class="dropdown-item" href="#">Another action</a>
                          <a class="dropdown-item" href="#">Something else here</a>
                        </span>
                        
                        <label class="p-name">Email<p class="date">11 march at 12:33</p></label>   

                    </span>
                   
                
                    <p  class="text-left-help">
                    If any emergency case hospital can't arrange  blood, and the human who can't afford blood,
                                         in that case hospital/human can post her/him problem and blood group on bloodghar.com, In
                                         a few second we notified nearest person who want to help her/him.</p></p>
            </div>

            <div >
                <iframe class="size" src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" allowfullscreen></iframe>
            </div>
            <div class="post-icon-margin container">
                <a href="" class="help-post-icon1"><i class="fa fa-phone" aria-hidden="true"></i><span class="help-icon-text">Call</span> </a>
                <a href="" class="help-post-icon2"><i class="fa fa-comment" aria-hidden="true"></i> <span class="help-icon-text">message</span></a>
                <a href="" class="help-post-icon3"><i class="fa fa-share" aria-hidden="true"></i><span class="help-icon-text">share</span> </a>
            </div>

        </div>
        
        
        <br><br>
        <!-- footer -->
   <nav id="mainNavbar" class="navbar navbar-expand-lg navbar-light bg-light fixed-bottom">
        <div class="container">
            <footer class="blockquote-footer">The design and developer by <cite title="Source Title">MD FAIZAN and MD NADEEM HASAN</cite></footer>
        </div>
        
    </nav>

<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
    <script>
        const realFileBtn = document.getElementById("real-file");
        const customBtn = document.getElementById("custom-button");
        const customTxt = document.getElementById("custom-text");

        customBtn.addEventListener("click", function() {
          realFileBtn.click();
        });

        realFileBtn.addEventListener("change", function() {
          if (realFileBtn.value) {
            customTxt.innerHTML = realFileBtn.value;
          } else {
            customTxt.innerHTML = "No file chosen.";
          }
        });

    </script>
    
    
</body>

</html>
<%
    
    }
else{
 session.setAttribute("msg", "Please Login First");
                response.sendRedirect("home.jsp");
}
%>