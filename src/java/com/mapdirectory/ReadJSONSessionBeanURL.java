/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapdirectory;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Iterator;
import javax.ejb.Stateless;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author dmuthami
 */
@Stateless
public class ReadJSONSessionBeanURL {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    public JSONArray printGeonodeElementsURL(String jsonObj, String url) throws MalformedURLException, IOException, ParseException {
        StringBuilder sb = new StringBuilder();
        URL icpac = new URL(url); // URL to Parse
        URLConnection yc = icpac.openConnection();
        BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));

        String inputLine;
        while ((inputLine = in.readLine()) != null) {
            sb.append(inputLine);
        }
        in.close();

        return parseLayersJSONObject(sb, jsonObj);
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    public JSONArray parseLayersJSONObject(StringBuilder sb, String jsonObj) throws MalformedURLException, IOException, ParseException {
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject = (JSONObject) jsonParser.parse(sb.toString());

        // get an array from the JSON object
        JSONArray lang = (JSONArray) jsonObject.get(jsonObj);// Read objects
        return lang;
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    public StringBuilder printArrayElementsURL(String jsonObj, String url) throws MalformedURLException, IOException, ParseException {
        StringBuilder sb = new StringBuilder();

        JSONParser jsonParser = new JSONParser();
        URL icpac = new URL(url); // URL to Parse
        URLConnection yc = icpac.openConnection();
        BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));

        String inputLine;
        while ((inputLine = in.readLine()) != null) {
//        JSONObject jsonObject = (JSONObject) jsonParser.parse(inputLine);
//        sb.append("jsonObject " + ":").append(jsonObject).append(System.lineSeparator()); 
            sb.append(inputLine);
//            JSONArray a = (JSONArray) jsonParser.parse(inputLine);
//
//            // Loop through each item
//            for (Object o : a) {
//                JSONObject icpacObj = (JSONObject) o;
//
//                sb.append("jsonObject " + ":").append(icpacObj).append(System.lineSeparator());               
//            }
        }
        in.close();

        return parseJSONObj(sb, jsonObj);
    }

    private StringBuilder parseJSONObj(StringBuilder sb, String jsonObj) throws ParseException {
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject = (JSONObject) jsonParser.parse(sb.toString());

        // get an array from the JSON object
        JSONArray lang = (JSONArray) jsonObject.get(jsonObj);// Read objects

        StringBuilder stringBuilder = new StringBuilder();
        Iterator i = lang.iterator();

        // take each value from the json array separately
        while (i.hasNext()) {
            JSONObject innerObj = (JSONObject) i.next();
            stringBuilder.append("Abstract :").append(innerObj.get("abstract")).append(System.lineSeparator());
            stringBuilder.append("Category :").append(innerObj.get("category__gn_description")).append(System.lineSeparator());
            stringBuilder.append("csw_type :").append(innerObj.get("csw_type")).append(System.lineSeparator());
            stringBuilder.append("csw_wkt_geometry :").append(innerObj.get("csw_wkt_geometry")).append(System.lineSeparator());
            stringBuilder.append("date :").append(innerObj.get("date")).append(System.lineSeparator());
            stringBuilder.append("detail_url :").append(innerObj.get("detail_url")).append(System.lineSeparator());
            stringBuilder.append("distribution_description :").append(innerObj.get("distribution_description")).append(System.lineSeparator());
            stringBuilder.append("distribution_url :").append(innerObj.get("distribution_url")).append(System.lineSeparator());
            stringBuilder.append("id :").append(innerObj.get("id")).append(System.lineSeparator());
            stringBuilder.append("owner__username :").append(innerObj.get("owner__username")).append(System.lineSeparator());
            stringBuilder.append("popular_count :").append(innerObj.get("popular_count")).append(System.lineSeparator());
            stringBuilder.append("rating :").append(innerObj.get("rating")).append(System.lineSeparator());
            stringBuilder.append("share_count :").append(innerObj.get("share_count")).append(System.lineSeparator());
            stringBuilder.append("srid :").append(innerObj.get("srid")).append(System.lineSeparator());
            stringBuilder.append("supplemental_information :").append(innerObj.get("supplemental_information")).append(System.lineSeparator());
            stringBuilder.append("thumbnail_url :").append(innerObj.get("thumbnail_url")).append(System.lineSeparator());
            stringBuilder.append("title :").append(innerObj.get("title")).append(System.lineSeparator());
            stringBuilder.append("uuid :").append(innerObj.get("uuid")).append(System.lineSeparator());
            stringBuilder.append(System.lineSeparator());
        }
        return stringBuilder;

    }

}
