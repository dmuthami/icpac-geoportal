/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * 
 * @type type
 *   var hreff = "http://localhost/geoserver/geonode/wms?
 *      service=WMS&version=1.1.0&request=GetMap
 *      &layers=geonode:somalia_health_facilities
 *      &styles=
 *      &bbox=41.3815002441406,-1.09784948825836,51.1785011291504,11.5224771499634
 *      &width=596&height=768
 *      &srs=EPSG:4326
 *      &format=application/openlayers";
 */


/*Member variables*/
var m_ShowOnMapJSON = {};
m_ShowOnMapJSON["url"] = "http://localhost/geoserver/geonode/wms?service=WMS";
m_ShowOnMapJSON["version"] = "1.1.0";
m_ShowOnMapJSON["request"] = "GetMap";
m_ShowOnMapJSON["srs"] = "EPSG:4326";
m_ShowOnMapJSON["layers"] = "";
m_ShowOnMapJSON["styles"] = "";
m_ShowOnMapJSON["format"] = "image/png";
m_ShowOnMapJSON["width"] = "596";
m_ShowOnMapJSON["height"] = "768";
m_ShowOnMapJSON["&bbox"] = "40.9588470458984,-1.63760006427765,51.2911529541016,12.0176000595093";


function showOnMapURL(workspace, featureName) {
    m_ShowOnMapJSON["layers"] = workspace + ":" + featureName;
    var url = "";

    $.each(m_ShowOnMapJSON, function (name, value) {
        if (url === "") {
            url = value;
        } else {
            url += "&" + name + "=" + value;
        }
    });
    return url;
}

function showInMap(href) {
    if (href !== undefined && href !== null) {
        //console.log(href);
        //window.location = 'newmapviewer/index.jsp?url=' + name;
        callMapViewerServlet("POST", href);
    }
}


function callMapViewerServlet(methodType, url) {


    document.getElementById("idDivServletCaller").action = "/icpac-geoportal/MapViewer?url=" + url;
    //document.getElementById("idDivServletCaller").action = "/WebApplication1/ShowOnMap";
    document.getElementById("idDivServletCaller").method = methodType;
    document.getElementById("idDivServletCaller").submit();


}
