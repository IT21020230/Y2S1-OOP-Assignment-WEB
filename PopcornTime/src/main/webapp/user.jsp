<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
    
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>

<%@ page import="jakarta.servlet.http.HttpServlet"%>

<%@ page import="com.popcorntime.dbutil.DBConnectUtil"%>

<%
	if (session == null || session.getAttribute("sessionRole") == null) {
	    response.sendRedirect("http://localhost:8090/PopcornTime/loginregister.jsp");
	}
%>

<%
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null; 
%>

<c:forEach var="user" items="${user}">
			<c:set var="id" value="${user.id}"/>
			<c:set var="name" value="${user.username}"/>
			<c:set var="email" value="${user.email}"/>
			<c:set var="role" value="${user.role}"/>
</c:forEach>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">

    <!-- ===== Mobile viewport optimized ===== -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no">

    <!-- ===== Website Title ===== -->
    <title>${name}</title>

    <!-- ===== Favicon & Different size apple touch icons ===== -->
    <link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">
    <link rel="icon" sizes="192x192" href="assets/images/icon-hd.png">
    <link rel="icon" sizes="128x128" href="assets/images/icon.png">

    <!-- ===== Google Fonts ===== -->
    <link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">

    <!-- ===== CSS links ===== -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/revolution/css/settings.css">
    <link rel="stylesheet" type="text/css" href="assets/revolution/css/layers.css">
    <link rel="stylesheet" type="text/css" href="assets/revolution/css/navigation.css">
    <link rel="stylesheet" type="text/css" href="assets/css/magnific-popup.css">
    <link rel="stylesheet" type="text/css" href="assets/css/jquery.mmenu.css">
    <link rel="stylesheet" type="text/css" href="assets/css/owl.carousel.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="assets/css/responsive.css">
</head>

<body>


    <!-- =============== START OF PRELOADER =============== -->
    <div class="loading">
        <div class="loading-inner">
            <div class="loading-effect">
                <div class="object"></div>
            </div>
        </div>
    </div>
    <!-- =============== END OF PRELOADER =============== -->



    <!-- =============== START OF RESPONSIVE - MAIN NAV =============== -->
    <nav id="main-mobile-nav"></nav>
    <!-- =============== END OF RESPONSIVE - MAIN NAV =============== -->



    <!-- =============== START OF WRAPPER =============== -->
    <div class="wrapper">


        <!-- =============== START OF HEADER NAVIGATION =============== -->
        <!-- Insert the class "sticky" in the header if you want a sticky header -->
        <header class="header header-fixed header-transparent text-white">
            <div class="container-fluid">

                <!-- ====== Start of Navbar ====== -->
                <nav class="navbar navbar-expand-lg">

                    <a class="navbar-brand" href="index.html">
                        <!-- INSERT YOUR LOGO HERE -->
                        <img src="assets/images/logo.png" alt="logo" width="150" class="logo">
                        <!-- INSERT YOUR WHITE LOGO HERE -->
                        <img src="assets/images/logo-white.png" alt="white logo" width="150" class="logo-white">
                    </a>
                    
                    <!-- Login Button on Responsive -->
                    <a href="#login-register-popup" class="login-mobile-btn popup-with-zoom-anim"><i class="icon-user"></i></a>

                    <button id="mobile-nav-toggler" class="hamburger hamburger--collapse" type="button">
                       <span class="hamburger-box">
                          <span class="hamburger-inner"></span>
                       </span>
                    </button>

                    <!-- ====== Start of #main-nav ====== -->
                    <div class="navbar-collapse" id="main-nav">

                        <!-- ====== Start of Main Menu ====== -->
                        <ul class="navbar-nav mx-auto" id="main-menu">
                            <!-- Menu Item -->
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath }/">Home</a>
                            </li>                        

                            <!-- Menu Item -->
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath }/movies.jsp">Movies</a>
                            </li>

                            <!-- Menu Item -->
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath }/tvshows.jsp">TV Series</a>
                            </li>
                        </ul>
                        <!-- ====== End of Main Menu ====== -->


                        <!-- ====== Start of Extra Nav ====== -->
                        <ul class="navbar-nav extra-nav">
                        <%
      						if (session != null) {
         						if (session.getAttribute("sessionUsername") != null) {
            						String sessionUsername = (String) session.getAttribute("sessionUsername");
            					%>
            					<!-- Menu Item -->
                            <li class="nav-item m-auto">
                            	<form action="user" method="get">                   
                                <input type="hidden" id="sessionUsername" name="sessionUsername" value="<%=sessionUsername%>">
                                
                                <input type="submit" value="<%=sessionUsername%>" name="submitLogin" class="btn btn-main btn-effect nomargin"/>
                                
                                </form>
                                
                            </li>
            				<li class="nav-item m-auto">
            					<form action="logout" method="post">
                                	<button class="btn btn-main btn-effect" type="submit" name="btnLogout" value="logout">Logout</button>
                                </form>
            				</li>	
            					<% 
        						 } else {
            					%>
            					<li class="nav-item m-auto">
                                <a href="#login-register-popup" class="btn btn-main btn-effect login-btn popup-with-zoom-anim">
                                    <i class="icon-user"></i>login
                                </a>
                            </li>
            					<%
         						}
     						 }
   							%>
                            
                        </ul>
                        <!-- ====== End of Extra Nav ====== -->

                    </div>
                    <!-- ====== End of #main-nav ====== -->
                </nav>
                <!-- ====== End of Navbar ====== -->

            </div>
        </header>
        <!-- =============== END OF HEADER NAVIGATION =============== -->

		

        <!-- =============== START OF MOVIE DETAIL INTRO =============== -->
        <section class="celeb-detail-intro overlay-gradient ptb100" style="background: url(media/celebrities/banners/${bannerImage});">
        </section>
        <!-- =============== END OF MOVIE DETAIL INTRO =============== -->



        <!-- =============== START OF CELEBRITY DETAIL =============== -->
        <section class="celeb-detail pb100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-12">
                        <div class="celeb-details">
                            <h3 class="title">Hello ${name}</h3>
                            <span class="profession">
                            
                            </span>
                            

                            <!-- tab links -->
                            <ul class="nav tab-links">
                                <li class="nav-item">
                                    <a class="nav-link active" id="bio-tab" data-toggle="tab" href="#bio" aria-controls="bio" aria-expanded="false">User Details</a>
                                </li>
                                <%
      						if (session != null) {
         						if (!session.getAttribute("sessionRole").equals("u")) {
            					%>
                                <li class="nav-item">
                                    <a class="nav-link" id="movie-tab" data-toggle="tab" href="#movies" aria-controls="movies" aria-expanded="false">Movies</a>
                                </li>             
                                <li class="nav-item">
                                    <a class="nav-link" id="tvshow-tab" data-toggle="tab" href="#tvshows" aria-controls="tvshows" aria-expanded="false">TV Series</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="celebrity-tab" data-toggle="tab" href="#celebrities" aria-controls="celebrities" aria-expanded="false">Celebrities</a>
                                </li>
                                <%
         						}
     						 }
     						 %>         
     						 <%
                                if (session != null) {
         						if (session.getAttribute("sessionRole").equals("m")) {
            					%>                     
                                <li class="nav-item">
                                    <a class="nav-link" id="user-tab" data-toggle="tab" href="#users" aria-controls="users" aria-expanded="false">Users</a>
                                </li>
                                <%
         						}
     						 }
     						 %>
                            </ul>

                            <!-- Tab Content -->
                            <div class="tab-content mt70">

                                <div class="tab-pane fade active show" id="bio" role="tabpanel" aria-labelledby="bio-tab" aria-expanded="false">

                                    <div class="bio-details">
                                        <ul class="bio-wrapper">
                                        	<li><h6>User ID: ${id}</h6></li>
                                            <li><h6>Username: ${name}</h6></li>                                            
                                            <li><h6>Email: ${email}</h6></li>
                                            <%
                            if (session.getAttribute("sessionRole") != null) {
            						
            					%>
                                            <li><a href="${pageContext.request.contextPath}/manageuser.jsp?user_id=${id}&username=${name}&role=${role}" class="btn btn-main btn-effect">Manage Content</a></li>
                                        <%
            						
                            }
                            %>
                                        </ul>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>
                                
                                <%
      						if (session != null) {
         						if (!session.getAttribute("sessionRole").equals("u")) {
            					%>

                                <div class="tab-pane fade" id="movies" role="tabpanel" aria-labelledby="movie-tab" aria-expanded="false">
                                    <ul class="film-list">
                                    	<li><a href="addmovie.jsp" class="btn btn-main btn-effect mt20">Add New Movie</a></li>
                                    	<%
					try{
						connection = DBConnectUtil.getConnection();
						statement=connection.createStatement();
						String sql ="select movie_id, name from movietb";
						resultSet = statement.executeQuery(sql);
						int seasons = 0;
						while(resultSet.next()){								
					%>
                                        <li><a href="${pageContext.request.contextPath }/movie?movie_id=<%=resultSet.getString("movie_id")%>"><%=resultSet.getString("name")%></a>
                                        <a href="${pageContext.request.contextPath}/managemovie.jsp?movie_id=<%=resultSet.getString("movie_id")%>">
                                        <span class="year">Edit</span>
                                       </a> 
                                       </li>
                                        <%
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
         						}
      						}
				%>
                                    </ul>
                                </div>
                               
                               <%
      						if (session != null) {
         						if (!session.getAttribute("sessionRole").equals("u")) {
            					%>
                                <div class="tab-pane fade" id="tvshows" role="tabpanel" aria-labelledby="tvshow-tab" aria-expanded="false">
                                    <ul class="film-list">
                                    <li><a href="addtvshow.jsp" class="btn btn-main btn-effect mt20">Add New TV Series</a></li>
                                    <%
					try{
						String sql ="select tvseries_id, name from tvseriestb";
						resultSet = statement.executeQuery(sql);
						int seasons = 0;
						while(resultSet.next()){								
					%>
                                        <li><a href="${pageContext.request.contextPath }/tvshow?tvseries_id=<%=resultSet.getString("tvseries_id")%>"><%=resultSet.getString("name")%></a>
                                        <a href="${pageContext.request.contextPath}/managetvshow.jsp?tvseries_id=<%=resultSet.getString("tvseries_id")%>">
                                        <span class="year">Edit</span>
                                       </a> 
                                       </li>    
                                       
                                       <%
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
         						}
      						}
				%>                           
                                    </ul>
                                    
                                    
                                </div>
                                
                                <%
      						if (session != null) {
         						if (!session.getAttribute("sessionRole").equals("u")) {
            					%>
                               
                                <div class="tab-pane fade" id="celebrities" role="tabpanel" aria-labelledby="celebrity-tab" aria-expanded="false">
                                    <ul class="film-list">
                                    <li><a href="addcelebrity.jsp" class="btn btn-main btn-effect mt20">Add New Celebrity</a></li>
                                    <%
					try{
						String sql ="select celebrity_id, name from celebritytb";
						resultSet = statement.executeQuery(sql);
						int seasons = 0;
						while(resultSet.next()){								
					%>
                                        <li><a href="${pageContext.request.contextPath }/celebrity?celebrity_id=<%=resultSet.getString("celebrity_id")%>"><%=resultSet.getString("name")%></a>
                                        <a href="${pageContext.request.contextPath}/managecelebrity.jsp?celebrity_id=<%=resultSet.getString("celebrity_id")%>">
                                        <span class="year">Edit</span>
                                       </a> 
                                       </li>   
                                              
                                <%
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
         						}
      						}
				%>
                                    </ul>
                              
                                </div>
                                
                                
                               <%
                                if (session != null) {
         						if (session.getAttribute("sessionRole").equals("m")) {
            					%>
                                <div class="tab-pane fade" id="users" role="tabpanel" aria-labelledby="user-tab" aria-expanded="false">
                                    <ul class="film-list">
                                    	<li><a href="adduser.jsp?role=m&username=<%=session.getAttribute("sessionUsername")%>" class="btn btn-main btn-effect mt20">Add New User</a></li>
                                    <%
					try{
						String sql ="select user_id, username from usertb";
						resultSet = statement.executeQuery(sql);
						int seasons = 0;
						while(resultSet.next()){								
					%>
                                        <li><a href="${pageContext.request.contextPath }/user?username=<%=resultSet.getString("username")%>"><%=resultSet.getString("username")%></a>
                                        <a href="${pageContext.request.contextPath}/manageuser.jsp?role=m&user_id=<%=resultSet.getString("user_id")%>&username=<%=session.getAttribute("sessionUsername")%>">
                                        <span class="year">Edit</span>
                                       </a> 
                                       </li>  
                                   <%
						}
						connection.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
         						}
      						}
				%>   
                                        
                                        
                                    </ul>
                                </div>   						
      						
		
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- =============== End OF CELEBRITY DETAIL =============== -->


        <!-- =============== START OF FOOTER =============== -->
        <footer class="footer1 bg-dark">

            <!-- ===== START OF FOOTER WIDGET AREA ===== -->
            <div class="footer-widget-area ptb100">
                <div class="container">
                    <div class="row">
                        <!-- Start of Widget 2 -->
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <div class="widget widget-links">
                                <h4 class="widget-title">Useful links</h4>

                                <ul class="general-listing">
                                	<li><a href="${pageContext.request.contextPath}/">Home</a></li>
                                    <li><a href="${pageContext.request.contextPath}/movies.jsp">Movies</a></li>
                                    <li><a href="${pageContext.request.contextPath}/tvshows.jsp">TV Shows</a></li>                                  
                                </ul>

                            </div>
                        </div>
                        <!-- End of Widget 2 -->

                      

                        <!-- Start of Widget 4 -->
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <div class="widget widget-social">
                                <h4 class="widget-title">follow us</h4>

                                <p>Follow us on below Social Media Platforms</p>

                                <!-- Start of Social Buttons -->
                                <ul class="social-btns">
                                    <!-- Social Media -->
                                    <li>
                                        <a href="#" class="social-btn-roll facebook">
                                            <div class="social-btn-roll-icons">
                                                <i class="social-btn-roll-icon fa fa-facebook"></i>
                                                <i class="social-btn-roll-icon fa fa-facebook"></i>
                                            </div>
                                        </a>
                                    </li>

                                    <!-- Social Media -->
                                    <li>
                                        <a href="#" class="social-btn-roll twitter">
                                            <div class="social-btn-roll-icons">
                                                <i class="social-btn-roll-icon fa fa-twitter"></i>
                                                <i class="social-btn-roll-icon fa fa-twitter"></i>
                                            </div>
                                        </a>
                                    </li>

                                    <!-- Social Media -->
                                    <li>
                                        <a href="#" class="social-btn-roll google-plus">
                                            <div class="social-btn-roll-icons">
                                                <i class="social-btn-roll-icon fa fa-google-plus"></i>
                                                <i class="social-btn-roll-icon fa fa-google-plus"></i>
                                            </div>
                                        </a>
                                    </li>

                                    <!-- Social Media -->
                                    <li>
                                        <a href="#" class="social-btn-roll instagram">
                                            <div class="social-btn-roll-icons">
                                                <i class="social-btn-roll-icon fa fa-instagram"></i>
                                                <i class="social-btn-roll-icon fa fa-instagram"></i>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                                <!-- End of Social Buttons -->

                            </div>
                        </div>
                        <!-- End of Widget 4 -->

                    </div>
                </div>
            </div>
            <!-- ===== END OF FOOTER WIDGET AREA ===== -->


            

        </footer>
        <!-- =============== END OF FOOTER =============== -->

    </div>
    <!-- =============== END OF WRAPPER =============== -->




    <!-- =============== START OF GENERAL SEARCH WRAPPER =============== -->
    <div class="general-search-wrapper">
        <form class="general-search" role="search" method="get" action="#">
            <input type="text" placeholder="Type and hit enter...">
            <span id="general-search-close" class="ti-close toggle-search"></span>
        </form>
    </div>
    <!-- =============== END OF GENERAL SEARCH WRAPPER =============== -->



    <!-- =============== START OF LOGIN & REGISTER POPUP =============== -->
    <div id="login-register-popup" class="small-dialog zoom-anim-dialog mfp-hide">

        <!-- ===== Start of Signin wrapper ===== -->
        <div class="signin-wrapper">
            <div class="small-dialog-headline">
                <h4 class="text-center">Sign in</h4>
            </div>


            <div class="small-dialog-content">

                <!-- Start of Login form -->
                <form action="login" id="cariera_login" method="post">
                                <p class="status"></p>

                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input type="text" class="form-control" id="username" name="txtUsername" placeholder="Your Username or Email *" />
                                </div>

                                <div class="form-group">
                                    <label for="password">Password *</label>
                                    <input type="password" class="form-control" id="password" name="txtPassword" placeholder="Your Password *" />
                                </div>

                                <div class="form-group">
                                    <input type="submit" value="Sign in" name="submitLogin" class="btn btn-main btn-effect nomargin" />
                                </div>
                </form>
                <!-- End of Login form -->

                <div class="bottom-links">
                    <span>
                        Not a member?
                        <a  class="signUpClick">Sign up</a>
                    </span>
                </div>
            </div>

        </div>
        <!-- ===== End of Signin wrapper ===== -->



        <!-- ===== Start of Signup wrapper ===== -->
        <div class="signup-wrapper">
            <div class="small-dialog-headline">
                <h4 class="text-center">Sign Up</h4>
            </div>

            <div class="small-dialog-content">

                <!-- Start of Registration form -->
                <form id="cariera_registration" action="register" method="POST">
                                <p class="status"></p>

                                <div class="form-group">
                                    <label for="movify_user_login">Username</label>
                                    <input name="txtUsername" id="movify_user_login" class="form-control" type="text"/>
                                </div>

                                <div class="form-group">
                                    <label for="movify_user_email">Email</label>
                                    <input name="txtEmail" id="movify_user_email" class="form-control" type="email"/>
                                </div>

                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="txtPassword" id="movify_password" class="form-control" type="password"/>
                                </div>

                                <div class="form-group">
                                    <input type="submit" class="btn btn-main btn-effect nomargin" name="submitRegister" value="Register"/>
                                </div>
                            </form>
                <!-- End of Registration form -->

                <div class="bottom-links">
                    <span>
                        Already have an account?
                        <a class="signInClick">Sign in</a>
                    </span>
                </div>

            </div> <!-- .small-dialog-content -->

        </div>
        <!-- ===== End of Signup wrapper ===== -->
    </div>
    <!-- =============== END OF LOGIN & REGISTER POPUP =============== -->



    <!-- ===== Start of Back to Top Button ===== -->
    <div id="backtotop">
        <a href="#"></a>
    </div>
    <!-- ===== End of Back to Top Button ===== -->



    <!-- ===== All Javascript at the bottom of the page for faster page loading ===== -->
    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.ajaxchimp.js"></script>
    <script src="assets/js/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/jquery.mmenu.js"></script>
    <script src="assets/js/jquery.inview.min.js"></script>
    <script src="assets/js/jquery.countTo.min.js"></script>
    <script src="assets/js/jquery.countdown.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/imagesloaded.pkgd.min.js"></script>
    <script src="assets/js/isotope.pkgd.min.js"></script>
    <script src="assets/js/headroom.js"></script>
    <script src="assets/js/custom.js"></script>

    <!-- ===== Slider Revolution core JavaScript files ===== -->
    <script type="text/javascript" src="assets/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="assets/revolution/js/jquery.themepunch.revolution.min.js"></script>

    <!-- ===== Slider Revolution extension scripts ===== -->
    <script type="text/javascript" src="assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <script type="text/javascript" src="assets/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
    <script type="text/javascript" src="assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
    <script type="text/javascript" src="assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script type="text/javascript" src="assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
    <script type="text/javascript" src="assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
    <script type="text/javascript" src="assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
    <script type="text/javascript" src="assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
    <script type="text/javascript" src="assets/revolution/js/extensions/revolution.extension.video.min.js"></script>

</body>

</html>
