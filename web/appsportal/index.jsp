<%-- 
    Document   : index
    Created on : Sep 2, 2016, 2:28:45 PM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!--
          Icpac geospataila launching pad
        -->
        <meta charset="UTF-8">
        <meta name="author" content="David">
        <meta name="description" content="ICPAC geospatial launching pad">
        <meta name="keywords" content="Climate change,IGAD,ICPAC,MESA,UNOSAT,Environment,Weather in horn of Africa">
        <title>ICPAC-Apps Portal</title>
        <link rel="stylesheet" href="css/common.css">
        <link rel="stylesheet" href="css/styles.css">

    </head>
    <body>

        <div class="wrap">

            <h1><span> <img src="img/igad-logo2.jpg"/> </span>Apps Portal</h1>

        </div>
        <div class="wrap">
            <div id="showcase" class="noselect">
                <div class="card">
                    <h2><a href="http://geonode.igad.int/" target="_blank">IGAD Geonode</a></h2>
                    <img src="img/Igad-geoportal.jpg">
                    <p>
                        IGAD Spatial web portal is a platform that facilitates the creation, sharing and collaborative use of geospatial data.This portal is intended to provide spatial services to larger audience with no or little GIS experience.
                    </p>
                    <a href="http://geonode.igad.int" target="_blank">View Portal...</a>
                </div>
                <div class="card">
                    <h2><a href="http://unosat.icpac.net:8080/geoportal/catalog/main/home.page" target="_blank">IGAD-UNOSAT Geoportal</a></h2>
                    <img src="img/icpac-unosat.jpg">
                    <p>
                        IGAD-UNOSAT project aimed at improving the capacity of IGAD staff in the use of GIS for Disaster Risk Reduction (DRR) and implementing an IGAD DRR Geoportal at ICPAC.
                    </p>
                    <a href="http://unosat.icpac.net:8080/geoportal/catalog/main/home.page" target="_blank">View Portal...</a>
                </div>
                <div class="card">
                    <h2><a href="https://unosat.maps.arcgis.com/apps/webappviewer/index.html?id=910035f816fd479d9ff62661bd5a50aa" target="_blank">IGAD-ICPAC Live Map</a></h2>
                    <img src="img/igad-icpac.jpg">
                    <p>
                        A live web-map to monitor climate and associated hazards in the Greater Horn of Africa region.Developed with technical support from UNITAR’s Operational Satellite Applications Programme (UNOSAT).
                    </p>
                    <a href="https://unosat.maps.arcgis.com/apps/webappviewer/index.html?id=910035f816fd479d9ff62661bd5a50aa" target="_blank">View Portal...</a>
                </div>
                <div class="card">
                    <h2><a href="http://197.254.113.174/" target="_blank">MESA-IGAD Geoportal</a></h2>
                    <img src="img/mesa-igad.jpg">
                    <p>
                        ESA-IGAD Geoportal is an open source platform for disseminating and sharing data products of the MESA project implemented for the IGAD region.
                    </p>
                    <a href="http://197.254.113.174/" target="_blank">View Portal...</a>
                </div>
                <div class="card">
                    <h2><a href="https://unosat.maps.arcgis.com">IGAD-ICPAC Live Maps</a></h2>
                    <img src="img/igad-icpac-live-map.jpg">
                    <p>
                        An integrated platform for regional monitoring of climate related hazards in the Greater Horn of Africa.
                    </p>
                    <a href="https://unosat.maps.arcgis.com"target="_blank">View Portal...</a>
                </div>
                <div class="card">
                    <h2><a href="https://icpac.maps.arcgis.com" target="_blank">ICPAC Apps and Maps</a></h2>
                    <img src="img/icpac-apps.jpg">
                    <p>
                        Climate Applications by ICPAC.
                    </p>
                    <a href="https://icpac.maps.arcgis.com" target="_blank">View Portal...</a>
                </div>

                <div class="card">
                    <h2><a href="https://icpac.net" target="_blank">ICPAC Geoportal</a></h2>
                    <img src="img/icpac.jpg" height="190" width="260">
                    <p>
                        Portal Under Development.Please be patient
                    </p>
                    <a href="./index.jsp" target="_blank">View Portal</a>
                </div>


            </div>
            <button class="nav noselect left">
                &lt;
            </button>
            <button class="nav noselect right">
                &gt;
            </button>
        </div>
        <div class= "">
            <footer>

                <div id="photo-credits">
                    <ul>

                        <li>
                            <p><strong><a href="http://www.icpac.net" target="_blank"> ICPAC</a> | <a href="http://www.igad.int" target="_blank">IGAD</a> | <a href="http://mesa.icpac.net/">MESA</a>   


                                    <strong></p>
                                        </li>

                                        </ul>
                                        </div>
                                        </footer>
                                        </div>
                                        <script src="js/lib/jquery.js"></script>
                                        <script src="js/lib/jquery.cloud9carousel.js"></script>
                                        <script>
                                            $(function () {
                                                var showcase = $("#showcase")

                                                showcase.Cloud9Carousel({
                                                    yOrigin: 42,
                                                    yRadius: 40,
                                                    itemClass: "card",
                                                    buttonLeft: $(".nav.left"),
                                                    buttonRight: $(".nav.right"),
                                                    bringToFront: true,
                                                    onLoaded: function () {
                                                        showcase.css('visibility', 'visible')
                                                        showcase.css('display', 'none')
                                                        showcase.fadeIn(1500)
                                                    }
                                                })

                                                //
                                                // Simulate physical button click effect
                                                //
                                                $('.nav').click(function (e) {
                                                    var b = $(e.target).addClass('down')
                                                    setTimeout(function () {
                                                        b.removeClass('down')
                                                    }, 80)
                                                })

                                                $(document).keydown(function (e) {
                                                    //
                                                    // More codes: http://www.javascripter.net/faq/keycodes.htm
                                                    //
                                                    switch (e.keyCode) {
                                                        /* left arrow */
                                                        case 37:
                                                            $('.nav.left').click()
                                                            break

                                                            /* right arrow */
                                                        case 39:
                                                            $('.nav.right').click()
                                                    }
                                                })
                                            })
                                        </script>
                                        <script src="js/social.js" async></script>
                                        </body>
                                        </html>
