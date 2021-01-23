<%@page import="java.util.HashMap"%> 
<%
    HashMap hm=(HashMap)session.getAttribute("userDetails");
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
                    <li class="nav-item active">
                        <a class="nav-link" href="home.jsp">Home<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="help.jsp">Help Emergency</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="Feed">News feed</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Friend?id=<%if(hm!=null){%><%=hm.get("id")%><%}%>">message</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="" id="ntfn">Notification</a>
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
   <!-- Searching bar -->
   <%if(hm!=null){%>
   <input id="id" type="hidden" value="<%=hm.get("id")%>">
   <%}%>
    <div class="input-group col-log-4 mb-4 container">
        
        <input type="text" placeholder="Searching for nearest Hospital" class="form-control" aria-label="Amount (to the nearest dollar)">
        <div class="input-group-append">
            <span class="input-group-text"><a href="hospital_list.jsp"><i class="fa fa-search" aria-hidden="true"></i></a></span>
        </div>
    </div>
   
        
    
   <!-- slide bar -->
   <div class="container">
        <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
              <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
              <div class="carousel-item active">
                    <img src="img\slide_img1.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h5>Blood Donation</h5>
                  <p>Blood donation is a safe and simple way to help is to become a donor yourself</p>
                </div>
              </div>
              <div class="carousel-item">
                    <img src="img\slide_img2.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h5>Blood Donation</h5>
                  <p>Blood donation is a safe and simple way to help is to become a donor yourself</p>
                </div>
              </div>
              <div class="carousel-item">
                   <img src="img\slide_img3.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h5>Blood Donation</h5>
                  <p>Blood donation is a safe and simple way to help is to become a donor yourself</p>
                </div>
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
        </div>
   </div>
   
   
   <!-- VIDEO -->
    <section class="margin">
       <div class="container">
            <div class="row">
                <div class="col-lg-6 mb-4">
                    <div class="card-body">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-6 mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Our Purpose</h5>
                        <p class="card-text">If any emergency case hospital can't arrange blood, and the human who can't afford blood,
                                             in that case hospital/human can post her/him problem and blood group on bloodghar.com, In
                                               a few second we notified nearest person who want to help her/him.
                                               <br><br>
                                               We have also provide a location of blood donor camp near you.
                         </p>
                         <br><br>
                        <a href="" class="btn btn-outline-success btn-sm">Go to our YouTube channel</a>
                    </div>
                </div>
            </div>
       </div>
    </section>
   
   <!--card heading-->
   <div class="container">
       <h1 class="display-4 text-center">Explore types of blood below</h1>
   </div>
   <!--rotate card-->
   
   
   <section id="gallery">
       <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
                    <div class="card rotate" style="margin-left: auto;margin-right: auto;">
                        <div class="front ">
                            <img  src="img\o1.jpg" alt="">
                        </div>
                        
                        <div class="card-body back">
                            <div>
                                <h5 class="card-title slide-text">28% of the India population has O+ blood</h5>
                                <p class="card-text card-slide-color">• It is the most common and transfused blood type. It can be given to most patients.
                                    Whole blood and double red cell needed most.
                                </p>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
                    <div class="card rotate" style="margin-left: auto;margin-right: auto;">
                        <div class="front ">
                            <img  src="img\o2.jpg" alt="">
                        </div>
                        
                        <div class="card-body back">
                            <div>
                                <h5 class="card-title slide-text">2% of the India population has O- blood</h5>
                                <p class="card-text card-slide-color">• It is the universal red blood cell donor. It can be given to all patients and it can only receive
                                                    O- blood. Whole blood and double red cells needed most.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
                    <div class="card rotate" style="margin-left: auto;margin-right: auto;">
                        <div class="front ">
                            <img  src="img\o3.jpg" alt="">
                        </div>
                        <div class="card-body back">
                            <div>
                                <h5 class="card-title slide-text">21% of the India population has A+ blood</h5>
                                <p class="card-text card-slide-color">• Tremendous demand for A+ platelets. It's the 2nd most common blood type. Consider platelet
                                            pheresis as the best way to help.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
                    <div class="card rotate" style="margin-left: auto;margin-right: auto;">
                        <div class="front ">
                            <img  src="img\o4.jpg" alt="">
                        </div>
                        <div class="card-body back">
                            <div>
                                <h5 class="card-title slide-text">0.5% of the India population has A- blood</h5>
                                <p class="card-text card-slide-color">• It is the rare blood type. Donate whole blood or automated red cells. Plasma and platelet
                                                         pheresis are also needed.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                
                
            </div>
       </div>
    </section>
   
   
   <section id="gallery">
       <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
                    <div class="card rotate" style="margin-left: auto;margin-right: auto;">
                        <div class="front ">
                            <img  src="img\o5.jpg" alt="">
                        </div>
                        <div class="card-body back">
                            <div>
                                <h5 class="card-title slide-text">38% of the India population has B+ blood</h5>
                                <p class="card-text card-slide-color">• It can be donate only to B+ and AB+ patient and receive most blood types. Donate platelets,
                                                plasma and red cells.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
                    <div class="card rotate" style="margin-left: auto;margin-right: auto;">
                        <div class="front ">
                            <img  src="img\o6.jpg" alt="">
                        </div>
                        <div class="card-body back">
                            <div>
                                <h5 class="card-title slide-text">2% of the India population has B- blood</h5>
                                <p class="card-text card-slide-color">• It is the very rare blood type. Donate whole blood or automated red cells. Plasma and platelet
                                                                    pheresis are also needed.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
                    <div class="card rotate" style="margin-left: auto;margin-right: auto;">
                        <div class="front ">
                            <img  src="img\o7.jpg" alt="">
                        </div>
                        <div class="card-body back">
                            <div>
                                <h5 class="card-title slide-text">9% of the India population has AB+ blood</h5>
                                <p class="card-text card-slide-color">• It is the very rare blood type. It can donate only to AB+ patients. Universal Plasma donor.
                                                     The best way to help plasma.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
                    <div class="card rotate" style="margin-left: auto;margin-right: auto;">
                        <div class="front">
                            <img  src="img\o8.jpg" alt="">
                        </div>
                        <div class="card-body back">
                            <div>
                                <h5 class="card-title slide-text">0.4% of the India population has AB- blood</h5>
                                <p class="card-text card-slide-color">• It is the rarest of blood types. It can donate only to AB patients. Universal Plasma donor.
                                                            The best way to help plasma.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                
                
            </div>
       </div>
    </section>
   
   <br><br><br>
   
   <!--text-->
   <div class="jumbotron">
       <p class="lead">Thank you for helping to donate with bloodghar.com . Please read the guidelines to ensure you are ready to donate. Your donation can save up to
           life and you are sure to get that amazing feeling of accomplishment and satisfaction for helping.</p>
   </div>
   
   
    
   <!-- footer -->
   <nav id="mainNavbar" class="navbar navbar-expand-lg navbar-light bg-light fixed-bottom">
        <div class="container">
            <footer class="blockquote-footer">The design and developer by <cite title="Source Title">MD FAIZAN and MD NADEEM HASAN</cite></footer>
        </div>
        
    </nav>
   
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/notification.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
    
    
</body>

</html>