/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.what2watch.dao;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder; 
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.mycompany.what2watch.App;
import com.mycompany.what2watch.model.Movie;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Admin
 */
public class HandleMovieAPI {
    public static final String API_KEY = "e3baaff5f3e019058caf702356e68e07";
    public static final String FEATURED_API = 
                "https://api.themoviedb.org/3/discover/movie"; 
    public static final String SEARCH_API = 
                "https://api.themoviedb.org/3/search/movie"; 
    
    
    
    public List<Movie> getAllMovie(){
        List<Movie> movies = new ArrayList<>();
        
        HttpResponse <JsonNode> response;
        try {
            response = Unirest.get(FEATURED_API)
                                .queryString("api_key", API_KEY)
                                .queryString("sort_by", "popularity.desc")
                                .asJson();
            System.out.println(response.getStatus());
            JSONArray jArray = (JSONArray) response.getBody().getObject().get("results");
            if (jArray != null) { 
                for (int i=0;i<jArray.length();i++){ 
                    JSONObject jo = (JSONObject) jArray.get(i);
                    Gson gson = new GsonBuilder().create();
                    Movie movie = gson.fromJson(jo.toString(), Movie.class);
                    movies.add(movie);
                } 
            } 
//            System.out.println(movies.size());
        } catch (UnirestException ex) {
            Logger.getLogger(App.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return movies;
    }
    
    public List<Movie> getMovieByTitle(String title){
        List<Movie> movies = new ArrayList<>();
        
        HttpResponse <JsonNode> response;
        try {
            response = Unirest.get(SEARCH_API)
                                .queryString("api_key", API_KEY)
                                .queryString("query", title)
                                .asJson();
            JSONArray jArray = (JSONArray) response.getBody().getObject().get("results");
            if (jArray != null) { 
                for (int i=0;i<jArray.length();i++){ 
                    JSONObject jo = (JSONObject) jArray.get(i);
                    Gson gson = new GsonBuilder().create();
                    Movie movie = gson.fromJson(jo.toString(), Movie.class);
                    movies.add(movie);
                } 
            } 
        } catch (UnirestException ex) {
            Logger.getLogger(App.class.getName()).log(Level.SEVERE, null, ex);
        }
        return movies;
    }
}
