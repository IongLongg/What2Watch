/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.what2watch.dao;

import com.mycompany.what2watch.model.LoginBean;
import com.mycompany.what2watch.model.User;
import com.mycompany.what2watch.utils.JDBCUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class UserDAO {
    public int registerUser(User user) throws ClassNotFoundException, SQLException {
        String INSERT_USERS_SQL = "INSERT INTO users" +
            "  (fullname, username, password) VALUES " +
            " (?, ?, ?);";

        int result = 0;
        try (Connection connection = JDBCUtils.getConnection();
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getFullname());
            preparedStatement.setString(2, user.getUsername());
            preparedStatement.setString(3, user.getPassword());

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            JDBCUtils.printSQLException(e);
        }
        return result;
    }
    
    public User getSessionUser(LoginBean loginBean){
        User user = null;
        String SELECT_USER_SQL = "SELECT * FROM users WHERE username = ? and password = ?";
        
        try (
                Connection connection = JDBCUtils.getConnection();
                PreparedStatement ps = connection.prepareStatement(SELECT_USER_SQL)
            ){
                ps.setString(1, loginBean.getUsername());
                ps.setString(2, loginBean.getPassword());
                System.out.println(ps);
                
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    int id = rs.getInt("id");
                    String dbfullname = rs.getString("fullname");
                    String dbusername = rs.getString("username");
                    user = new User();
                    user.setFullname(dbfullname);
                    user.setUsername(dbusername);
                    user.setId(id);
                }
        } catch (SQLException ex) {
            JDBCUtils.printSQLException(ex);
        }
        
        return user;
    } 
    
    public ArrayList<Integer> getListLikeMovieId(int userId){
        ArrayList<Integer> movieIds = new ArrayList<>();
        
        String SELECT_LIKEMOVIE_FROM_USER = "select movieId from likeMovies where userId = ?";
        
        try (
                Connection connection = JDBCUtils.getConnection();
                PreparedStatement ps = connection.prepareStatement(SELECT_LIKEMOVIE_FROM_USER)
            ){
                ps.setString(1, Integer.toString(userId));
                System.out.println(ps);
                
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    int movie_id = rs.getInt("movieId");
                    movieIds.add(movie_id);
                }
        } catch (SQLException ex) {
            JDBCUtils.printSQLException(ex);
        }
        return movieIds;
    }
}
