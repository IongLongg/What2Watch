<%-- 
    Document   : home
    Created on : Dec 20, 2020, 12:47:21 AM
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
                <button
                    class="navbar-toggler"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                >
                  <i class="fas fa-bars"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <form 
                        action="<%=request.getContextPath()%>/search"
                        method="get"
                        class="d-flex input-group w-auto mx-auto">
                        <input 
                            class="form-control mr-sm-2" 
                            type="search" 
                            placeholder="Search" 
                            aria-label="Search"
                            name="title">
                        <button class="btn btn-outline-info my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
                    </form>
                    <ul class="navbar-nav mr-auto">
                      <li class="nav-item active">
                        <a class="nav-link" href="<%=request.getContextPath()%>/user"><i class="fas fa-user-circle"></i>   My Account</a>
                      </li>
                      <li class="nav-item active">
                        <a class="nav-link" href="<%=request.getContextPath()%>/logout"><i class="fas fa-sign-out-alt"></i>  Logout</a>
                      </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <h1 class="my-4"><i class="fab fa-imdb"></i>  Top popular movie</h1>
            <div class="row">
                <c:forEach items="${movies}" var="movie">
                    <div class="col-sm-6 col-md-4 col-lg-3">
                        <div class="card shadow mb-4" style="width: auto;">
                            <img class="card-img-top" src="https://image.tmdb.org/t/p/w1280${movie.poster_path}" alt="${movie.poster_path}">
                            <div class="card-body">
                              <h5 class="card-title">${movie.original_title}</h5>
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Release Date : ${movie.release_date}</li>
                                <li class="list-group-item">Popularity : ${movie.popularity}</li>
                                <li class="list-group-item">${movie.overview}</li>
                            </ul>
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <a href="https://www.themoviedb.org/movie/${movie.id}" target="_blank" class="btn btn-primary"><i class="fas fa-ellipsis-v"></i>  More</a>
                                    <a 
                                        id="like" 
                                        data-id="${movie.id}" 
                                        class="btn btn-info"
                                        href="javascript:void(0)"><i class="fas fa-thumbs-up"></i>  Like</a>
                                </div>
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
                        <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/movie?page=${page - 2}">Previous</a></li>
                    </c:if>

                    <c:forEach begin="${page-1}" end="${page+3}" var="i">
                        <c:choose>
                            <c:when test="${page eq i}">
                                <li class="page-item active"><a class="page-link"> ${i}</a></li>
                            </c:when>
                            <c:when test="${i eq 0}">
                            <li class="page-item disabled"><a class="page-link"> Previous</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/movie?page=${i}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <%--For displaying Next link --%>
                    <c:if test="${page lt totalPage}">
                        <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/movie?page=${page + 1}">Next</a></li>
                    </c:if> 
                </ul>
            </nav>
        </div>
        <footer class="bg-light text-center text-lg-start">
            <!-- Copyright -->
            <div class="w-100 text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
              © 2020 Copyright:
              <a class="text-dark" href="#">Movie App</a>
            </div>
        </footer>               
        <jsp:include page="../layout/footer.jsp"></jsp:include>
        <script>
            $(document).ready(function(){
                
                // handle like button
                $(document).on("click", "#like", function(e) {
                    var movieId = $(this).data('id').toString();
                    like(movieId);
                    e.preventDefault();
                });
            });
            
            function like(movieId){
                $.ajax({
                    type: "POST",
                    url: "user/like.jsp",
                    dataType: 'JSON',
                    data: 'movieId='+movieId+'&userId='+${sessionScope.user.id}
                }).done(function(response){
                    Swal.fire("Liked!", response.message, response.status);
                }).fail(function(){
                    Swal.fire('Oops...', 'Something went wrong!', 'error');
                });
            }

        </script>
    </body>
</html>
