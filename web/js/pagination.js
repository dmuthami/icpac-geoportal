/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* global jsonObj */

// Variable that stores the current position of the cursor
var currentCursorPosition;
currentCursorPosition = 0;

//Varibale to show batch of records
var batchOfJsonObjects;
batchOfJsonObjects = 10;

var currJsonObj;

function paginationFirst() {
    //Set Current Cursor Position to Zeror
    currentCursorPosition = 0;

    paginationNext();

    var val = $("#idSelectDisplayMode").val();
    selectDisplayMode(val);
}

function paginationNext() {
    //Get length of the json object
    var jsonObjSize = jsonObj.length;
    console.log("JSON Object Size : " + jsonObjSize);

    //If current cursor position is greater than  or equa to the json object length then  do nothing
    if (currentCursorPosition < jsonObjSize) {
        var me = returnJSONObjects(currentCursorPosition, batchOfJsonObjects);
        //console.log(me);
        currJsonObj = $.parseJSON(me);
        //console.log(currJsonObj);

        //Show new records on the list
        var val = $("#idSelectDisplayMode").val();
        selectDisplayMode(val);
    }

}

function paginationPrevious() {
    //Move the position of the cursor twice the distance of batchsize required
    var requiredCursorPosition = 0;

    if (currJsonObj === null || currJsonObj === undefined) {
        requiredCursorPosition = 0;
    } else {
        var jsonObjSize = currJsonObj.length;
        requiredCursorPosition = currentCursorPosition - (batchOfJsonObjects + jsonObjSize);
    }


    //Check that the required position of cursor is not below zero
    if (requiredCursorPosition < 0) {
        requiredCursorPosition = 0;
    }


    //Set current location of cursor then call pagination next
    currentCursorPosition = requiredCursorPosition;

    //Call paginationNext() function

    paginationNext();

}

function paginationLast() {
    //Get size of main JSONArray

    var jsonObjSize = jsonObj.length;

    //Conduct a modulus operation.
     recordsToGoBack = jsonObjSize % batchOfJsonObjects;
    //Required cursor location

    var requiredCursorPosition = 0;
    
    if(recordsToGoBack===0){
      requiredCursorPosition = jsonObjSize - batchOfJsonObjects;      
    } else {
        requiredCursorPosition = jsonObjSize - recordsToGoBack;
    }


    //Set current location of cursor then call pagination next
    currentCursorPosition = requiredCursorPosition;

    //Call paginationNext() function

    paginationNext();

}


//Create function that retrives the current records
function returnJSONObjects(currentCurPos, batchOfJsonObjects) {
    var currentJSONObjects = new Array();

    var counter = 0;
    var returnedRecords = 0;


    $.each(jsonObj, function () {
        if (counter >= currentCurPos && returnedRecords < batchOfJsonObjects) {
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
    //console.log("Current Cursor Position  " + currentCursorPosition);

    //return current json objects
    return JSON.stringify(currentJSONObjects);
}

//sets current position of cursor
function setCurrentCursorPosition(returnedRecords) {
    currentCursorPosition += returnedRecords;
}


//Document is Ready
$(document).ready(function () {

    //create json from servlet/jsp
    jsonMe();

//    $(document).on("click", ".pagination", function () {
////        var id = $(this).attr('data-id');
////        //$container.cycle(idd.replace('#', ''));
////        console.log("pagination id : " + this);
//
//        pagination();
//
//        var val = $("#idSelectDisplayMode").val();
//        selectDisplayMode(val);
//    });

    //call function to test json object load of current objects at init
    paginationNext();

    var val = $("#idSelectDisplayMode").val();
    selectDisplayMode(val);

    //Filters
    registerEvents();



});


