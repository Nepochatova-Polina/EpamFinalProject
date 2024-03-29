<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:setBundle basename="resources"/>

<html lang="${sessionScope.locale}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><fmt:message key="login.title"/></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <style>
        <%@include file="/Styles/auth.css" %>
    </style>
</head>
<body>
<div class="container" id="container">
    <div class="container align-content-center">
        <br>
        <h2 class="text-center" style="margin-top: 50px; color: aliceblue"><fmt:message key="header.login"/></h2>
        <div id="locale-changer" class="form-control">
                <form method="get" action="${pageContext.request.contextPath}/controller">
                    <input type="hidden" name="command" value="changeLocale">
                    <input type="hidden" name="page-path" value="/login.jsp">
                    <input class="btn" style="background: lightgray; width: 50px" type="submit" name="locale" value="ua">
                </form>
                <form method="get" action="${pageContext.request.contextPath}/controller">
                    <input type="hidden" name="command" value="changeLocale">
                    <input type="hidden" name="page-path" value="/login.jsp">
                    <input class="btn" style="background: lightgray; width: 50px;" type="submit" name="locale" value="en">
                </form>
        </div>
        <hr style="background-color: aliceblue">
        <div class="card  mx-auto">
            <article class="card-body mx-auto" style="max-width: 400px;">
                <h3 class="card-title mt-3 text-center"><fmt:message key="form.header"/></h3>
                <br>
                <form id="login-form" method="post" action="${pageContext.request.contextPath}/controller">
                    <input type="hidden" name="command" value="login"/>
                    <c:if test="${sessionScope.message != null}">
                        <h5 style="color: red; text-align: center"><fmt:message key="${sessionScope.message}"/></h5>
                    </c:if>
                    <div class="form-group">
                        <label for="login"><fmt:message key="user.label.login"/></label>
                        <input
                                type="text"
                                name="login"
                                id="login"
                                placeholder="<fmt:message key="login.login.placeholder"/>"
                                required
                                class="form-control col">
                    </div>
                    <div class="form-group">
                        <label for="password"><fmt:message key="user.label.password"/></label>
                        <input
                                type="password"
                                name="password"
                                id="password"
                                placeholder="<fmt:message key="login.password.placeholder"/>"
                                required
                                class="form-control col">
                    </div>
                    <div class=form-group" style="margin-top: 30px">
                        <button type="submit" id="login-submit" class="btn col"><fmt:message key="button.login"/> </button>
                    </div>
                    <p class="text-center">
                    <fmt:message key="form.label.misclicked"/>
                    <a href="signUp.jsp" style="color: green"><fmt:message key="button.signUp"/></a>
                    </p>
                </form>
            </article>
        </div>
    </div>

</div>
</body>
</html>