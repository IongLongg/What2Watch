/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.what2watch.model;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class Movie implements Serializable{
    private static final long serialVersionUID = 1L;
    
    private String overview;
    private String original_language;
    private String original_title;
    private boolean video;
    private String title;
    private int[] genre_ids;
    private int id;
    private String poster_path;
    private String backdrop_path;
    private String release_date;
    private double popularity;
    private double vote_average;
    private boolean adult;
    private int vote_count;

    public Movie() {
    }

    public Movie(String overview, String original_language, String original_title, boolean video, String title, int[] genre_ids, String poster_path, String backdrop_path, String release_date, double popularity, double vote_average, boolean adult, int vote_count, int id) {
        this.overview = overview;
        this.original_language = original_language;
        this.original_title = original_title;
        this.video = video;
        this.title = title;
        this.genre_ids = genre_ids;
        this.poster_path = poster_path;
        this.backdrop_path = backdrop_path;
        this.release_date = release_date;
        this.popularity = popularity;
        this.vote_average = vote_average;
        this.adult = adult;
        this.vote_count = vote_count;
        this.id = id;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getOverview() {
        return overview;
    }

    public String getOriginal_language() {
        return original_language;
    }

    public String getOriginal_title() {
        return original_title;
    }

    public boolean isVideo() {
        return video;
    }

    public String getTitle() {
        return title;
    }

    public int[] getGenre_ids() {
        return genre_ids;
    }

    public String getPoster_path() {
        return poster_path;
    }

    public String getBackdrop_path() {
        return backdrop_path;
    }

    public String getRelease_date() {
        return release_date;
    }

    public double getPopularity() {
        return popularity;
    }

    public double getVote_average() {
        return vote_average;
    }

    public boolean isAdult() {
        return adult;
    }

    public int getVote_count() {
        return vote_count;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
