/*Document Ready Function*/
$(document).ready(function () {

    function loadWorkspaceDatasets(workspace) {

        var url = "http://localhost/geoserver/rest/workspaces/" + workspace + "/featuretypes.json";
        //  alert (url);
        $.ajax({
            type: "GET",
            dataType: 'json',
            url: url,
            success: success,
            fail: failed

        });

    }


    function success(data) {
//alert(JSON.stringify(data));
//delete table row
        $("#dataset-table").find("tr:gt(1)").remove();



        if (data.featureTypes[0].featureType === undefined) {

            var rowString = '<tr><td>0</td><td>' + titleCase("No dataSet Found") + '</td><td>Unknown</td><td>Not Applicable</td></tr>';


            $('#dataset-table tr:last').after(rowString);

        } else if (data.featureTypes[0].featureType.length === undefined || data.featureTypes[0].featureType.length === null) {
            var rowString = '<tr><td>' + (0 + 1) + '</td><td>' + titleCase(data.featureTypes[0].featureType.name.replace("_", " ")) + '</td><td>Shapefile</td><td>' +
                    '<button type=\"button\"  data-toggle="tooltip" data-placement="bottom" title="Metadata" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-info-sign"></span></button>' +
                    '<button type=\"button\"  data-toggle="tooltip" data-placement="" title="Download" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-download"></span></button>' +
                    '<button type=\"button\" id =\"' + data.featureTypes[0].featureType.name + '\" name =\"' + data.featureTypes[0].featureType.href + '\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Map\" class=\"btn btn-success btn-sm\"><span class=\"glyphicon glyphicon-globe\"></span></button>' +
                    '</td></tr>';


            $('#dataset-table tr:last').after(rowString);


        } else {

            console.log(data.featureTypes[0]);
            for (var i = 0; i < data.featureTypes[0].featureType.length; i++) {

                var rowString = '<tr><td>' + (i + 1) + '</td><td>' + titleCase(data.featureTypes[0].featureType[i].name.replace("_", " ")) + '</td><td>Shapefile</td><td>' +
                        '<button type=\"button\"  data-toggle="tooltip" data-placement="bottom" title="Metadata" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-info-sign"></span></button>' +
                        '<button type=\"button\"  data-toggle="tooltip" data-placement="" title="Download" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-download"></span></button>' +
                        '<button type=\"button\" id =\"' + data.featureTypes[0].featureType[i].name + '\" name =\"' + data.featureTypes[0].featureType[i].href + '\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Map\" class=\"btn btn-success btn-sm\"><span class=\"glyphicon glyphicon-globe\"></span></button>' +
                        '</td></tr>';

                $('#dataset-table tr:last').after(rowString);

            }
        }

    }

    function failed() {
        $("#resultlist").html("Failed to load layer list");
    }

    function titleCase(str) {
        return str.split(' ').map(function (val) {
            return val.charAt(0).toUpperCase() + val.substr(1).toLowerCase();
        }).join(' ');
    }


    $(document).on("click", ".showOnMap", function () {

        var href = $(this).attr('data-href');

        if (href !== undefined && href !== null) {

            //window.location = 'newmapviewer/index.jsp?url=' + name;
            callMapViewerServlet("POST", href);
        }

    });

    function callMapViewerServlet(methodType, url) {


        document.getElementById("idDivServletCaller").action = "/icpac-geoportal/MapViewer?url=" + url;
        document.getElementById("idDivServletCaller").method = methodType;
        document.getElementById("idDivServletCaller").submit();


    }


// load workspaces or  sectors

    $.getJSON("../geoserver/rest/workspaces.json", function (result) {
        $.each(result.workspaces[0].workspace, function (i, field) {

            var sel = "<option selected=\"\" value=\"" + field.name + "\">" + titleCase(field.name) + "</option> ";
            $("#selectSectors").append(sel);

        });
    });


    $('#loadSectors').click(function () {
        var workspace = $("#selectSectors").val();

        loadWorkspaceDatasets(workspace);
    });


    try {
        loadWorkspaceDatasets("geonode");
    } catch (err) {
        console.log("Load Datasets Error " + err.message);
    }


});//doc ready






