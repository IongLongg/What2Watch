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
                        class="d-flex input-group w-auto mx-auto">
                        <input 
                            class="form-control mr-sm-2" 
                            type="search" 
                            placeholder="Search" 
                            aria-label="Search"
                            name="title">
                        <button class="btn btn-outline-info my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
                    </form>
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="<%=request.getContextPath()%>/movie"><i class="fas fa-film"></i>  Home</a>
                        </li>
                        <li class="nav-item active">
                          <a class="nav-link" href="<%=request.getContextPath()%>/logout"><i class="fas fa-sign-out-alt"></i>  Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <div class="container">
            <br>
            <h1><i class="fas fa-address-card"></i>  Profile</h1>
            <div class="d-flex">
                <img 
                    src="https://media.istockphoto.com/vectors/default-avatar-profile-icon-grey-photo-placeholder-vector-id846183008?b=1&k=6&m=846183008&s=612x612&w=0&h=ZC65KHQwZj_-NvgmW8EAhNEVWjbOSUBfJXJxHXxhVrk=" 
                    alt="avatar"
                    width="300px"
                    height="300px"/>
                <ul class="list-group list-group-flush ml-4">
                    <li class="list-group-item">ID : ${sessionScope.user.id}</li>
                    <li class="list-group-item">Full name : ${sessionScope.user.fullname}</li>
                    <li class="list-group-item">Username : ${sessionScope.user.username}</li>
                </ul>
            </div>
                
            <br>
                
            <h1><i class="fas fa-list"></i>  List like movies</h1>
            <br>
            <div id="movies"></div>
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
                recordMovie();
                
                $(document).on("click", "#unlike", function(e){
                    var movieId = $(this).data('id').toString();
                    unlike(movieId);
                    e.preventDefault();
                }); 
            });
           
            function recordMovie(){
                $('#movies').load("user/record.jsp");
            }
           
            function unlike(movieId) {
                Swal.fire({
                    title: 'Are you sure?',
                    text: 'It will be deleted permanently',
                    type: 'warning',
                    showCancelButton: true,
                    showLoaderOnConfirm: true,
                    preConfirm: function(){
                        return new Promise(function(resolve){
                            $.ajax({
                                type: "POST",
                                url: "user/unlike.jsp",
                                dataType: 'JSON',
                                data: 'movieId='+movieId+'&userId='+${sessionScope.user.id}
                            }).done(function(response){
                                Swal.fire("Unliked!", response.message, response.status);
                                recordMovie();
                            }).fail(function(){
                                Swal.fire('Oops...', 'Something went wrong!', 'error');
                            });
                        });
                    },
                    allowOutsideClick: false
                });
            }
        </script>
    </body>
</html>
