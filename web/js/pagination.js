/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* global m_JsonObj */

// Variable that stores the current position of the cursor
var m_CurrentCursorPosition;
m_CurrentCursorPosition = 0;

//Varibale to show batch of records
var m_BatchOfJsonObjects;
m_BatchOfJsonObjects = 10;

//object showing current objetcs loaded
var m_CurrJsonObj;

//pagination round 
var m_PaginationStartRecord = -1;

//total records
var m_TotalRecords = 0;

//jsonobject determining which list tags in the pagination summary are displayed and at what time
var m_ListPaginationJsonObj;
m_ListPaginationJsonObj = {};

//What round of pagination are we in
var m_Round = 0;

function pagination() {
    //Get length of the json object
    var jsonObjSize = m_JsonObj.length;

    //If current cursor position is greater than  or equa to the json object length then  do nothing
    if (m_CurrentCursorPosition < jsonObjSize) {
        var me = returnJSONObjects(m_CurrentCursorPosition, m_BatchOfJsonObjects);
        //console.log(me);
        m_CurrJsonObj = $.parseJSON(me);
        //console.log(m_CurrJsonObj);

        //Show new records on the list
        var val = $("#idSelectDisplayMode").val();
        selectDisplayMode(val);


    }
}

function paginationFirst() {

    //Set Current Cursor Position to Zeror
    m_CurrentCursorPosition = 0;

    pagination();

    var val = $("#idSelectDisplayMode").val();
    selectDisplayMode(val);

    //intialize the list tag pagination summmary div
    //first,prev,round,next,last
    initializeListPaginationJsonObj(0, 0, 1, 1, 1);

    //Decrement what round we are in by 1
    m_Round = 1;

    //Update Pagination Summary Divs
    showPaginationSummary();


}

function paginationNext() {

    //fire up pagination 
    pagination();

    var val;
    val = m_CurrentCursorPosition;
    var jsonObjSize = m_JsonObj.length;

    //console.log("cur pos " + val + " Total Rec : " + jsonObjSize);

    if (val >= jsonObjSize) {
        initializeListPaginationJsonObj(1, 1, 1, 0, 0);
    } else {
        initializeListPaginationJsonObj(1, 1, 1, 1, 1);


    }

    //Decrement what round we are in by 1
    m_Round++;

    //Update Pagination Summary Divs
    showPaginationSummary();


}

function paginationPrevious() {
    //Move the position of the cursor twice the distance of batchsize required
    var requiredCursorPosition = 0;

    if (m_CurrJsonObj === null || m_CurrJsonObj === undefined) {
        requiredCursorPosition = 0;
    } else {
        var jsonObjSize = m_CurrJsonObj.length;
        requiredCursorPosition = m_CurrentCursorPosition - (m_BatchOfJsonObjects + jsonObjSize);
    }


    //Check that the required position of cursor is not below zero
    if (requiredCursorPosition < 0) {
        requiredCursorPosition = 0;
    }


    //Set current location of cursor then call pagination next
    m_CurrentCursorPosition = requiredCursorPosition;

    //Call paginationNext() function
    pagination();

    //Determine what list tags for pagination require to be disabled and active
    if (requiredCursorPosition === 0) {
        initializeListPaginationJsonObj(0, 0, 1, 1, 1);
    } else {
        initializeListPaginationJsonObj(1, 1, 1, 1, 1);
    }

    //Decrement what round we are in by 1
    m_Round--;

    //Update Pagination Summary Divs
    showPaginationSummary();

}

function paginationLast() {
    //Get size of main JSONArray

    var jsonObjSize = m_JsonObj.length;

    //Conduct a modulus operation.
    recordsToGoBack = jsonObjSize % m_BatchOfJsonObjects;
    //Required cursor location

    var requiredCursorPosition = 0;

    if (recordsToGoBack === 0) {
        requiredCursorPosition = jsonObjSize - m_BatchOfJsonObjects;
    } else {
        requiredCursorPosition = jsonObjSize - recordsToGoBack;
    }


    //Set current location of cursor then call pagination next
    m_CurrentCursorPosition = requiredCursorPosition;

    //Call paginationNext() function

    pagination();

    //intialize the list tag pagination summmary div
    //first,prev,round,next,last
    initializeListPaginationJsonObj(1, 1, 1, 0, 0);

    //Decrement what round we are in by 1
    var mod = jsonObjSize % m_BatchOfJsonObjects;//modulus
    var wholenumber = Math.floor(jsonObjSize / m_BatchOfJsonObjects);
    if (mod > 0) {
        m_Round = wholenumber + 1;
    } else {
        m_Round = wholenumber + 0;
    }

    //Update Pagination Summary Divs
    showPaginationSummary();

}

function showPaginationSummary() {
    //Showing 1-30 of 2906 results:   

    //get elements showing pagination summry
    var elem1 = document.getElementById("idPaginationSummaryTop");
    var elem2 = document.getElementById("idPaginationSummaryBottom");

    //get size of json array showing displayed results
    var m_CurrJsonObjSize = m_CurrJsonObj.length;

    //pagination end record.
    var m_PaginationEndRecord;

    //check that the predetermined batch size is not less than the size of the objects to be displayed
    if (m_CurrJsonObjSize < m_BatchOfJsonObjects) {
        m_PaginationEndRecord = m_PaginationStartRecord + m_CurrJsonObjSize;
    } else {
        m_PaginationEndRecord = m_PaginationStartRecord + m_BatchOfJsonObjects;
    }


    var str = "Showing " + m_PaginationStartRecord + "-" + m_PaginationEndRecord + " of " + m_TotalRecords + " results:";

    elem1.innerHTML = str;
    elem2.innerHTML = str;

    //Reset pagination start record variable
    m_PaginationStartRecord = -1;

    //Display what round we are in now
    elem1 = document.getElementById("idRoundTop");
    elem2 = document.getElementById("idRoundBottom");
    elem1.innerHTML = m_Round;
    elem2.innerHTML = m_Round;

}

//Create function that retrives the current records
function returnJSONObjects(currentCurPos, m_BatchOfJsonObjects) {
    var currentJSONObjects = [];
    var counter = 0;
    var returnedRecords = 0;

    m_TotalRecords = m_JsonObj.length;

    $.each(m_JsonObj, function () {
        if (counter >= currentCurPos && returnedRecords < m_BatchOfJsonObjects) {
            if (m_PaginationStartRecord === -1) {
                m_PaginationStartRecord = counter;
                //console.log("Pagination Start Record : " + m_PaginationStartRecord);
            }
            item = {};
            $.each(this, function (name, value) {
                item [name] = value;
            });
            currentJSONObjects.push(item);
            returnedRecords++;
        }
        counter++;
    });

    //console.log("End of the  " + round + " of objects " + returnedRecords + " Records");

    //call function to set the current position of the cursor
    setCurrentCursorPosition(returnedRecords);

    //Current cursor position
    //console.log("Current Cursor Position  " + m_CurrentCursorPosition);

    //return current json objects
    return JSON.stringify(currentJSONObjects);
}

//sets current position of cursor
function setCurrentCursorPosition(returnedRecords) {
    m_CurrentCursorPosition += returnedRecords;
}

function initializeListPaginationJsonObj(first, prev, round, next, last) {

    //0,0,1,1,1
    m_ListPaginationJsonObj ["idPaginationFirstTop"] = first;
    m_ListPaginationJsonObj ["idPaginationPreviousTop"] = prev;
    m_ListPaginationJsonObj ["idPaginationRoundTop"] = round;
    m_ListPaginationJsonObj ["idPaginationNextTop"] = next;
    m_ListPaginationJsonObj ["idPaginationLastTop"] = last;

    m_ListPaginationJsonObj ["idPaginationFirstBottom"] = first;
    m_ListPaginationJsonObj ["idPaginationPreviousBottom"] = prev;
    m_ListPaginationJsonObj ["idPaginationRoundBottom"] = round;
    m_ListPaginationJsonObj ["idPaginationNextBottom"] = next;
    m_ListPaginationJsonObj ["idPaginationLastBottom"] = last;

    //Call function to set appropriate class
    setListPaginationClasses();
}

function setListPaginationClasses() {
    //Loop through JSON object
    $.each(m_ListPaginationJsonObj, function (key, value) {
        //console.log(key, value);
        if (value === 0) {
            $("#" + key).addClass('disabled');
        } else {
            $("#" + key).removeClass('disabled');
        }
    });
}

function wirePaginationNavigationEvents() {
    //Pagination First
    $('#idPaginationFirstTop').on("click", function () {

        if ($('#idPaginationFirstTop').hasClass("disabled") === false) {
            paginationFirst();
        }

    });
    //Pagination Previous
    $('#idPaginationPreviousTop').on("click", function () {

        if ($('#idPaginationPreviousTop').hasClass("disabled") === false) {
            paginationPrevious();
        }

    });
    //Pagination Next
    $('#idPaginationNextTop').on("click", function () {

        if ($('#idPaginationNextTop').hasClass("disabled") === false) {
            paginationNext();
        }

    });
    //Pagination Last
    $('#idPaginationLastTop').on("click", function () {

        if ($('#idPaginationLastTop').hasClass("disabled") === false) {
            paginationLast();
        }

    });

    ////
    /////Bottom pagination
    /////
    //Pagination First
    $('#idPaginationFirstBottom').on("click", function () {

        if ($('#idPaginationFirstBottom').hasClass("disabled") === false) {
            paginationFirst();
        }

    });
    //Pagination Previous
    $('#idPaginationPreviousBottom').on("click", function () {

        if ($('#idPaginationPreviousBottom').hasClass("disabled") === false) {
            paginationPrevious();
        }

    });
    //Pagination Next
    $('#idPaginationNextBottom').on("click", function () {

        if ($('#idPaginationNextBottom').hasClass("disabled") === false) {
            paginationNext();
        }

    });
    //Pagination Last
    $('#idPaginationLastBottom').on("click", function () {

        if ($('#idPaginationLastBottom').hasClass("disabled") === false) {
            paginationLast();
        }

    });
}

//Document is Ready
$(document).ready(function () {

    //create json from servlet/jsp
    jsonMe();

    //call function to test json object load of current objects at init
    paginationNext();

    var val = $("#idSelectDisplayMode").val();
    selectDisplayMode(val);

    //Filters
    registerEvents();

    //intialize the list tag pagination summmary div
    //first,prev,round,next,last
    initializeListPaginationJsonObj(0, 0, 1, 1, 1);

    try {
        //loadWorkspaceDatasets("geonode");
    } catch (err) {
        console.log("Load Datasets Error " + err.message);
    }

    //Show on map
    $(document).on("click", ".showOnMap", function () {

        var workspace = $(this).attr('data-workspace');
        var featurename = $(this).attr('data-featurename');
        alert(workspace + " "+featurename)
        showInMap2(workspace,featurename);

    });

    wirePaginationNavigationEvents();
});


