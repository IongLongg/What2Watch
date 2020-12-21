<%-- 
    Document   : user
    Created on : Dec 21, 2020, 3:40:43 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <jsp:include page="../layout/header.jsp"/>
    <body>
        <nav class="navbar sticky-top navbar-expand-md navbar-light" style="background-color: #e3f2fd;">
            <div class="container">
                <a class="navbar-brand" href="<%=request.getContextPath()%>/movie">Movie App</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <form 
                        action="<%=request.getContextPath()%>/search"
                        method="get"
                        class="form-inline mx-auto my-2 my-lg-0 text-center">
                        <input 
                            class="form-control mr-sm-2" 
                            type="search" 
                            placeholder="Search" 
                            aria-label="Search"
                            name="title">
                        <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
                    </form>
                    <ul class="navbar-nav">
                      <li class="nav-item active">
                        <a class="nav-link" href="<%=request.getContextPath()%>/logout">Logout <span class="sr-only">(current)</span></a>
                      </li>
                      <li class="nav-item active">
                        <a class="nav-link" href="<%=request.getContextPath()%>/sign-up">Sign up <span class="sr-only">(current)</span></a>
                      </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <h1>Profile</h1>
            <div class="d-flex">
                <img 
                    src="https://media.istockphoto.com/vectors/default-avatar-profile-icon-grey-photo-placeholder-vector-id846183008?b=1&k=6&m=846183008&s=612x612&w=0&h=ZC65KHQwZj_-NvgmW8EAhNEVWjbOSUBfJXJxHXxhVrk=" 
                    alt="avatar"
                    width="300px"
                    height="300px"/>
                <ul class="list-group list-group-flush ml-4">
                    <li class="list-group-item">Full name : ${sessionScope.user.fullname}</li>
                    <li class="list-group-item">Username : ${sessionScope.user.username}</li>
                </ul>
            </div>
            <h1>List movie</h1>
            
            <div class="row">
                <c:forEach items="${movies}" var="movie">
                    <c:if test="${movies.size() == 0}">
                        <<h1>Empty</h1>
                    </c:if>
                    <div class="col-sm-6 col-md-4 col-lg-3">
                        <div class="card mb-4" style="width: auto;">
                            <img class="card-img-top" src="https://image.tmdb.org/t/p/w1280${movie.poster_path}" alt="${movie.poster_path}">
                            <div class="card-body">
                              <h5 class="card-title">${movie.original_title}</h5>
                              <p class="card-text">${movie.overview}</p>
                            </div>
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <a href="https://www.themoviedb.org/movie/${movie.id}" target="_blank" class="btn btn-primary">More</a>
                                <span>${movie.vote_average}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
                            
        </div>
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </body>
</html>
