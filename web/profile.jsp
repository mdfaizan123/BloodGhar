<%@page import="java.util.HashMap"%> 
<%  
    String checkFollower=(String)session.getAttribute("checkFollower");
    HashMap follower=(HashMap)session.getAttribute("follower"); 
    HashMap hm=(HashMap)session.getAttribute("userDetails"); 
    HashMap pb=(HashMap)session.getAttribute("publicDetails"); 
     if(hm!=null){
         java.util.ArrayList<java.util.HashMap> allId=(java.util.ArrayList)session.getAttribute("allId");
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
    <link rel="stylesheet" href="css/profile.css">  
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
                    <li class="nav-item">
                        <a class="nav-link" href="Friend?id=<%if(hm!=null){%><%=hm.get("id")%><%}%>">message</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="donator.jsp">Donator</a>
                    </li>
                    <li class="nav-item active">
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
                               
    <!--profile back-->
    <div class="pjumbotron-profile border border-dark d-flex flex-column justify-content-start">
        
        <span class="cursor" href="view.jsp" data-toggle="dropdown"><img src="img\slide_img1.jpg" class="w-100" alt="..."></span>
        <span class="dropdown-menu">
            <span class="dropdown-item cursor" data-toggle="modal" data-target="#backBoxProfile">open gallery</span>
        </span>
        
    </div>
    
   
    <!--profile photo front-->
    <div class="img-border">
        <span class="center cursor"  data-toggle="dropdown"><img  class="center" src="profile.jpg"  alt="..."></span>
        <span class="dropdown-menu">
            <span class="dropdown-item cursor" data-toggle="modal" data-target="#frontBoxProfile">open gallery</span>
        </span>
    </div>
    
    <div class="container text-color-red">
        <h4 ><%=pb.get("name")%></h4>
    </div>
     
    
    <!-- friend request row-->
    
    <div class="pjumbotron-add border border-dark d-flex flex-column flex-md-row justify-content-start">
        <button href="" class="three-dot-h"  data-toggle="dropdown">
                        <i class="fas fa-ellipsis-h"></i>

         </button>
        
        <span class="dropdown-menu">
            <a href="#" class="dropdown-item cursor">send message</a>
            <span class="dropdown-item cursor" data-toggle="modal" data-target="#reportBoxProfile">report</span>
        </span>
        
        <div id="profilebar">
            <%
                if(pb.get("id").equals(hm.get("id"))) { %>

                <button class="user" style="width: auto">Add Story</button>

            <% }else {%>


            <button class="message"><i class="far fa-comment-alt"></i></button>

            <% if(checkFollower.equals("yes")) { %>
            <div  onclick="sendInfo('RemoveFollower')">
                <button class="user">Unfollow</button>
            </div>

            <% } else{ %>
            <div  onclick="sendInfo('UpdateFollower')">
                <button class="user"><i class="fas fa-user-plus"></i></button>
            </div>

            <% } }%>
        
        </div> 
    </div>
            
    <!-- Modal back -->
   
        <div class="modal fade" id="backBoxProfile" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">Report</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                    </div>
                    <div class="modal-body">
                        <div >
                            <img class="size" id="preview" src="profile.jpg">
                        </div>
                    </div>
                    <form class="modal-footer upload-image-gallery">
                        <input type="file" name="photo" id="real-file" hidden="hidden"  accept="image/*,video/mp4,video/x-m4v,video/*">
                        <div class="gallery cursor"  id="custom-button"><i class="fas fa-folder"></i></div>
                        <div  class="btn" onclick="#">
                            <img style="border-radius:50px" width="33px" height="33px" src="img/mic.png" class="mic">
                        </div>
                    </form>
                  </div>
            </div>
        </div>
    <!--modal end-->
            
    <!-- Modal front -->
   
        <div class="modal fade" id="frontBoxProfile" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">Report</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                    </div>
                    <div class="modal-body">
                        <div >
                            <img class="size" id="preview-front" src="profile.jpg">
                        </div>
                    </div>
                    <form class="modal-footer upload-image-gallery">
                        <input type="file" name="photo" id="real-file-front" hidden="hidden"  accept="image/*,video/mp4,video/x-m4v,video/*">
                        <div class="gallery cursor"  id="custom-button-front"><i class="fas fa-folder"></i></div>
                        <div  class="btn" onclick="#"><img style="border-radius:50px" width="33px" height="33px" src="img/mic.png" class="mic"></div>
                    </form>
                  </div>
            </div>
        </div>
    <!--modal end-->
            
    <!-- Modal report -->
   
        <div class="modal fade" id="reportBoxProfile" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">Report</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                    </div>
                    <div class="modal-body">
                        <% for(int i=0;i<19;i++){%>
                        <!--<div class="report">-->
                            <div >
                                <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
                                <label for="vehicle1"> I have a bike</label>
                            </div>
                        <!--</div>-->
                        <%}%>
                    </div>
                    <div class="modal-footer">
                            <form  class="comment-footer">
                                    <textarea  id="commentText" placeholder="Describe more" autofocus></textarea>
                                    <span  class="btn" onclick="#"><img style="border-radius:50px" width="33px" height="33px" src="img/mic.png" class="mic"></span>
                            </form>

                    </div>
                    
                  </div>
            </div>
        </div>
    <!--modal end-->
    
    <!-- profile status-->
    
    <div class="pjumbotron d-flex flex-column flex-md-row justify-content-start" style="background-color: white">
        <% if(pb.get("state")!=null){ %>
            <h6>currently live in <b class="p-status"><%=pb.get("state")%></b><h6>
        <%  } %>
        
    </div>
    
    <br>
    
    <div class="pjumbotron" style="background-color: white">
        <ul class="nav nav-tabs justify-content-center" id="h" style="font-size: 14px">
            <li class="nav-item ">
              <a class="nav-link active" id="post" href="profile.jsp">Posts</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="follwers" href="Follower?id=<%=pb.get("id")%>">Followers(<%=follower.get("fr")%>)</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="following" href="Following?id=<%=pb.get("id")%>">Following(<%=follower.get("fg")%>)</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="tags" href="tags">Tags</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="edit" href="edit.jsp">Edit</a>
            </li>
        </ul>
    </div>
    
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
               
    
    <!--picture-->
    <section id="gallery">
       <div class="pjumbotron" style="background-color: white">
            <div class="row">
                <%
                
               if(allId!=null)   { %>
               <% for(HashMap ud:allId) { %>
               
                <div class="col-lg-4 col-md-4 col-sm-4 col-4">
                    <div class="card">
                        <a href="FullProfile?id=<%=pb.get("id")%>"><img class="card-img-top" src="GetPost?id=<%=ud.get("p_id")%>" alt="image"></a>
                    </div>
                </div>
               <% } } %>
                
           </div>
       </div>
    </section>
    
    
    
</body> 
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/profile.js"></script>

</html>
<%
    
    }
else{
 session.setAttribute("msg", "Please Login First");
                response.sendRedirect("login.jsp");
}
%>