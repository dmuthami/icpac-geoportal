<%-- 
    Document   : mapdirectory
    Created on : Sep 1, 2016, 1:19:36 PM
    Author     : David Kanyari
    Modified   : David Muthami
    Modified on  : Sep 5, 2016, 1:00:00 PM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.json.simple.JSONArray"%>
<!DOCTYPE html>
<%!
    JSONArray jSONArray;

    public void jspInit() {

    }

%>
<%
    jSONArray = (JSONArray) request.getAttribute("JSONArray");
%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="david" >
        <title>Browse Maps | ICPAC</title>

        <!-- core CSS -->
        <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/font-awesome.min.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/prettyPhoto.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/animate.min.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/main.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/responsive.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/mapdirectory.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/mapdirectorylist.css"/>" rel="stylesheet">   
        <link href="<c:url value="/js/maplib/js/ol.css"/>" rel="stylesheet" type="text/css"/>   

        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="<c:url value="/images/ico/favicon.ico"/>">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value="/images/ico/apple-touch-icon-144-precomposed.png"/>">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value="/images/ico/apple-touch-icon-114-precomposed.png"/>">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<c:url value="/images/ico/apple-touch-icon-72-precomposed.png"/>">        
        <link rel="apple-touch-icon-precomposed" href="<c:url value="/images/ico/apple-touch-icon-57-precomposed.png"/>">  

        <script language="javascript">
            <%
                out.print("var strMapDirectory='" + jSONArray + "';");
            %>

        </script>   
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

                                <ul>  <li><a href="#"><span class="glyphicon glyphicon-user"></span> Login</a></li> </ul>
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

                            <li><a href="${pageContext.request.contextPath}/AppsPortal" target=_blank"><span class="glyphicon glyphicon-home"></span> Apps Portal</a></li>
                            <li><a href="${pageContext.request.contextPath}/MapdirectoryServlet"><span class="glyphicon glyphicon-book"></span> GIS Datasets</a></li>
                            <li><a href="${pageContext.request.contextPath}/MapViewer"> <span class="glyphicon glyphicon-globe"></span> Interactive Map</a></li>
                            <li><a href="${pageContext.request.contextPath}/ContactUs"> <span class="glyphicon glyphicon-map-marker"></span> Contacts</a></li>

                        </ul>
                    </div>
                </div><!--/.container-->
            </nav><!--/nav-->
        </header><!--/header-->


        <section id="feature" class="transparent-bg">

            <!-- ----------------------Table tags--------------------- -->
            <!-- ----------------------------------------------------- -->
            <!-- ----------------------------------------------------- -->

            <!-- First Row-->

            <div class="container">
                <div class ="row">
                    <div class="col-xs-12 ">
                        <h1 class="small-h1">Browse GIS DataSets</h1>                    
                    </div>
                    <div class="col-xs-1">
                        <div class="map-directory-separator"></div>                   
                    </div>
                </div>   
            </div>

            <!-- End First Row-->

            <!-- Second Row-->

            <div class="container">
                <div class="row">
                    <div class="col-xs-4">
                        <div class="row">
                            <div class="col-xs-12">
                                Showing 1-30 of 2906 results:                           
                            </div>
                        </div>                    
                        <div class="row">
                            <div class="col-xs-12">
                                <ul class="pagination pagination-sm">
                                    <li onclick="paginationFirst()"><a href="#"><<</a></li>
                                    <li onclick="paginationNext()"><a href="#">></a></li>
                                    <li onclick="paginationPrevious()"><a href="#"><</a></li>
                                    <li onclick="paginationLast()"><a href="#">>></a></li>
                                </ul>
                            </div>
                        </div>                    
                    </div>
                    <div class="col-xs-4">
                        <div class="row">
                            <div class="col-xs-12">
                                Save As:                            
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="custom-select">
                                            <select class="form-control" onchange="additionalView(this.value)">
                                                <option selected="selected" value="csvUrl">CSV</option>
                                            </select>
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-primary">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <div class="row">
                            <div class="col-xs-12 col-xs-offset-3">
                                Select Display Mode                            
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-9 col-xs-offset-3">
                                <form role="form">
                                    <div class="form-group">
                                        <select class="form-control" id="idSelectDisplayMode" onchange="selectDisplayMode(this.value)">
                                            <option>List</option>
                                            <option>Table</option>
                                            <option>Gallery</option>
                                        </select>                                
                                    </div>
                                </form>
                            </div>
                        </div>                    
                    </div>
                </div>
                <span class="separator-small separator-gray margin-bottom-10"></span>
            </div>

            <!-- End Second Row-->

            <div id="mainContainer" class="container">

                <div id="tableView" class="row search-results">
                    <!-- 
                    ------------------
                    --------------------------------------------------------------------
                    Add table, Gallery, List of Divs programmatically added here
                    
                    ---------------------------------------------------------------------
                    
                    ---------------------------------------------------------------------
                    --------------------------------------------------------------------
                    ------------------------------------------------------------------------
                    -------------------------------------------------------------------------
                    ------------------------------------------------------------------------
                    -->



                    <!-- End of Add table, Gallery, List of Divs programmatically-->
                    <div class="col-xs-3">
                        <div class="row">
                            <div class="col-xs-12">
                                Filter  
                            </div>   
                        </div>

                        <!-- By Theme-->
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="row">
                                    <div class="col-xs-2">
                                        e<span id="idFilterBytheme"  class="glyphicon glyphicon-triangle-right" data-toggle="collapse" data-target="#idTheme"></span>
                                    </div>
                                    <div class="col-xs-3">
                                        Theme
                                    </div>
                                    <!--<div class="col-xs-6"></div> -->
                                </div>
                                <div class="row">
                                    <div id="idTheme" class="collapse col-xs-offset-3">
                                        <p>&nbsp;&nbsp;&nbsp;Other (1)</p>
                                        <p>&nbsp;&nbsp;&nbsp;Basic geodata (2)</p>
                                        <p>&nbsp;&nbsp;&nbsp;Coast / fisheries (1)</p>
                                    </div>   
                                </div>
                            </div> 
                        </div>
                        <!-- By Type-->
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="row">
                                    <div class="col-xs-2">
                                        <span id="idFilterByType"  class="glyphicon glyphicon-triangle-right" data-toggle="collapse" data-target="#idType"></span>
                                    </div>
                                    <div class="col-xs-3">
                                        Type
                                    </div>
                                    <!--<div class="col-xs-6"></div> -->
                                </div>
                                <div class="row">
                                    <div id="idType" class="collapse col-xs-offset-3">
                                        <p>&nbsp;&nbsp;&nbsp; Shapefile (1)</p>
                                        <p>&nbsp;&nbsp;&nbsp; Tiff (2)</p>
                                        <p>&nbsp;&nbsp;&nbsp; SQL (1)</p>
                                    </div>   
                                </div>
                            </div> 
                        </div>   

                    </div>  
                </div>
                <hr>

                <!-- Pagination -->
                <div class="row">
                    <div class="col-xs-12">
                        Showing 1-30 of 2906 results:                           
                    </div>
                </div>                    

                <div class="row">
                    <div class="col-xs-12">
                        <ul class="pagination pagination-sm">
                            <li onclick="paginationFirst()"><a href="#"><<</a></li>
                            <li onclick="paginationNext()"><a href="#">></a></li>
                            <li onclick="paginationPrevious()"><a href="#"><</a></li>
                            <li onclick="paginationLast()"><a href="#">>></a></li>
                        </ul>
                    </div>
                </div>                    
            </div>
            <!-- End of Table tags------------------------------------ -->
            <!-- ----------------------------------------------------- -->
            <!-- ----------------------------------------------------- -->
        </section><!--/#feature-->

        <footer id="footer" class="midnight-blue">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        &copy; 2016 <a target="_blank" href="http://icpac.net/" title="ICPAC">ICPAC Geoportal</a>. All Rights Reserved.
                    </div>
                    <div class="col-sm-6">
                        <ul class="pull-right">
                            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Faq</a></li>
                            <li><a href="${pageContext.request.contextPath}/ContactUs">Contact Us</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer><!--/#footer-->
        <!-- This is a hidden div to be used to call servlet-->
        <div style="display: none;">
            <form id="idDivServletCaller"  method="POST">
                <input type="text" name="url" value="">
            </form>
        </div><!-- This is a hidden div-->
        <script src="<c:url value="/js/jquery-2.2.4.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/js/bootstrap.min.js" />"></script>
        <script src="<c:url value="/js/jquery.prettyPhoto.js" />"></script>
        <script src="<c:url value="/js/jquery.isotope.min.js" />"></script>
        <script src="<c:url value="/js/main.js" />"></script>
        <script src="<c:url value="/js/wow.min.js" />"></script>       
        <script src="<c:url value="/js/mapdirectory.js" />" type="text/javascript"></script> 
        <script src="<c:url value="/js/maplib/js/ol.js" />" type="text/javascript"></script> 
        <script src="<c:url value="/js/load-datasets.js" />" type="text/javascript"></script> 
        <script src="<c:url value="/js/pagination.js" />" type="text/javascript"></script> 
    </body> 

</html>