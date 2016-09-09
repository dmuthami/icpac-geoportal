/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*Document Ready Function*/


var jsonObj;
var geonodeURL = "http://localhost";

function jsonMe() {

    try {
        //console.log(strMapDirectory);
        jsonObj = $.parseJSON(strMapDirectory);
        //console.log(jsonObj);

    } catch (err) {
        console.log(err.message);
    }

}

function selectDisplayMode(val) {

//Remove Gallery, Table or List Divs if they exist
    removeGalleryListTableDivs();

    if (val == "List") {
        //Call function to create listTableDisplayMode

        listDisplayMode();
        //jsonMe();

    } else if (val == "Table") {
        //Call function to create tableDisplayMode
        tableDisplayMode();
    } else {//Must be gallery
        //Call function to create galleryDisplayMode
        galleryDisplayMode();
    }
}

function removeGalleryListTableDivs() {
    //Attempt to remove table
    try {
        $("#idTable").remove();
    } catch (err) {
        console.log(err.message);
    }

    //Attempt to remove Gallery
    try {
        $("#idGallery").remove();
    } catch (err) {
        console.log(err.message);
    }

    // Attempt to remove the list
    try {
        $("#idMasterListView").remove();
    } catch (err) {
        console.log(err.message);
    }
}
/*
 * 
 * Code for the Table view Goes Here
 * 
 * 
 */

function tableDisplayMode() {
    addTableDiv()//Create table div
    //Create filter div 
    tableHeader(); //Create table header
    addTableRows(); //Add table rows
    //addTableRows(); //Add another table row
    registerEvents(); //Register Events to their respective event handlers
}

function addTableDiv() {

//Add tabl view div
    /*
     var str = "<div id='tableView' class='row search-results'></div>";
     $("#mainContainer").append(str);//Add the tabe header*/

//add table
    str = "<div id='idTable' class='col-xs-9'></div>";
    $("#tableView").prepend(str); //Add the tabe div

    //Add map directory div
    str = "<div id='idMapDirectory' class='row search-results-table-heading'></div>";
    $("#idTable").append(str); //Add the map directory div   

    //Add separator
    str = "<div class='menu-separator search-results-table-heading'></div>";
    $("#idTable").append(str); //Add separator div  

    //Results row div
    str = "<div id='resultRow' class='row result-row'></div>";
    $("#idTable").append(str); //Add separator div  
}

function tableHeader() {
//Function to create the 
    var class2 = "col-xs-2"

    var str3 = '<div class=' + class2 + '>Read More</div>';
    var str4 = '<div class=' + class2 + '>Show on Map</div>';
    var str5 = '<div class=' + class2 + '>Download</div>';
    var str = str3 + str4 + str5;
    jQuery('<div/>', {
        "id": 'idTitle',
        "class": 'col-xs-3'}).appendTo("#idMapDirectory");
    $("#idMapDirectory").append(
            $('<div/>')
            .addClass("col-xs-3")
            .text("Format")
            );
    $("#idMapDirectory").append(str); //Add the tabe header

    $("#idTitle").append('<p>Title</p>'); //Add Test to the first row

    //Add the class
    $('#idTitle')
            .addClass('search-results-table-heading');
}

function addTableRows() {
    var tableBlockParams;
    var str = "";
    var searchResultsName, format = "";
    $.each(currJsonObj, function () {
        $.each(this, function (name, value) {

            if (name == "title") {
                searchResultsName = value;
                //console.log("Title : " + value);
            }
            if (name == "csw_type") {
                format = value;
                //console.log("Format : " + value);
            }

        });
        //Create list
        //json object for data interchange
        tableBlockParams =
                {"tableView":
                            [
                                {"searchResultsName": searchResultsName},
                                {"format": format}

                            ]
                };

        //pass parameters to the createTableRow function
        str += createTableBlock(tableBlockParams);
    });
    $("#resultRow").append(str);

}

function createTableBlock(tableBlockParams) {
    //pass the title to function to get the href tag and then store
    //  it in variable to be appended to the Sho in Map hyperlink tag
    var id = "protectedareas_gha_region"
    var hreff = "http://localhost/geoserver/rest/workspaces/geonode/featuretypes/protectedareas_gha_region.json";

    var str = "<div class='col-xs-3 TitleTable'><p>" + tableBlockParams.tableView[0].searchResultsName + "</p></div>";

    str += "<div class='col-xs-3'>" +
            "<a href='#' title='View all services and datasets from " + tableBlockParams.tableView[0].searchResultsName + "'>" +
            "<p><span class='label label-datasett' title='Available as Dataset'>" + tableBlockParams.tableView[1].format + "</span></p>" +
            "</a>" +
            "</div>";
    str += "<div class='col-xs-2'>" +
            "<a href='#' title='View Metadata'>" +
            "<span class='glyphicon glyphicon-info-sign glyphicon-table-custom'></span>" +
            "</a>" +
            "</div>";

    str += "<div class='col-xs-2'>" +
            "<a href='#' title='Show on Map'>" +
            "<span id=" + id + " data-href='" + hreff + "' class='glyphicon glyphicon-map-marker glyphicon-table-custom showOnMap'></span>" +
            "</a>" +
            "</div>";
    str += "<div class='col-xs-2'>" +
            "<a href='#' title='Download'>" +
            "<span class='glyphicon glyphicon-cloud-download glyphicon-table-custom'></span>" +
            "</a>" +
            "</div>";
    str += "<div class='col-xs-12'>" +
            "<hr>" +
            "</div>";
    return str;
}

function registerEvents() {
    var element = document.getElementById('idFilterBytheme');
    element.onclick = FilterBythemeEventHandler; // Assigned

    var element = document.getElementById('idFilterByType');
    element.onclick = FilterByTypeEventHandler; // Assigned  

}

var idFilterBytheme = 0;
function FilterBythemeEventHandler() {

    if (idFilterBytheme == 0) {
        $('#idFilterBytheme').removeClass('glyphicon glyphicon-triangle-right');
        $('#idFilterBytheme').addClass('glyphicon glyphicon-triangle-bottom');
        idFilterBytheme = 1;
    } else
    {
        $('#idFilterBytheme').removeClass('glyphicon glyphicon-triangle-bottom');
        $('#idFilterBytheme').addClass('glyphicon glyphicon-triangle-right');
        idFilterBytheme = 0;
    }
}

var idFilterByType = 0;
function FilterByTypeEventHandler() {

    if (idFilterByType == 0) {
        $('#idFilterByType').removeClass('glyphicon glyphicon-triangle-right');
        $('#idFilterByType').addClass('glyphicon glyphicon-triangle-bottom');
        idFilterByType = 1;
    } else
    {
        $('#idFilterByType').removeClass('glyphicon glyphicon-triangle-bottom');
        $('#idFilterByType').addClass('glyphicon glyphicon-triangle-right');
        idFilterByType = 0;
    }
}



/*
 * 
 * Code for the Gallery Goes Here
 * 
 * 
 */


function galleryDisplayMode() {
//Add Gallery div
    var str = "<div id='idGallery' class='col-xs-9'></div>";
    $("#tableView").prepend(str); //Add the talbe div

    //Create gallery blocks

    var galleryBlockParams;
    str = "";
    var destinationURL, teaserbackgroundimageurl, teaserHeadingText;
    $.each(currJsonObj, function () {
        $.each(this, function (name, value) {

            if (name == "detail_url") {
                destinationURL = geonodeURL + value;
                console.log("Destination URL : " + value);
            }
            teaserbackgroundimageurl = "images/mapdirectory/thumbnail_025.dat";

            if (name == "title") {
                teaserHeadingText = value;
                console.log("Teaser Heading Text : " + value);
            }
        });

        //Create list
        //json object for data interchange
        galleryBlockParams =
                {"galleryView":
                            [
                                {"detail_url": destinationURL},
                                {"teaserbackgroundimageurl": teaserbackgroundimageurl},
                                {"teaserHeadingText": teaserHeadingText}

                            ]
                };

        str += createGalleryBlock(galleryBlockParams);
    });
    $("#idGallery").append(str);
}

function createGalleryBlock(galleryBlockParams) {

    var str =
            "<div class='search-results-gallery-image layoutblock'>" +
            "<div class='block shortcutpageteaserblock size-4 col-xs-4'>" +
            "<div class='teaser-with-background-image'>" +
            "<a href=" + galleryBlockParams.galleryView[0].detail_url + ">" +
            "<div class='teaser-background-image' style='background: url(" + galleryBlockParams.galleryView[1].teaserbackgroundimageurl + "' ) no-repeat scroll center center;'>" +
            "<div class='teaser-overlay'>" +
            "<div class='teaser-caption'>" +
            "<div class='teaser-heading'><font><font>" + galleryBlockParams.galleryView[2].teaserHeadingText + "</font></font></div>" +
            "</div>" +
            "</div>" +
            "</div>" +
            "</a>" +
            "</div>" +
            "<div class='clearfix'></div>" +
            "</div>" +
            "</div>";
    return str;
}


/*
 * 
 * Code for the List Goes Here
 * 
 * 
 */

function listDisplayMode() {
//    listBlockParams =
//            {"listView":
//                        [
//                            {"iconPath": "images/mapdirectory/971040238_kv_logo100.png"},
//                            {"searchResultsName": "Administrative Units Kenya"},
//                            {"searchResultsDescriptionTitle": "Mapping Authority"},
//                            {"searchResultsDescriptionText": "Administrative units Kenya shows national, county and municipal " +
//                                        "subdivision in the country with the most accurate boundaries recorded digitally and collected in a single data set. " +
//                                        "The data set contains the administrative units nation, county and municipality, ..."},
//                            {"format": "<span class='label label-datasett' title='Available as Dataset'>Dataset</span>"},
//                            {"thumbnail": "images/mapdirectory/thumbnail"}
//
//                        ]
//            };
//Add list view div
    var str = "<div id='idMasterListView' class='listView'>\n\
        <div id='idListView' class='col-xs-9'></div></div>";
    $("#tableView").prepend(str); //Add the tabe div

    var listBlockParams;
    str = "";
    var searchResultsName, searchResultsDescriptionTitle, searchResultsDescriptionText, format, thumbnail;
    $.each(currJsonObj, function () {
        $.each(this, function (name, value) {

            if (name == "title") {
                searchResultsName = value;
                //console.log("Title : " + value);
            }
            if (name == "category__gn_description") {
                searchResultsDescriptionTitle = value;
                //console.log("search Results Description Title : " + value);
            }
            if (name == "distribution_description") {
                searchResultsDescriptionText = value;
                //console.log("search Results Description Text : " + value);
            }
            if (name == "csw_type") {
                format = value;
                //console.log("Format : " + value);
            }
            if (name == "thumbnail_url") {
                thumbnail = value;
                //console.log("Thumb Nail  : " + value);
            }
        });

        //Create list
        //json object for data interchange
        listBlockParams =
                {"listView":
                            [
                                {"iconPath": "images/mapdirectory/971040238_kv_logo100.png"},
                                {"searchResultsName": searchResultsName},
                                {"searchResultsDescriptionTitle": searchResultsDescriptionTitle},
                                {"searchResultsDescriptionText": searchResultsDescriptionText},
                                {"format": "<span class='label label-datasett' title='Available as Dataset'>" + format + "</span>"},
                                {"thumbnail": thumbnail}

                            ]
                };
        //Create list block
        //console.log(listBlockParams);
        str += createListBlock(listBlockParams);
    });

    $("#idListView").append(str);
}

function createListBlock(listBlockParams) {
//Create List Block
    var str;
    str =
            "                        <div class='row result-row metadata'>" +
            "                            <div class='col-sm-1 search-results-logo'>" +
            "                                <a href='#'>" +
            "                                    <img title='View all services and datasets from Mapping Authority' " +
            "                                         alt='Logo Kartverket' " +
            "                                         class='img-responsive center-block' " +
            "                                         src=" + listBlockParams.listView[0].iconPath + ">" +
            "                                </a>" +
            "                            </div>" +
            "                            <div class='col-xs-6 search-results-title'>" +
            "                                <div class='row'>" +
            "                                    <a href='#'>" +
            "                                        <p role='button' class='role-button search-results-name'>" + listBlockParams.listView[1].searchResultsName + "</p>" +
            "                                    </a>" +
            "                                    <div class='search-results-description'>" +
            "                                        <a title='View all services and datasets from Mapping Authority' href='#'>" +
            "                                            <p> " + listBlockParams.listView[2].searchResultsDescriptionTitle + "</p>" +
            "                                        </a>" +
            "                                        <p>" +
            listBlockParams.listView[3].searchResultsDescriptionText +
            "                                        </p>" +
            "                                    </div>" +
            "                                </div>" +
            "                                <div class='row'>" +
            "                                    <div class='col-xs-8'>" +
            "                                        <p>" +
            "                                            Available As:" +
            listBlockParams.listView[4].format +
            "                                        </p>" +
            "                                    </div>" +
            "                                </div>" +
            "                            </div>" +
            "                            <div class='col-xs-2 search-results-action-buttons'>" +
            "                                <a class='btn btn-default' title='' data-placement='bottom' data-toggle='tooltip' " +
            "                                   href='#' " +
            "                                   data-original-title='Read more about Administrative units Kenya'>" +
            "                                    <span class='custom-icon custom-icon-info'></span>" +
            "                                    <span class='button-text'> Read More</span>" +
            "                                </a>" +
            "                                <a class='btn btn-default' target='_top' title='' data-placement='bottom' data-toggle='tooltip' " +
            "                                   onclick='ga('send', 'event', 'Nedlasting', 'viskart');' " +
            "                                   href='#' data-original-title='View Administrative units Kenya in map'>" +
            "                                    <span class='custom-icon custom-icon-kartmarkoer'></span>" +
            "                                    <span class='button-text'> Show in Map</span>" +
            "                                </a>" +
            "                                <a class='btn btn-default' target='_top' title='' data-placement='bottom' data-toggle='tooltip' " +
            "                                   onclick='ga('send', 'event', 'Nedlasting', 'lastned');' " +
            "                                   href='#' data-original-title='Download data for Administrative units Kenya'>" +
            "                                    <span class='custom-icon custom-icon-lastned'></span>" +
            "                                    <span class='button-text'> Download</span>" +
            "                                </a>" +
            "                            </div>" +
            "                            <div class='col-xs-2 search-results-list-image'>" +
            "                                <a href='#'>" +
            "                                    <img src=" + listBlockParams.listView[5].thumbnail + ">" +
            "                                </a>" +
            "                            </div>" +
            "                        </div>                      ";
    return str;
}