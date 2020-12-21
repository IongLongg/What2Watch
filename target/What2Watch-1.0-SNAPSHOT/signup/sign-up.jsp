<%-- 
    Document   : sign-up
    Created on : Dec 19, 2020, 1:24:46 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../layout/header.jsp"></jsp:include>
    <body>
        <div class="container ">
            <h1>Sign up</h1>
            <form 
                class="w-50" 
                action="<%=request.getContextPath()%>/sign-up" 
                method="POST">
                    <div class="form-group">
                      <label for="fullname">Full name</label>
                      <input type="text" class="form-control" id="fullname" name="fullname" required>
                    </div>
                    <div class="form-group">
                      <label for="username">Username</label>
                      <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="form-group">
                      <label for="password">Password</label>
                      <input type="password" class="form-control" id="password" name="password" required>
                    </div>

                    <div class="alert alert-primary center form-group" role="alert">
                        <p>${notifyMessage}</p>
                    </div>

                    <button type="submit" class="btn btn-primary">Sign up</button>
                    <a class="btn btn-outline-primary" href="<%=request.getContextPath()%>/login">Login</a>
              </form>
        </div>
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </body>
</html>
