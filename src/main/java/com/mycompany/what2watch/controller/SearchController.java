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
import com.mycompany.what2watch.App;
import com.mycompany.what2watch.dao.HandleMovieAPI;
import static com.mycompany.what2watch.dao.HandleMovieAPI.API_KEY;
import static com.mycompany.what2watch.dao.HandleMovieAPI.SEARCH_API;
import com.mycompany.what2watch.model.Movie;
import java.io.IOException;
import java.io.PrintWriter;
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
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Admin
 */
@WebServlet("/search")
public class SearchController extends HttpServlet {
    HandleMovieAPI hma;
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    public void init(){
        hma = new HandleMovieAPI();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        int page=1;
        if(req.getParameter("page") != null){
            page = Integer.parseInt(req.getParameter("page"));
        }
        
        String titleQuery = req.getParameter("title");
        req.setAttribute("title", titleQuery);
        List<Movie> movies = new ArrayList<>();
        
        HttpResponse <JsonNode> response;
        try {
            response = Unirest.get(SEARCH_API)
                                .queryString("api_key", API_KEY)
                                .queryString("query", titleQuery)
                                .queryString("page", page)
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
            req.setAttribute("movies", movies);
            req.setAttribute("page", Integer.parseInt(response.getBody().getObject().get("page").toString()));
            req.setAttribute("totalPage", Integer.parseInt(response.getBody().getObject().get("total_pages").toString()));
            RequestDispatcher view = req.getRequestDispatcher("movie/search.jsp");
            view.forward(req, resp);
        } catch (UnirestException ex) {
            Logger.getLogger(App.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
