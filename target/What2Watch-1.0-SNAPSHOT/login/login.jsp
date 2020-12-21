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
        <div class="container">
            <h1>Login</h1>
            <form 
                class="w-50" 
                action="<%=request.getContextPath()%>/login" 
                method="POST">
                    <div class="form-group">
                      <label for="username">Username</label>
                      <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="form-group">
                      <label for="password">Password</label>
                      <input type="password" class="form-control" id="password" name="password" required>
                    </div>

                    <div class="alert alert-danger center form-group" role="alert">
                        <p>${notifyMessage}</p>
                    </div>

                    <button type="submit" class="btn btn-primary">Login</button>
                    <a class="btn btn-outline-primary" href="<%=request.getContextPath()%>/sign-up">Sign up</a>
              </form>
        </div>
    </body>
</html>
