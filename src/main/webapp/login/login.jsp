<%-- 
    Document   : login
    Created on : Dec 19, 2020, 5:35:25 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../layout/header.jsp"></jsp:include>
    <body>
        <div class="container mt-5 col-lg-3 col-md-4 col-sm-6">
            <h1 class="text-center">Login</h1>
            <form 
                action="<%=request.getContextPath()%>/login" 
                method="POST">
                    <div class="form-group mb-2">
                        <label class="form-label" for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="form-group mb-3">
                        <label class="form-label" for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <div class="form-group ">
                        <button type="submit" class="btn btn-primary">Login</button>
                        <a class="btn btn-outline-primary" href="<%=request.getContextPath()%>/sign-up">Sign up</a>
                    </div>
              </form>
        </div>
    </body>
</html>
