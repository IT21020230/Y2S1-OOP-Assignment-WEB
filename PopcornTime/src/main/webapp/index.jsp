<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>

<%@ page import="com.popcorntime.dbutil.DBConnectUtil"%>

<%
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null; 
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
	
	<script type="text/javascript" src="assets/js/our/loginRegister.js"></script>
	
    <!-- ===== Mobile viewport optimized ===== -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no">

    <!-- ===== Website Title ===== -->
    <title>Popcorn Time - Movie and TV Show Browsing Site</title>

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




        <!-- =============== START OF SLIDER REVOLUTION SECTION =============== -->
        <section id="slider" class="full-slider">
            <div class="rev-slider-wrapper fullscreen-container overlay-gradient">
                <div id="fullscreen-slider" class="rev_slider fullscreenbanner" style="display:none" data-version="5.4.1">
                    <ul>

                        <!-- ===== SLIDE NR. 1 ===== -->
                        <li data-transition="fade">
                            <!-- MAIN IMAGE -->
                            <img src="assets/images/slider/slider1.jpg"
                                 alt="Image"
                                 title="slider-bg"
                                 data-bgposition="center center"
                                 data-bgfit="cover"
                                 data-bgrepeat="no-repeat"
                                 data-bgparallax="10"
                                 class="rev-slidebg"
                                 data-no-retina="">
                            <!-- LAYER NR. 1 -->
                            <div class="tp-caption tp-resizeme"
                                 data-x="center"
                                 data-hoffset=""
                                 data-y="middle"
                                 data-voffset="['-30','-30','-30','-30']"
                                 data-responsive_offset="on"
                                 data-fontsize="['60','50','40','30']"
                                 data-lineheight="['60','50','40','30']"
                                 data-whitespace="nowrap"
                                 data-frames='[{"delay":1000,"speed":2000,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":500,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                                 style="z-index: 5; color: #fff; font-weight: 900;">START STREAMING NOW
                            </div>
                        </li>

                        <!-- ===== SLIDE NR. 2 ===== -->
                        <li data-transition="fade"
                            data-slotamount="7"
                            data-easein="default"
                            data-easeout="default"
                            data-masterspeed="2000">
                            <!-- MAIN IMAGE -->
                            <img src="assets/images/slider/slider2.jpg"
                                 alt="Image"
                                 title="slider-bg"
                                 data-bgposition="center top"
                                 data-bgfit="cover"
                                 data-bgrepeat="no-repeat"
                                 data-bgparallax="10"
                                 class="rev-slidebg"
                                 data-no-retina="">
                            <!-- LAYER NR. 1 -->
                            <div class="tp-caption tp-resizeme"
                                 data-x="center"
                                 data-hoffset=""
                                 data-y="middle"
                                 data-voffset="['-30','-30','-30','-30']"
                                 data-responsive_offset="on"
                                 data-fontsize="['60','50','40','30']"
                                 data-lineheight="['60','50','40','30']"
                                 data-whitespace="nowrap"
                                 data-frames='[{"delay":1000,"speed":2000,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":500,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                                 style="z-index: 5; color: #fff; font-weight: 900;">ULTRA HD RESOLUTION
                            </div>
                        </li>

                        <!-- ===== SLIDE NR. 3 ===== -->
                        <li data-transition="fade"
                            data-slotamount="7"
                            data-easein="default"
                            data-easeout="default"
                            data-masterspeed="2000">
                            <!-- MAIN IMAGE -->
                            <img src="assets/images/slider/slider3.jpg"
                                 alt="Image"
                                 data-bgposition="center top"
                                 data-bgfit="cover"
                                 data-bgrepeat="no-repeat"
                                 data-bgparallax="3"
                                 class="rev-slidebg"
                                 data-no-retina>
                            <!-- LAYER NR. 1 -->
                            <div class="tp-caption tp-resizeme"
                                 data-x="center"
                                 data-hoffset=""
                                 data-y="middle"
                                 data-voffset="['-30','-30','-30','-30']"
                                 data-responsive_offset="on"
                                 data-fontsize="['60','50','40','30']"
                                 data-lineheight="['60','50','40','30']"
                                 data-whitespace="nowrap"
                                 data-frames='[{"delay":1000,"speed":2000,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":500,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                                 style="z-index: 5; color: #fff; font-weight: 900;">LATEST MOVIES & SERIES
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
            <!-- ===== END OF REV SLIDER WRAPPER ===== -->


            <!-- ===== START OF SEARCH FORM WRAPPER ===== -->
            <div class="search-form-wrapper search-form-rev">
                <div class="container">

                    <!-- ===== START OF SEARCH FORM ===== -->
                    <form id="search-form-1" action="search.jsp" method="get">
                        <div class="row justify-content-center">
                            <div class="col-md-8 col-sm-10 col-12">
                                <div class="form-group">
                                    <input name="search-keyword" type="text" id="search-keyword" value="" class="form-control" placeholder="Enter Movies or Series Title">
                                    <button type="submit" class="btn btn-main btn-effect"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- ===== END OF SEARCH FORM ===== -->

                </div>
            </div>
            <!-- ===== END OF SEARCH FORM WRAPPER ===== -->
        </section>
        <!-- =============== START OF SLIDER REVOLUTION SECTION =============== -->

		<!-- =============== START OF COUNTER SECTION =============== -->
        <section class="counter bg-main-gradient ptb50 text-center">
            <div class="container">
                <div class="row">
					<%
					try{
						connection = DBConnectUtil.getConnection();
						statement=connection.createStatement();
						String sql ="select count(*) from movietb;";
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
					%>
                    <!-- 1st Count up item -->
                    <div class="col-md-4 col-sm-12">
                        <span class="counter-item" data-from="0" data-to="<%=resultSet.getInt(1)%>">0</span>
                        <h4>Movies</h4>
                    </div>
					<%
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					%>
					<%
					try{
						String sql ="select count(*) from tvseriestb;";
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
					%>
                    <!-- 2nd Count up item -->
                    <div class="col-md-4 col-sm-12">
                        <span class="counter-item" data-from="0" data-to="<%=resultSet.getInt(1)%>">0</span>
                        <h4>TV Shows</h4>
                    </div>
					<%
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					%>
					<%
					try{
						String sql ="select count(*) from usertb;";
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
					%>
                    <!-- 3rd Count up item -->
                    <div class="col-md-4 col-sm-12">
                        <span class="counter-item" data-from="0" data-to="<%=resultSet.getInt(1)%>">0</span>
                        <h4>Users</h4>
                    </div>
					<%
						}
						connection.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
					%>
                </div>
            </div>
        </section>
        <!-- =============== END OF COUNTER SECTION =============== -->


        <!-- =============== START OF LATEST MOVIES SECTION =============== -->
        <section class="latest-movies ptb100">
            <div class="container">

                <!-- Start of row -->
                <div class="row">
                    <div class="col-md-8">
                        <h2 class="title">Latest Movies</h2>
                    </div>


                    <div class="col-md-4 align-self-center text-right">
                        <a href="${pageContext.request.contextPath }/movies.jsp" class="btn btn-icon btn-main btn-effect">
                            view all
                            <i class="ti-angle-double-right"></i>
                        </a>
                    </div>
                </div>
                <!-- End of row -->


                <!-- Start of Latest Movies Slider -->
                <div class="owl-carousel latest-movies-slider mt20">

                    <!-- === Start of Sliding Item 1 === -->
                    <%
					try{
						connection = DBConnectUtil.getConnection();
						statement=connection.createStatement();
						String sql ="select movie_id, name, release_date, poster_image, trailer from movietb order by release_date desc limit 4;";
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
					%>
                    <div class="item">
                        <!-- Start of Movie Box -->
                        <div class="movie-box-1">

                            <!-- Start of Poster -->
                            <div class="poster">
                                <img src="media/movies/posters/<%=resultSet.getString("poster_image")%>" alt="">
                            </div>
                            <!-- End of Poster -->

                            <!-- Start of Buttons -->
                            <div class="buttons">
                                <a href="<%=resultSet.getString("trailer")%>" class="play-video">
                                    <i class="fa fa-play"></i>
                                </a>
                            </div>
                            <!-- End of Buttons -->

                            <!-- Start of Movie Details -->
                            <div class="movie-details">
                                <h4 class="movie-title">
                                    <a href="${pageContext.request.contextPath}/movie?movie_id=<%=resultSet.getString("movie_id")%>"><%=resultSet.getString("name")%></a>
                                </h4>
                                <span class="released"><%=resultSet.getString("release_date")%></span>
                            </div>
                            <!-- End of Movie Details -->
							
                        </div>

                        <!-- End of Movie Box -->
                    </div>
                    <%
						}
						connection.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
					%>
                    <!-- === End of Sliding Item 1 === -->
					
                </div>
                <!-- End of Latest Movies Slider -->
            </div>
        </section>
        <!-- =============== END OF LATEST MOVIES SECTION =============== -->


        <!-- =============== START OF LATEST TV SHOW SECTION =============== -->
        <section class="latest-tvshows ptb100">
            <div class="container">

                <!-- Start of row -->
                <div class="row">
                    <div class="col-md-8 col-sm-12">
                        <h2 class="title">Latest TV Shows</h2>
                    </div>


                    <div class="col-md-4 col-sm-12 align-self-center text-right">
                        <a href="${pageContext.request.contextPath }/tvshows.jsp" class="btn btn-icon btn-main btn-effect">
                            view all
                            <i class="ti-angle-double-right"></i>
                        </a>
                    </div>
                    
                    
                </div>
                <!-- End of row -->


                <!-- Start of Latest Movies Slider -->
                <div class="owl-carousel latest-tvshows-slider mt20">
					<%
					try{
						connection = DBConnectUtil.getConnection();
						statement=connection.createStatement();
						String sql ="select tvseries_id, name, release_date, poster_image, trailer from tvseriestb order by release_date desc limit 4;";
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
					%>
                    <!-- === Start of Sliding Item 1 === -->
                    <div class="item">
                        <!-- Start of Movie Box -->
                        <div class="movie-box-1">

                            <!-- Start of Poster -->
                            <div class="poster">
                                <img src="media/tvshows/posters/<%=resultSet.getString("poster_image")%>" alt="">
                            </div>
                            <!-- End of Poster -->

                            <!-- Start of Buttons -->
                            <div class="buttons">
                                <a href="<%=resultSet.getString("trailer")%>" class="play-video">
                                    <i class="fa fa-play"></i>
                                </a>
                            </div>
                            <!-- End of Buttons -->

                            <!-- Start of Movie Details -->
                            <div class="movie-details">
                                <h4 class="movie-title">
                                    <a href="${pageContext.request.contextPath }/tvshow?tvseries_id=<%=resultSet.getString("tvseries_id")%>"><%=resultSet.getString("name")%></a>
                                </h4>
                                <span class="released"><%=resultSet.getString("release_date")%></span>
                            </div>
                            <!-- End of Movie Details -->

                        </div>
                        <!-- End of Movie Box -->
                    </div>
                    <!-- === End of Sliding Item 1 === -->
					<%
						}
						connection.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
					%>
                </div>
                <!-- End of Latest Movies Slider -->

            </div>
        </section>
        <!-- =============== END OF LATEST TV SHOW SECTION =============== -->


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



    <!-- =============== START OF LOGIN & REGISTER POPUP =============== -->
    <div id="login-register-popup" class="small-dialog zoom-anim-dialog mfp-hide">

        <!-- ===== Start of Signin wrapper ===== -->
        <div class="signin-wrapper">
            <div class="small-dialog-headline">
                <h4 class="text-center">Sign in</h4>
            </div>
            
            <div class="small-dialog-content">

                <!-- Start of Login form -->
                <form action="login" id="cariera_login" onsubmit="return validateLogin()" method="post">
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
                <form id="cariera_registration" onsubmit="return validateRegister()" action="register" method="POST">
                                <p class="status"></p>

                                <div class="form-group">
                                    <label for="movify_user_login">Username</label>
                                    <input name="txtUsername" id="movify_user_login" class="form-control" type="text"/>
                                </div>

                                <div class="form-group">
                                    <label for="movify_user_email">Email</label>
                                    <input name="txtEmail" id="movify_user_email" class="form-control" type="email"
                                    		pattern="[a-zA-Z0-9.-_]{1,}@[a-zA-Z.-]{2,}[.]{1}[a-zA-Z]{2,}"
                                			title="example123@mail.lk / example123@mail.en.com"/>
                                </div>

                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="txtPassword" id="movify_password" class="form-control" type="password"
                                    		pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,18}"
                                    		title="Must contain at least one number and one uppercase and lowercase letter, and between 8 and 18 characters"/>
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