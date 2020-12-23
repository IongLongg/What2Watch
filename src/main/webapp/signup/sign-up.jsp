<%-- 
    Document   : sign-up
    Created on : Dec 19, 2020, 1:24:46 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../layout/header.jsp"></jsp:include>
    <body>
        <div class="container mt-5 col-lg-3 col-md-4 col-sm-6">
            <h1 class="text-center">Sign up</h1>
            <form 
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
                    <div class="form-group mb-3">
                      <label for="password">Password</label>
                      <input type="password" class="form-control" id="password" name="password" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Sign up</button>
                    <a class="btn btn-outline-primary" href="<%=request.getContextPath()%>/login">Login</a>
              </form>
                <c:if test="${notifyMessage} != null">
                    <div class="alert alert-info">${notifyMessage}</div>
                </c:if>
        </div>
        <jsp:include page="../layout/footer,jsp"></jsp:include>
    </body>
</html>
