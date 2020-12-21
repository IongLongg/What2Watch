<%-- 
    Document   : index
    Created on : Dec 20, 2020, 3:00:22 AM
    Author     : Admin
--%>

<%@page import="com.mycompany.what2watch.model.User"%>
<%@page import="com.mycompany.what2watch.model.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.jsp.jstl.core.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="layout/header.jsp"></jsp:include>
    <body>
        <nav class="navbar sticky-top navbar-expand-md navbar-light" style="background-color: #e3f2fd;">
            <div class="container">
                <a class="navbar-brand" href="<%=request.getContextPath()%>/movie">Movie App</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                      <li class="nav-item active">
                        <a class="nav-link" href="<%=request.getContextPath()%>/login">Login <span class="sr-only">(current)</span></a>
                      </li>
                      <li class="nav-item active">
                        <a class="nav-link" href="<%=request.getContextPath()%>/sign-up">Sign up <span class="sr-only">(current)</span></a>
                      </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container ">
            <h1>Hello world</h1>
        </div>
        <jsp:include page="layout/footer.jsp"></jsp:include>
    </body>
</html>