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
    
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css\create_account.css">
    <link rel="stylesheet" href="css\edit.css">
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
       <%
            String msg=(String)session.getAttribute("msg");
            if(msg!=null)  
            {
        %>
        <div class="panel panel-danger">
            <div class="panel-heading text-center">
                <p><%=msg%></p>
            </div>
        </div>
        <%
            session.setAttribute("msg", null);
            }
        %>
  
        
       
    <!--profile detail-->
    <form  action="Update" method='post' class="container create-margin">
        <div class="margin-donator text40">
            <strong class="text-color-red">Update your profile</strong>
        </div>
        
        <div class="form-group row">
          <label for="text" class="col-sm-3 col-form-label">Name</label>
          <div class="col-sm-9">
              <input type="text" name="name" class="form-control" id="text" placeholder="Enter your Name">
          </div>
        </div>
        <div class="form-group row">
          <label for="number" class="col-sm-3 col-form-label">Number</label>
          <div class="col-sm-9">
              <input type="phone" name="number" class="form-control" id="number" placeholder="Enter your number">
          </div>
        </div>
        
        <div class="form-group row">
          <label for="dateofbirth" class="col-sm-3 col-form-label">DOB</label>
          <div class="col-sm-9">
              <input type="text" name="dob" class="form-control" id="dateofbirth" placeholder="DD/MM/YYYY">
          </div>
        </div>

        
        <fieldset class="form-group">
          <div class="row">
            <legend class="col-form-label col-sm-3 pt-0">Gender</legend>
            <div class="col-sm-9">
              <div class="form-check">
                <input class="form-check-input" type="radio" name="gender" id="gridRadios1" value="Male" checked>
                <label class="form-check-label" for="gridRadios1">Male</label>
                <input class="form-check-input" type="radio" name="gender" id="gridRadios2" value="Female">
                <label class="form-check-label" for="gridRadios2">Female</label>
                <input class="form-check-input" type="radio" name="gender" id="gridRadios2" value="Other">
                <label class="form-check-label" for="gridRadios2">Other</label>
              </div>
            </div>
          </div>
        </fieldset>
        
        <div class="form-group row">
            <label for="inputGender3" class="col-sm-3 col-form-label">Blood</label>
            <div id='inputGender3' class="col-sm-9">
                <select class="custom-select" name="blood">
                    <option value="0"selected>Please select your Blood Group</option>
                    <option value="O+">O+</option>
                    <option value="O-">O-</option>
                    <option value="A+">A+</option>
                    <option value="A-">A-</option>
                    <option value="B+">B+</option>
                    <option value="B-">B-</option>
                    <option value="AB+">AB+</option>
                    <option value="AB-">AB-</option>
                    <option value="1">Don't know</option>
                </select>
            </div>
            
        </div>
        
        <div class="form-group row">
          <label for="state" class="col-sm-3 col-form-label">State</label>
          <div class="col-sm-9">
              <input type="text" name="state" class="form-control" id="state" placeholder="Enter your state">
          </div>
        </div>
        
        <div class="form-group row">
          <label for="city" class="col-sm-3 col-form-label">City</label>
          <div class="col-sm-9">
              <input type="text" name="city" class="form-control" id="number" placeholder="Enter your city" >
          </div>
        </div>
        
        <div class="form-group row">
          <label for="pin" class="col-sm-3 col-form-label">Pin-code</label>
          <div class="col-sm-9">
              <input type="phone" name="pin_code" class="form-control" id="pin" placeholder="Enter your pincode">
          </div>
        </div>
            
         <div class="button-paddin-create">
            <button type="submit" class="btn btn-primary" value='Update'>Update</button>
        </div>
    </form>
    <br>
    <br>
    <br>
		
		
		 
    
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