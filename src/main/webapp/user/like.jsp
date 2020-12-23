<%-- 
    Document   : like
    Created on : Dec 23, 2020, 10:38:18 AM
    Author     : Admin
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mycompany.what2watch.utils.JDBCUtils"%>
<%
    if(request.getParameter("movieId") != null 
        && request.getParameter("userId") != null){
        int movieId =  Integer.parseInt(request.getParameter("movieId"));
        int userId = Integer.parseInt(request.getParameter("userId"));

        try{
            Connection connection = JDBCUtils.getConnection();
            PreparedStatement ps = connection.prepareStatement("insert into likeMovies" + 
                                                                "(userId, movieId) values" +
                                                                "(? , ?)");

            ps.setInt(1, userId);
            ps.setInt(2, movieId);

            int stt = ps.executeUpdate();

            JSONObject jsonObj = new JSONObject();
            if(stt != 0){
                jsonObj.put("status", "success");
                jsonObj.put("message", "Like successfully !");
            } else {
                jsonObj.put("status", "error");
                jsonObj.put("message", "Unable to like");
            }
            out.print(jsonObj);
            connection.close();
        } catch (SQLException e) {
            JDBCUtils.printSQLException(e);
        }
    }
%>
