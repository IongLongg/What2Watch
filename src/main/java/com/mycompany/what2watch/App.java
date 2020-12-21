/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.what2watch;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.mycompany.what2watch.model.Movie;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Admin
 */
public class App {
    public static void main(String[] args) {
        // Host url
        String API_KEY = "e3baaff5f3e019058caf702356e68e07";
        String FEATURED_API = 
                    "https://api.themoviedb.org/3/movie/popular"; 
        String SEARCH_API = 
                    "https://api.themoviedb.org/3/search/movie";
        
        HttpResponse <JsonNode> response;
        try {
            response = Unirest.get(FEATURED_API)
                                .queryString("api_key", API_KEY)
                                .asJson();
            System.out.println(response.getStatus());
//            List<Movie> movies = new ArrayList<>();
//            JSONArray jArray = (JSONArray) response.getBody().getObject().get("results");
//            System.out.println(jArray.length());
//            if (jArray != null) { 
//                for (int i=0;i<jArray.length();i++){ 
//                    JSONObject jo = (JSONObject) jArray.get(i);
//                    Gson gson = new GsonBuilder().create();
//                    Movie movie = gson.fromJson(jo.toString(), Movie.class);
//                    movies.add(movie);
//                } 
//            } 
            
            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            JsonParser jp = new JsonParser();
            JsonElement je = jp.parse(response.getBody().getObject().toString());
            String prettyJsonString = gson.toJson(je);
            
            System.out.println(prettyJsonString);
            
        } catch (UnirestException ex) {
            Logger.getLogger(App.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
