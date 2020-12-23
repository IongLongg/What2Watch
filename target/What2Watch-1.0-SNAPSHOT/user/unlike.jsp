<%-- 
    Document   : unlike
    Created on : Dec 22, 2020, 4:42:43 PM
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
            PreparedStatement ps = connection.prepareStatement("delete from likeMovies where movieId = ? and userId = ?");

            ps.setInt(1, movieId);
            ps.setInt(2, userId);

            int stt = ps.executeUpdate();

            JSONObject jsonObj = new JSONObject();
            if(stt != 0){
                jsonObj.put("status", "success");
                jsonObj.put("message", "Unlike successfully !");
            } else {
                jsonObj.put("status", "error");
                jsonObj.put("message", "Unable to unlike");
            }
            out.print(jsonObj);
            connection.close();
        } catch (SQLException e) {
            JDBCUtils.printSQLException(e);
        }
    }
%>