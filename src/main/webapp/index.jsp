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

                
            </div>
        </nav>
        <div class="view" style="height: 100vh;background-image: url('https://mppmduse2pmpovwapp.azurewebsites.net/wp-content/uploads/2019/09/netflix-background-9.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
            <!-- Mask & flexbox options-->
            <div class="mask rgba-blue-grey-slight flex-center justify-contents-center align-items-center">
              <!-- Content -->
              <div class="container mt-5 pt-5">
                <!--Grid row-->
                <div class="row">
                  <!--Grid column-->
                    <div class="col-md-12 mb-4 white-text text-center">
                        <h1 class="h1-reponsive white-text text-uppercase font-weight-bold mb-0 pt-md-5 pt-5 wow fadeInDown" data-wow-delay="0.3s"><strong style="color: #fff;font-size: 50px">Welcome to What2Watch</strong></h1>
                          <hr class="hr-light my-4 wow fadeInDown" data-wow-delay="0.4s">
                          <h5 class="text-uppercase mb-4 white-text wow fadeInDown" data-wow-delay="0.4s"><strong style="color: #fff">All the most popular movies</strong></h5>
                          <a href="<%=request.getContextPath()%>/movie" class="btn btn-outline-white wow fadeInDown" data-wow-delay="0.4s">Join now</a>
                          <a class="btn btn-outline-white wow fadeInDown" data-wow-delay="0.4s">About me</a>
                    </div>
                  <!--Grid column-->
                </div>
                <!--Grid row-->
              </div>
              <!-- Content -->
            </div>
            <!-- Mask & flexbox options-->
          </div>
                          <jsp:include page="layout/footer.jsp"/>
    </body>
</html>
