<%@page import="java.util.HashMap"%> 
<%
    
    HashMap hm=(HashMap)session.getAttribute("userDetails");
     if(hm!=null){
         java.util.ArrayList<java.util.HashMap> allFedds=(java.util.ArrayList)session.getAttribute("allFedds");
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
    <link rel="stylesheet" href="css\feed.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css\help.css">
    
    
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
                    
                    <li class="nav-item active">
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
    <!--search bar-->
    <div class="pjumbotron" style="background-color: white">
        <div class="input-group">
        
        <input type="text" placeholder="Searching people" class="form-control" aria-label="Amount (to the nearest dollar)">
        <div class="input-group-append">
            <span class="input-group-text"><a href="hospital_list.jsp"><i class="fa fa-search" aria-hidden="true"></i></a></span>
        </div>
    </div>
    </div>
    
   
       
       
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

                <input type="file" name="photo" id="real-file" hidden="hidden"  accept="image/*,video/mp4,video/x-m4v,video/*">

                <span  class="btn btn-info" id="custom-button"><i class="fas fa-video"></i> Chose media</span>


                <button class="btn btn-info"><i class="fas fa-upload"></i> Post</button>
            </div>
        </form>    

   
    <!--post image-->
    <% if(allFedds!=null)   {
    for(HashMap pb:allFedds) { %>
    
    <div class="pjumbotron " id="<%= pb.get("p_id") %>">
        <div >
            <p class="text-left-help">
                <span class="profile-icon">

                    <a href="SearchPost?id=<%= pb.get("id") %>" class="image-container-post"><img src="GetPost?id=<%= pb.get("p_id") %>" /></a>
                    <button class="three-dot"  data-toggle="dropdown">
                        <i class="fas fa-ellipsis-v"></i>
                    </button>

                    <span class="dropdown-menu">
                      <span class="dropdown-item cursor">delete</span>
                      <span class="dropdown-item cursor" data-toggle="modal" data-target="#reportBox">report</span>
                    </span>

                    <label class="p-name"><%= pb.get("name") %><p class="date"><%= pb.get("date") %></p></label>   

                </span>

                <p  class="text-left-help"><%= pb.get("text") %></p></p>
        </div>

        <div >
            <img class="size" src="GetPost?id=<%= pb.get("p_id") %>">
        </div>
        
        <!--post icon like share comment-->
        
        <div class="post-icon-margin container" style="color: gray">
            <div class="countLCS">
                <div class="seeLikes"  data-toggle="modal" data-target="#likeBox"><%= pb.get("totalLike") %> likes</a></div>
                <div><%= pb.get("totalComment") %> comment</div>
                <div><%= pb.get("totalShare") %> share</div>
            </div>
            <hr>
            <span class="feedlike" >
                <% if(pb.get("checkLike").equals("no")) { %>
                    <span class="help-post-icon1 cursor " onclick="sendInfoPost('AddLike','<%= pb.get("p_id") %>')">
                        <i class="far fa-thumbs-up"></i><span class="help-icon-text">Like</span>
                    </span>
                <% }else {%>
                    <span class="help-post-icon1 cursor removelike" onclick="sendInfoPost('RemoveLike','<%= pb.get("p_id") %>')">
                        <i class="fas fa-thumbs-up"></i><span class="help-icon-text">Like</span>
                    </span>
                <% } %>
            </span>
            <span class="help-post-icon2 cursor"  data-toggle="modal" data-target="#commentBox" onclick="sendInfoPost('GetComment','<%= pb.get("p_id") %>')">
                <i class="far fa-comment-alt"></i><span class="help-icon-text">message</span>
            </span>
            <span class="help-post-icon3 cursor" data-toggle="dropdown">
                <i class="fa fa-share" aria-hidden="true"></i><span class="help-icon-text" >share</span> 
            </span>
            <span class="dropdown-menu">
                <span class="dropdown-item cursor">share now in time line</span>
                <span class="dropdown-item cursor" data-toggle="modal" data-target="#shareBox">share in message</span>
            </span>
        </div>
        <!--end-->
    </div>
    <% } }else{
              out.println("dkhdk"); %>
   <% } %>
   
   <!-- Modal reportComment -->
   
        <div class="modal fade" id="reportCommentBox" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
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
   
   <!-- Modal report -->
   
        <div class="modal fade" id="reportBox" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
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
   
   <!-- Modal share -->
   
        <div class="modal fade" id="shareBox" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">share in message</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                    </div>
                    <div class="modal-body">
                        <% for(int i=0;i<19;i++){%>
                        <div class="list-people-feed">
                            <a href="" ><img src="profile.jpg" /></a>
                            <label class="p-name-f-feed"> md faizan <p class="tag-feed">@faizan</p></label> 
                            <button class="btn btn-info-feed btn-sm">Remove</button>
                            
                        </div>
                        <%}%>
                    </div>
                    
                  </div>
            </div>
        </div>
    <!--modal end-->
   
   <!-- Modal like -->
   
        <div class="modal fade" id="likeBox" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">like <span>999k</span></h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                    </div>
                    <div class="modal-body">
                        <% for(int i=0;i<19;i++){%>
                        <div class="list-people-feed">
                            <a href="" ><img src="profile.jpg" /></a>
                            <label class="p-name-f-feed"> md faizan <p class="tag-feed">@faizan</p></label> 
                            <button class="btn btn-info-feed btn-sm">Remove</button>
                            
                        </div>
                        <%}%>
                    </div>
                    
                  </div>
            </div>
        </div>
    <!--modal end-->

   
   <!-- Modal comment -->
   
        <div class="modal fade" id="commentBox" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalScrollableTitle">Comment <span>999k</span></h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                    </div>
                    <div class="modal-body">

                        <div class="chatMessageBox">
                            <a href="" class="image-container-comment"><img  src="profile.jpg" /></a>
                            <span class="commentMessage"> <div class="name_lebal">md faizan</div> hello kaha h kab araha hkaha h kab araha hkaha h kab araha hkaha h kab araha hkaha h kab araha h</span>
                            
                        </div>
                        
                        <div class="comment-delete">
                            <span class="comment-delete-like" data-toggle="modal" data-target="#reportCommentBox" data-dismiss="modal"><i class="far fa-flag"></i></span>
                            
                            <span class="comment-delete-like" data-toggle="dropdown">
                                <span><i class="fas fa-trash-alt"></i></span>
                            </span>
                            <span class="dropdown-menu">
                                <span class="dropdown-item cursor">Delete</span>
                            </span>
                            <span class="comment-delete-like"><span>999k </span><i class="far fa-thumbs-up"></i></span>
                        </div>
                        <div class="chatMessageBox">
                            <a href="" class="image-container-comment"><img  src="profile.jpg" /></a>
                            <span class="commentMessage">hello</span>
                        </div>
                        <div class="comment-delete">
                            <span class="comment-delete-like" data-toggle="modal" data-target="#reportCommentBox"><i class="far fa-flag"></i></span>
                            <span class="comment-delete-like" data-toggle="dropdown">
                                <span><i class="fas fa-trash-alt"></i></span>
                            </span>
                            <span class="dropdown-menu">
                                <span class="dropdown-item cursor">Delete</span>
                            </span>
                            <span class="comment-delete-like"><span>999k </span><i class="far fa-thumbs-up"></i></span>
                        </div>
                    </div>
                    <div class="modal-footer">
                            <form  class="comment-footer">
                                    <textarea  id="commentText" placeholder="Type a message" autofocus></textarea>
                                    <span  class="btn" onclick="#"><img style="border-radius:50px" width="33px" height="33px" src="img/mic.png" class="mic"></span>
                            </form>

                    </div>
                  </div>
            </div>
        </div>
    <!--modal end-->
   
   <div id="s">
                                
   </div>
                            
   
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/notification.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/feed.js"></script>
</body>

</html>
<%
    
    }
else{
 session.setAttribute("msg", "Please Login First");
                response.sendRedirect("home.jsp");
}
%>