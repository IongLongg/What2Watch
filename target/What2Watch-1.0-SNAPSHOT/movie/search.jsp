<%-- 
    Document   : search
    Created on : Dec 21, 2020, 10:55:04 AM
    Author     : Admin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../layout/header.jsp"></jsp:include>
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
                        method="GET"
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
        <div class="container ">
            <div class="row">
                <c:forEach items="${movies}" var="movie">
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

            <nav class="container" aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <%--For displaying Previous link except for the 1st page --%>
                    <c:if test="${page > 2}">
                        <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/search?title=${request.getParameter("title")}&page=${page - 2}">Previous</a></li>
                    </c:if>

                    <c:forEach begin="${page-1}" end="${page+3}" var="i">
                        <c:choose>
                            <c:when test="${page eq i}">
                                <li class="page-item disabled"><a class="page-link"> ${i}</a></li>
                            </c:when>
                            <c:when test="${i eq 0}">
                            <li class="page-item disabled"><a class="page-link"> Previous</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/search?title=${title}&page=${i}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <%--For displaying Next link --%>
                    <c:if test="${page lt totalPage}">
                        <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/search?page=${page + 1}">Next</a></li>
                    </c:if> 
                </ul>
            </nav>
        </div>
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </body>
</html>

