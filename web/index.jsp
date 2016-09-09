<%-- 
    Document    : index
    Created on  : Sep 2, 2016, 2:30:34 PM
    Author      : david
    Modified by : dmuthami
    Created on  : Sep 5, 2016, 1:00:00 PM
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
        <title>Home | ICPAC</title>

        <!-- core CSS -->
        <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/font-awesome.min.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/animate.min.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/prettyPhoto.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/main.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/responsive.css"/>" rel="stylesheet">        
        <link href="<c:url value="/css/themeblockheader.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/mapdirectoryblock.css"/>" rel="stylesheet">
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
                            <!-- 
                                <li><a href="appsportal/" target="_blank"><span class="glyphicon glyphicon-home"></span> Apps Portal</a></li>                           
                            -->

                            <li><a href="${pageContext.request.contextPath}/LaunchingPad" target="_blank"><span class="glyphicon glyphicon-home"></span> Apps Portal</a></li>
                            <li><a href="${pageContext.request.contextPath}/MapdirectoryServlet" id="mapsview"><span class="glyphicon glyphicon-book"></span> GIS Datasets</a></li>
                            <li><a href="${pageContext.request.contextPath}/MapViewer"> <span class="glyphicon glyphicon-globe"></span> Interactive Maps</a></li>
                            <li><a href="${pageContext.request.contextPath}/ContactUs"> <span class="glyphicon glyphicon-map-marker"></span> Contacts</a></li>

                        </ul>
                    </div>
                </div><!--/.container-->
            </nav><!--/nav-->
        </header><!--/header-->

        <section id="main-slider" class="no-margin">
            <div class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#main-slider" data-slide-to="0" class="active"></li>
                    <li data-target="#main-slider" data-slide-to="1"></li>
                    <li data-target="#main-slider" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">

                    <div class="item active" style="background-image: url(images/slider/bg1.jpg)">
                        <div class="container">
                            <div class="row slide-margin">
                                <div class="col-sm-6">
                                    <div class="carousel-content">
                                        <h1 class="animation animated-item-1"> Disaster Risk Management Programme</h1>
                                        <h2 class="animation animated-item-2">The IGAD Secretariat with the active participation of the member states has been involved in consultative work to develop Regional Disaster Preparedness Strategy and Programme...</h2>
                                        <a class="btn-slide animation animated-item-3" href="#">Read More</a>
                                    </div>
                                </div>

                                <div class="col-sm-6 hidden-xs animation animated-item-4">

                                </div>
                            </div>
                        </div>
                    </div><!--/.item-->

                    <div class="item" style="background-image: url(images/slider/bg2.jpg)">
                        <div class="container">
                            <div class="row slide-margin">
                                <div class="col-sm-6">
                                    <div class="carousel-content">
                                        <h1 class="animation animated-item-1">Early warning Systems</h1>
                                        <h2 class="animation animated-item-2">Skillful climate forecasting and timely early warning forms the foundation of any operational climate...</h2>
                                        <a class="btn-slide animation animated-item-3" href="#">Read More</a>
                                    </div>
                                </div>

                                <div class="col-sm-6 hidden-xs animation animated-item-4">

                                </div>

                            </div>
                        </div>
                    </div><!--/.item-->

                    <div class="item" style="background-image: url(images/slider/bg3.jpg)">
                        <div class="container">
                            <div class="row slide-margin">
                                <div class="col-sm-6">
                                    <div class="carousel-content">
                                        <h1 class="animation animated-item-1">Climate Change</h1>
                                        <h2 class="animation animated-item-2">The IGAD Climate Prediction and Applications Centre (ICPAC), as a Regional Climate Centre provides medium range and extended climate forecasts that are required by Intergovernmental Authorityon Development (IGAD), the National Meteorological and Hydrological Services (NMHSs), and other national, regional and international partners</h2>
                                        <a class="btn-slide animation animated-item-3" href="#">Read More</a>
                                    </div>
                                </div>
                                <div class="col-sm-6 hidden-xs animation animated-item-4">

                                </div>
                            </div>
                        </div>
                    </div><!--/.item-->

                </div><!--/.carousel-inner-->

            </div><!--/.carousel-->

            <a class="prev hidden-xs" href="#main-slider" data-slide="prev">
                <i class="fa fa-chevron-left"></i>
            </a>

            <a class="next hidden-xs" href="#main-slider" data-slide="next">
                <i class="fa fa-chevron-right"></i>
            </a>

        </section><!--/#main-slider-->

        <section id="recent-works">

            <div class="container">

                <div class="map-directory">
                    <div class="row main-content-area">
                        <div class="teaser-with-icon">

                            <div class="call-to-action">
                                <div class="hexagon-teaser-wrapper">
                                    <div class="hexagon-teaser-before"></div>
                                    <div class="hexagon-teaser">
                                        <img src="images/map-icon-01.png" alt="teaser-icon" class="teaser-icon">
                                    </div>
                                    <div class="hexagon-teaser-after"></div>
                                </div>
                            </div>

                            <div class="teaser-heading">
                                <div class="header-content">
                                    Browse Maps & GIS Datasets | Themes | Sectors
                                </div>
                            </div>

                            <span class="separator-small"></span>

                            <p class="teaser-text">Find Various GIS Data Sets Based on Various Themes on ICPAC Geoportal</p>                               
                        </div>
                    </div>
                </div><!--/#Map Directory--> 

                <div class="row">


                    <div class="col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/image5.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">Basemaps</a> </h3>
                                    <p>Available base maps come here</p>
                                    <h3><a href="mapdirectory.jsp?sector=basemaps" > <span class="glyphicon glyphicon-globe"></span> Browse Data</a></h3>
                                </div> 
                            </div>
                        </div>
                    </div>   

                    <div class="col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/image1.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">Climate</a></h3>
                                    <p>Climate data comes here</p>
                                    <h3><a href="mapdirectory.jsp?sector=climate" > <span class="glyphicon glyphicon-globe"></span> Browse Data</a></h3>
                                </div> 
                            </div>
                        </div>
                    </div> 

                    <div class="col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/image7.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">Agriculture </a></h3>
                                    <p>Agriculture related  stuff comes here</p>
                                    <h3><a href="mapdirectory.jsp?sector=agriculture" > <span class="glyphicon glyphicon-globe"></span> Browse Data</a></h3>
                                </div> 
                            </div>
                        </div>
                    </div>   

                    <div class="col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/image2.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">Environment </a></h3>
                                    <p>Environment related products</p>
                                    <h3><a href="mapdirectory.jsp?sector=environment" > <span class="glyphicon glyphicon-globe"></span> Browse Data</a></h3>   

                                </div> 

                            </div>  
                        </div>       

                    </div>

                    <div class="col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/images9.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">Integrated Early Warning System</a></h3>
                                    <p>Early warning Systems</p>
                                    <h3><a href="mapdirectory.jsp?sector=warning" > <span class="glyphicon glyphicon-globe"></span> Browse Data</a></h3>    
                                </div> 
                            </div>
                        </div>
                    </div>   

                    <div class="col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/image3.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#"> Water </a></h3>
                                    <p>Water and hydrology</p>
                                    <h3><a href="mapdirectory.jsp?sector=water" > <span class="glyphicon glyphicon-globe"></span> Browse Data</a></h3>   
                                </div> 
                            </div>
                        </div>
                    </div> 

                    <div class="col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/images4.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">Disaster Risk </a></h3>
                                    <p>Forest Monitoring</p>
                                    <h3><a href="mapdirectory.jsp?sector=disaster" > <span class="glyphicon glyphicon-globe"></span> Browse Data</a></h3>
                                </div> 
                            </div>
                        </div>
                    </div>   

                    <div class="col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/images8.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">Land Degradation </a></h3>
                                    <p>Land degradation</p>
                                    <h3><a href="mapdirectory.jsp?sector=lands" > <span class="glyphicon glyphicon-globe"></span> Browse Data</a></h3>    
                                </div> 
                            </div>
                        </div>
                    </div>   

                </div><!--/.row-->

            </div>                                                                                                                                                                                       <!--/.container-->
        </section><!--/#recent-works-->                                                                                                                                                                                                        </section><!--/#recent-works-->

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

