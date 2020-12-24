/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.what2watch.controller;

import com.mycompany.what2watch.dao.UserDAO;
import com.mycompany.what2watch.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet("/signup")
public class SignUpController extends HttpServlet{
    private static final long serialVersionUID = 1L;
    private UserDAO userDao;
    
    @Override
    public void init(){
        userDao = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("signup/signup.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        signUp(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

    private void signUp(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        String fullname = req.getParameter("fullname");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        User user = new User();
        user.setFullname(fullname);
        user.setUsername(username);
        user.setPassword(password);

        try {
            int result = userDao.registerUser(user);
            if(result == 1){
                req.setAttribute("notifyMessage", "Successful !");
                req.getRequestDispatcher("signup/signup.jsp").forward(req, resp);
            } else {
                req.setAttribute("notifyMessage", "Failed !");
                req.getRequestDispatcher("signup/signup.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
}
