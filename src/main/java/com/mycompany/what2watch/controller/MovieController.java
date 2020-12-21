/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.what2watch.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.mycompany.what2watch.dao.HandleMovieAPI;
import static com.mycompany.what2watch.dao.HandleMovieAPI.API_KEY;
import static com.mycompany.what2watch.dao.HandleMovieAPI.FEATURED_API;
import com.mycompany.what2watch.model.Movie;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Admin
 */
@WebServlet("/movie")
public class MovieController extends HttpServlet {
    HandleMovieAPI hma;

    @Override
    public void init()  {
        hma = new HandleMovieAPI();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("user") == null){
            req.getRequestDispatcher("login/login.jsp").forward(req, resp);
        } else {
            int page=1;
            if(req.getParameter("page") != null){
                page = Integer.parseInt(req.getParameter("page"));
            }
            
            List<Movie> movies = new ArrayList<>();
            HttpResponse <JsonNode> response;
            try {
                response = Unirest.get(FEATURED_API)
                            .queryString("api_key", API_KEY)
                            .queryString("page", page)
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

                req.setAttribute("movies", movies);
                req.setAttribute("page", Integer.parseInt(response.getBody().getObject().get("page").toString()));
                req.setAttribute("totalPage", Integer.parseInt(response.getBody().getObject().get("total_pages").toString()));
                RequestDispatcher view = req.getRequestDispatcher("movie/movie.jsp");
                view.forward(req, resp);
            } catch (UnirestException ex) {
                Logger.getLogger(MovieController.class.getName()).log(Level.SEVERE, null, ex);
            } 
        }
    }

}
