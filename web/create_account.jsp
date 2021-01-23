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
    <link rel="stylesheet" href="css\create_account.css">
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
                        <a class="nav-link" href="help.jsp">Help Emergency</a>
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
                    </span>
                </ul>
            </div>
        </div>
        
    </nav>
    
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
    
    <!--create page-->
    <form  action="Register" method='post' class="container create-margin">
        <div class="margin-donator text40">
            <strong class="text-color-red">Create an accoount</strong>
        </div>
        
        <div class="form-group1 row">
          <label for="exampleInputEmail1" class="col-sm-2 col-form-label">Email</label>
          <div class="col-sm-10">
              <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your email" required>
          </div>
        </div>
        
        <div class="form-group row">
          <label for="name" class="col-sm-2 col-form-label">Name</label>
          <div class="col-sm-10">
              <input type="name" name="name" class="form-control" id="name" placeholder="Enter your name" required>
          </div>
        </div>
        
        <div class="form-group row">
          <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
          <div class="col-sm-10">
              <input type="password" name="password" class="form-control" id="inputPassword3" placeholder="Enter your password" required>
          </div>
        </div>
        
        
        <div class="button-paddin-create">
            <button type="submit" class="btn btn-primary" value='Register'>Sign Up</button>
        </div>
    </form>
    <br>
    <br>
    <br>
    <!-- footer -->
    <nav id="mainNavbar" class="navbar navbar-expand-lg navbar-light bg-light fixed-bottom">
        <div class="container">
            <footer class="blockquote-footer">The design and developer by <cite title="Source Title">MD FAIZAN and MD NADEEM HASAN</cite></footer>
        </div>
        
    </nav>
   
   
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
</body>

</html>