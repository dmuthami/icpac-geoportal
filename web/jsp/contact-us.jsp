<%-- 
    Document   : contact-us
    Created on : Sep 2, 2016, 2:41:57 PM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="david" >
        <title>ICPAC | Contact</title>

        <!-- core CSS -->
        <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/font-awesome.min.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/prettyPhoto.css"/>" rel="stylesheet">        
        <link href="<c:url value="/css/animate.min.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/main.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/responsive.css"/>" rel="stylesheet">

        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="<c:url value="/images/ico/favicon.ico"/>">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value="/images/ico/apple-touch-icon-144-precomposed.png"/>">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value="/images/ico/apple-touch-icon-114-precomposed.png"/>">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<c:url value="/images/ico/apple-touch-icon-72-precomposed.png"/>">        
        <link rel="apple-touch-icon-precomposed" href="<c:url value="/images/ico/apple-touch-icon-57-precomposed.png"/>">  
    </head><!--/head-->

    <body>

        <header id="header">
            <div class="top-bar">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-xs-4">
                            <!-- left empty---->
                        </div>
                        <div class="col-sm-6 col-xs-8">
                            <div class="social">

                                <ul>  <li><a href="#"><span class="glyphicon glyphicon-user"></span> Log in</a></li> </ul>
                                <ul class="social-share">
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>


                                </ul>
                                <div class="search">
                                    <form role="form">
                                        <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                                        <i class="fa fa-search"></i>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--/.container-->
            </div><!--/.top-bar-->

            <nav class="navbar navbar-inverse" role="banner">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                    </div>

                    <div class="collapse navbar-collapse navbar-right">

                        <ul class="nav navbar-nav">
                            <li><a class="navbar-brand" href="${pageContext.request.contextPath}/"><img src="images/IGAD_Logo_v2.svg" alt="logo"></a></li>
                            <li><a href="${pageContext.request.contextPath}/"><span class="glyphicon glyphicon-home"></span> Home</a></li>

                            <li><a href="${pageContext.request.contextPath}/AppsPortal"><span class="glyphicon glyphicon-home"></span> Apps Portal</a></li>
                            <li><a href="${pageContext.request.contextPath}/MapdirectoryServlet"><span class="glyphicon glyphicon-book"></span> Browse Maps</a></li>
                            <li class="active"><a href="${pageContext.request.contextPath}/MapViewer"> <span class="glyphicon glyphicon-globe"></span> Interactive Map</a></li>
                            <li><a href="${pageContext.request.contextPath}/ContactUs"> <span class="glyphicon glyphicon-map-marker"></span> Contacts</a></li>

                        </ul>
                    </div>
                </div><!--/.container-->
            </nav><!--/nav-->
        </header><!--/header-->

        <section id="contact-info">
            <div class="center">                
                <h2>How to Reach Us?</h2>
                <p class="lead">These are our Contacts and Location information details</p>
            </div>
            <div class="gmap-area">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-5 text-center">

                            <div class="gmap">
                                <div id="google-maps-display" >
                                    <iframe  frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/embed/v1/place?q=Kenya+Meteorological+Department,+Nairobi,+Kenya&key=AIzaSyAN0om9mFmy1QN6Wf54tXAowK4eT0ZUPrU"></iframe>
                                </div><a class="code-for-google-map" href="https://www.dog-checks.com/pug-checks" id="make-map-data">pug checks</a>
                                <!-- <style>#google-maps-display .map-generator{max-width: ; background: none;}</style> -->
                            </div>
                            <script src="https://www.dog-checks.com/google-maps-authorization.js?id=9684f43f-489e-604c-0bff-e1392c2d369f&c=code-for-google-map&u=1470657045" defer="defer" async="async"></script>

                        </div>

                        <div class="col-sm-7 map-content">
                            <ul class="row">
                                <li class="col-sm-6">
                                    <address>
                                        <h5>ICPAC Head Office</h5>
                                        <p>Ngong Road, Dagoretti Corner <br>
                                            Nairobi</p>

                                    </address>

                                    <address>
                                        <h5> Phone </h5>
                                        <p>+2540203514426<br> +254714435259<br> +254739167809 <br>
                                        </p>
                                    </address>
                                </li>


                                <li class="col-sm-6">
                                    <address>
                                        <h5>Website</h5>

                                        <p> <br>
                                            www.icpac.net</p>
                                    </address>

                                    <address>
                                        <h5>Email</h5>
                                        <p>info@icpac.net <br>
                                        </p>

                                    </address>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>  <!--/gmap_area -->

        <section id="contact-page">
            <div class="container">
                <div class="center">        
                    <h2>Drop Your Message</h2>
                    <p class="lead">Please write to us or contact us by filling the contact form below.We promise to get back to you soonest possible.</p>
                </div> 
                <div class="row contact-wrap"> 
                    <div class="status alert alert-success" style="display: none"></div>
                    <form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="contact.jsp">
                        <div class="col-sm-5 col-sm-offset-1">
                            <div class="form-group">
                                <label>Name *</label>
                                <input type="text" name="name" class="form-control" required="required">
                            </div>
                            <div class="form-group">
                                <label>Email *</label>
                                <input type="email" name="email" class="form-control" required="required">
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input type="number" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Your Organisation Name</label>
                                <input type="text" class="form-control">
                            </div>                        
                        </div>
                        <div class="col-sm-5">
                            <div class="form-group">
                                <label>Subject *</label>
                                <input type="text" name="subject" class="form-control" required="required">
                            </div>
                            <div class="form-group">
                                <label>Message *</label>
                                <textarea name="message" id="message" required class="form-control" rows="8"></textarea>
                            </div>                        
                            <div class="form-group">
                                <button type="submit" name="submit" class="btn btn-primary btn-lg" >Submit Message</button>
                            </div>
                        </div>
                    </form> 
                </div><!--/.row-->
            </div><!--/.container-->
        </section><!--/#contact-page-->

        <footer id="footer" class="midnight-blue">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        &copy; 2016 <a target="_blank" href="http://icpac.net/" title="ICPAC">ICPAC Geoportal</a>. All Rights Reserved.
                    </div>
                    <div class="col-sm-6">
                        <ul class="pull-right">
                            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                            <li><a href="http://icpac.net/">ICPAC Home</a></li>
                            <li><a href="${pageContext.request.contextPath}/ContactUs">Contact Us</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer><!--/#footer-->

        <script src="<c:url value="/js/jquery-2.2.4.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/js/bootstrap.min.js" />"></script>
        <script src="<c:url value="/js/jquery.prettyPhoto.js" />"></script>
        <script src="<c:url value="/js/jquery.isotope.min.js" />"></script>
        <script src="<c:url value="/js/main.js" />"></script>
        <script src="<c:url value="/js/wow.min.js" />"></script>  
    </body>
</html>
