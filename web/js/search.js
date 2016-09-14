/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var searchJSONObj;

var searchParam;
//Document is Ready
$(document).ready(function () {

    $('#idSearch').keypress(function (event) {

        if (event.which === 13) {
            //Enter Pressed
            searchParam = $(this).val();
            alert(searchParam);
            //Call AJAX  function to return json object
        }

        //Perform search on json object

    });
});

function search() {
    var str = $('#idSearch').val();
    alert(str);
}

function searchRegexMapDirectory(searchParam) {
    var searchResultsJSONObjects = [];
    //$.getJSON("json/layers.json", function (data) {    });
    var search = searchParam;
    var regex = new RegExp(search, "i");

    console.log(m_JsonObj);
    var output = {};
    $.each(m_JsonObj, function () {
        if (this.title.search(regex) !== -1) {
            searchResultsJSONObjects.push(this);
        }
    });
    //searchResultsJSONObjects.push(output);
    var newJson = $.parseJSON(JSON.stringify(searchResultsJSONObjects));
    //var newJson = searchResultsJSONObjects;

    //console.log(newJson);

    m_JsonObj = newJson;

    //call function to test json object load of current objects at init
    m_CurrentCursorPosition = 0;
    m_Round = 0;
    paginationNext();

//    var val = $("#idSelectDisplayMode").val();
//    selectDisplayMode(val);
}

function searchFromMapDirectory(searchParam) {

    var searchResultsJSONObj = getObjects(m_JsonObj, '', 'modis_af');
    //console.log(arr);
    m_JsonObj = searchResultsJSONObj;

    //call function to test json object load of current objects at init
    m_CurrentCursorPosition = 0;
    paginationNext();

    var val = $("#idSelectDisplayMode").val();
    selectDisplayMode(val);
}

function regularExpressionSearch() {
    var searchField = $('#search').val();
    var regex = new RegExp(searchField, "i");
}

//return an array of objects according to key, value, or key and value matching
function getObjects(obj, key, val) {
    var objects = [];
    for (var i in obj) {
        if (!obj.hasOwnProperty(i))
            continue;
        if (typeof obj[i] == 'object') {
            objects = objects.concat(getObjects(obj[i], key, val));
        } else
        //if key matches and value matches or if key matches and value is not passed (eliminating the case where key matches but passed value does not)
        if (i == key && obj[i] == val || i == key && val == '') { //
            objects.push(obj);
        } else if (obj[i] == val && key == '') {
            //only add if the object is not already in the array
            if (objects.lastIndexOf(obj) == -1) {
                objects.push(obj);
            }
        }
    }
    return objects;
}

//return an array of values that match on a certain key
function getValues(obj, key) {
    var objects = [];
    for (var i in obj) {
        if (!obj.hasOwnProperty(i))
            continue;
        if (typeof obj[i] == 'object') {
            objects = objects.concat(getValues(obj[i], key));
        } else if (i == key) {
            objects.push(obj[i]);
        }
    }
    return objects;
}

//return an array of keys that match on a certain value
function getKeys(obj, val) {
    var objects = [];
    for (var i in obj) {
        if (!obj.hasOwnProperty(i))
            continue;
        if (typeof obj[i] == 'object') {
            objects = objects.concat(getKeys(obj[i], val));
        } else if (obj[i] == val) {
            objects.push(i);
        }
    }
    return objects;
}