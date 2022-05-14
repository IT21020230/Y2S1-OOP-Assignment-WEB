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
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null; 
%>

<c:forEach var="movie" items="${movie}">
			<c:set var="id" value="${movie.id}"/>
			<c:set var="name" value="${movie.name}"/>
			<c:set var="description" value="${movie.description}"/>
			<c:set var="releaseDate" value="${movie.releaseDate}"/>
			<c:set var="country" value="${movie.country}"/>
			<c:set var="language" value="${movie.language}"/>
			<c:set var="director" value="${movie.director}"/>
			<c:set var="productionCompany" value="${movie.productionCompany}"/>
			<c:set var="budget" value="${movie.budget}"/>
			<c:set var="runtime" value="${movie.runtime}"/>
			<c:set var="rating" value="${movie.rating}"/>
			<c:set var="posterImage" value="${movie.posterImage}"/>
			<c:set var="bannerImage" value="${movie.bannerImage}"/>
			<c:set var="trailer" value="${movie.trailer}"/>
			<c:set var="path" value="${movie.path}"/>
		</c:forEach>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <!-- ===== Mobile viewport optimized ===== -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no">
    
    <!-- ===== Website Title ===== -->
    <title>${name}</title>

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
        <section class="movie-detail-intro overlay-gradient ptb100" style="background: url(media/movies/banners/${bannerImage});">
        </section>
        <!-- =============== END OF MOVIE DETAIL INTRO =============== -->



        <!-- =============== START OF MOVIE DETAIL INTRO 2 =============== -->
        <section class="movie-detail-intro2">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div class="movie-poster">
                            <img src="media/movies/posters/${posterImage}" alt="">

                            <a href="media/movies/${path}" class="play-video">
                                <i class="fa fa-play"></i>
                            </a>
                        </div>


                        <div class="movie-details">
                            <h3 class="title">${name}</h3>

                            <ul class="movie-subtext">
                                <li>${rating}</li>
                                <li>${runtime} (minutes)</li>
                                <li>${releaseDate} (${country})</li>
                            </ul>

                            <a href="${trailer}" class="btn btn-main btn-effect btn-play-trailer">trailer</a>
                            <%
                            if (session.getAttribute("sessionRole") != null) {
            						String sessionRole = (String) session.getAttribute("sessionRole");
            						if(sessionRole!="u"){
            					%>
                            <a href="${pageContext.request.contextPath}/managemovie.jsp?movie_id=${id}" class="btn btn-main btn-effect">Manage Content</a>
                            <%
            						}
                            }
                            %>
                        </div>

                        <div class="clearfix"></div>

                    </div>
                </div>
            </div>
        </section>
        <!-- =============== End OF MOVIE DETAIL INTRO 2 =============== -->


        <!-- =============== START OF MOVIE DETAIL MAIN SECTION =============== -->
        <section class="movie-detail-main ptb100">
            <div class="container">

                <div class="row">
                    <!-- Start of Movie Main -->
                    <div class="col-lg-8 col-sm-12">
                        <div class="inner pr50">

                            <!-- Storyline -->
                            <div class="storyline">
                                <h3 class="title">Storyline</h3>

                                <p>${description}</p>
                            </div>
                        </div>        
                    </div>
                    <!-- End of Movie Main -->


                    <!-- Start of Sidebar -->
                    <div class="col-lg-4 col-sm-12">
                        <div class="sidebar">

                            <!-- Start of Details Widget -->
                            <aside class="widget widget-movie-details">
                                <h3 class="title">Details</h3>

                                <ul>
                                    <li><strong>Release date: </strong>${releaseDate}</li>
                                    <li><strong>Director: </strong><a href="#">${director}</a></li>
                                    <li><strong>Budget: </strong>${budget}</li>
                                    <li><strong>Country: </strong>${country}</li>
                                    <li><strong>Language: </strong>${language}</li>
                                    <li><strong>Production Co: </strong><a href="#">${productionCompany}</a></li>
                                </ul>
                            </aside>
                            <!-- End of Details Widget -->

                            <!-- Start of Details Widget -->
                            <aside class="widget widget-movie-cast">
                                <h3 class="title">Cast</h3>

                                <ul class="cast-wrapper">
                                <%
					try{
						connection = DBConnectUtil.getConnection();
						statement=connection.createStatement();
						String movieID = request.getParameter("movie_id");
						String sql ="SELECT celebrity_id, name, poster_image FROM celebritytb c, moviecelebritytb mc WHERE c.celebrity_id=mc.celebrity and mc.movie="+movieID;
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
					%>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/celebrity?celebrity_id=<%=resultSet.getString("celebrity_id")%>">
                                            <span class="circle-img">
                                                <img src="assets/media/celebrities/posters/<%=resultSet.getString("poster_image")%>" alt="">
                                            </span>
                                            <h6 class="name"><%=resultSet.getString("name")%></h6>
                                        </a>
                                    </li>
                                    <li>
                                    <form action="moviecontrol" method="post" enctype="multipart/form-data">
                                            		<input type="hidden" name="txtMovieID" value="<%=movieID%>">
                                            		<input type="hidden" name="txtCelebrityID" value="<%=resultSet.getString("celebrity_id")%>">
                                            		<button class="btn btn-main btn-effect" type="submit" name="btnRemoveCast" value="removeCast">Remove</button>
                                            	</form>
                                     </li>
                    <%
						}
						connection.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
                                    
                                </ul>
                                <%
                            if (session.getAttribute("sessionRole") != null) {
            						String sessionURole = (String) session.getAttribute("sessionRole");
            						if(sessionURole!="u"){
            					%>
                                <a href="addcasttomovie.jsp?movie_id=${id}" class="btn btn-main btn-effect mt20">Add New Cast</a>
                                <%}
            					} %>
                            </aside>
                            <!-- End of Details Widget -->

                        </div>
                    </div>
                    <!-- End of Sidebar -->
                </div>

            </div>
        </section>
        <!-- =============== END OF MOVIE DETAIL MAIN SECTION =============== -->


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