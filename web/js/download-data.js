/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/*
 * Sample URL
 * 
 * http://localhost/geoserver/wfs?request=GetFeature&service=WFS&version=2.0.0&typename=geonode:somalia_health_facilities&outputformat=SHAPE-ZIP&SRSNAME=EPSG:4326
 * 
 */

/*Member variables*/
var m_DownloadJSON = {};
m_DownloadJSON["geoserverurl"] = "http://localhost/geoserver/wfs?request=GetFeature";
m_DownloadJSON["service"] = "WFS";
m_DownloadJSON["version"] = "2.0.0";
m_DownloadJSON["outputformat"] = "SHAPE-ZIP";
m_DownloadJSON["SRSNAME"] = "EPSG:4326";


function downloadShapeZip(workspace, featureName) {
    var url = "";
    m_DownloadJSON["typename"] = workspace + ":" + featureName;
    $.each(m_DownloadJSON, function (name, value) {
        if (url === "") {
            url = value;
        } else {
            url += "&" + name + "="+ value;
        }
    });
    return url;
}