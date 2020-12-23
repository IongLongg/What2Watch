<%-- 
    Document   : record
    Created on : Dec 23, 2020, 11:39:58 AM
    Author     : Admin
--%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.what2watch.model.Movie"%>
<%@page import="com.mycompany.what2watch.dao.HandleMovieAPI"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mycompany.what2watch.utils.JDBCUtils"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mycompany.what2watch.model.User"%>

<div class="row" style="min-height: 41vh">
    <%
        User sessionUser = (User) session.getAttribute("user");

        int userId = sessionUser.getId();

        try{
            Connection connection = JDBCUtils.getConnection();
            PreparedStatement ps = connection.prepareStatement("select movieId from likeMovies where userId = ?");

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();
            ArrayList<Integer> listId = new ArrayList<>();
            while(rs.next()){
                int movieId = rs.getInt("movieId");
                listId.add(movieId);
            }
            HandleMovieAPI api = new HandleMovieAPI();
            List<Movie> movies = new ArrayList<>();
            movies = api.getMovieByIds(listId);
            
            for (Movie movie : movies) {
                %>
                    <div class="col-sm-6 col-md-4 col-lg-3">
                        <div class="card shadow mb-4" style="width: auto;">
                            <img class="card-img-top" src="https://image.tmdb.org/t/p/w1280<%=movie.getPoster_path()%>" alt="">
                            <div class="card-body">
                                <h5 class="card-title"><%=movie.getTitle()%></h5>
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Release Date : <%=movie.getRelease_date()%></li>
                                <li class="list-group-item">Popularity : <%=movie.getPopularity()%></li>
                                <li class="list-group-item"><%=movie.getOverview()%></li>
                            </ul>
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <a href="https://www.themoviedb.org/movie/<%=movie.getId()%>" target="_blank" class="btn btn-primary"><i class="fas fa-ellipsis-v"></i>  More</a>
                                    <a 
                                        id="unlike" 
                                        data-id="<%=movie.getId()%>" 
                                        class="btn btn-warning"
                                        href="javascript:void(0)"><i class="fas fa-thumbs-down"></i>  Unlike</a>
                                </div>
                                <span><%=movie.getVote_average()%></span>
                            </div>
                        </div>
                    </div>
                <%
             }
        } catch (SQLException e) {
            JDBCUtils.printSQLException(e);
        }
    %>
</div>
   
