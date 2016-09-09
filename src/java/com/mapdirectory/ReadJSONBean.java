/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapdirectory;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Iterator;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author dmuthami Creation Date : 30/08/2016
 */
public class ReadJSONBean {

    private String filePath;

    public ReadJSONBean() {
        setFilePath("E:\\Programming\\JAVA_NETBEANS\\icpac-ui-v2\\public_html\\json\\layers.json");
    }

    public String readJSON() throws FileNotFoundException, IOException, ParseException {
        //File Reader. Read the json file
        FileReader reader = new FileReader(filePath);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject = (JSONObject) jsonParser.parse(reader);

        // get a String from the JSON object
        String firstName = (String) jsonObject.get("total_count");
        //System.out.println("The total object count is: " + firstName);

        return "The total object count is: " + firstName;
    }

    public String getArraySize() throws FileNotFoundException, IOException, ParseException {
        //File Reader. Read the json file
        FileReader reader = new FileReader(filePath);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject = (JSONObject) jsonParser.parse(reader);

        // get an array from the JSON object
        JSONArray lang = (JSONArray) jsonObject.get("objects");
        String size = Integer.toString(lang.size());

        return "The array object size is: " + size;
    }

    public StringBuilder printArray(String jsonObj) throws FileNotFoundException, IOException, ParseException {
        //File Reader. Read the json file
        FileReader reader = new FileReader(filePath);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject = (JSONObject) jsonParser.parse(reader);

        // get an array from the JSON object
        JSONArray lang = (JSONArray) jsonObject.get(jsonObj);

        StringBuilder sb = new StringBuilder();
        // take the elements of the json array
        for (int i = 0; i < lang.size(); i++) {
            sb.append("The " + i + " element of the array: " + lang.get(i) + System.lineSeparator() + System.lineSeparator());
        }
        return sb;
    }

    public StringBuilder printArrayElements(String jsonObj) throws FileNotFoundException, IOException, ParseException {
        //File Reader. Read the json file
        FileReader reader = new FileReader(filePath);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject = (JSONObject) jsonParser.parse(reader);

        // get an array from the JSON object
        JSONArray lang = (JSONArray) jsonObject.get(jsonObj);

        StringBuilder sb = new StringBuilder();

        Iterator i = lang.iterator();

        // take each value from the json array separately
        while (i.hasNext()) {
            JSONObject innerObj = (JSONObject) i.next();
            sb.append("Abstract :").append(innerObj.get("abstract")).append(System.lineSeparator());
            sb.append("Category :").append(innerObj.get("category__gn_description")).append(System.lineSeparator());
            sb.append("csw_type :").append(innerObj.get("csw_type")).append(System.lineSeparator());
            sb.append("csw_wkt_geometry :").append(innerObj.get("csw_wkt_geometry")).append(System.lineSeparator());
            sb.append("date :").append(innerObj.get("date")).append(System.lineSeparator());
            sb.append("detail_url :").append(innerObj.get("detail_url")).append(System.lineSeparator());
            sb.append("distribution_description :").append(innerObj.get("distribution_description")).append(System.lineSeparator());
            sb.append("distribution_url :").append(innerObj.get("distribution_url")).append(System.lineSeparator());
            sb.append("id :").append(innerObj.get("id")).append(System.lineSeparator());
            sb.append("owner__username :").append(innerObj.get("owner__username")).append(System.lineSeparator());
            sb.append("popular_count :").append(innerObj.get("popular_count")).append(System.lineSeparator());
            sb.append("rating :").append(innerObj.get("rating")).append(System.lineSeparator());
            sb.append("share_count :").append(innerObj.get("share_count")).append(System.lineSeparator());
            sb.append("srid :").append(innerObj.get("srid")).append(System.lineSeparator());
            sb.append("supplemental_information :").append(innerObj.get("supplemental_information")).append(System.lineSeparator());
            sb.append("thumbnail_url :").append(innerObj.get("thumbnail_url")).append(System.lineSeparator());
            sb.append("title :").append(innerObj.get("title")).append(System.lineSeparator());
            sb.append("uuid :").append(innerObj.get("uuid")).append(System.lineSeparator());
            sb.append(System.lineSeparator());
        }
        return sb;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

}
