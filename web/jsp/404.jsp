<%-- 
    Document   : 404
    Created on : Sep 2, 2016, 2:44:45 PM
    Author     : david
    Modified   : David Muthami
    Modified On  : Sep 5, 2016, 1:00:00 PM
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
    <title>404 | ICPAC</title>
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
                            <li class="active"><a href="${pageContext.request.contextPath}/"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                             <li><a href="${pageContext.request.contextPath}/AppsPortal" target="_blank"><span class="glyphicon glyphicon-home"></span> Apps Portal</a></li>
                            <li><a href="${pageContext.request.contextPath}/MapdirectoryServlet"><span class="glyphicon glyphicon-book"></span> Browse Maps</a></li>
                            <li><a href="${pageContext.request.contextPath}/MapViewer"> <span class="glyphicon glyphicon-globe"></span> Interactive Map</a></li>
                            <li><a href="${pageContext.request.contextPath}/ContactUs"> <span class="glyphicon glyphicon-map-marker"></span> Contacts</a></li>
                                                   
                        </ul>
                    </div>
                </div><!--/.container-->
            </nav><!--/nav-->
        </header><!--/header-->

    <section id="error" class="container text-center">
        <h1>404, Page not found</h1>
        <p>The Page you are looking for is under construction Else</p>
        <p>The Page you are looking for doesn't exist or an other error occurred.</p>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/">GO BACK TO THE HOMEPAGE</a>
    </section><!--/#error-->

    

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
