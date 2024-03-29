<%@ page import="java.time.LocalDate" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:setBundle basename="resources"/>

<!DOCTYPE html>
<html lang="${sessionScope.locale}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title><fmt:message key="edit.cruise.title"/></title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <style>
        <%@include file="/Styles/adminForm.css" %>
    </style>
</head>
<body>
<div class="navbar row">
    <div class="navElements col-sm-6">
        <a>
            <form id="account" class="navbar-form" method="get" action="${pageContext.request.contextPath}/controller">
                <input type="submit" class="btn col" value="<fmt:message key="button.profile"/>">
                <input type="hidden" name="command" value="profile"/>
            </form>
        </a>
        <a class="active" href="../index.jsp"><fmt:message key="navbar.home"/></a>
        <a>
            <form id="catalog" class="navbar-form" method="get" action="${pageContext.request.contextPath}/controller">
                <input type="submit" class="btn col" value="<fmt:message key="button.cruises.catalogue"/>">
                <input type="hidden" name="command" value="catalogue"/>
                <input type="hidden" name="page-path" value="/catalogue.jsp">
            </form>
        </a>
    </div>
    <div class="navElements col-sm-6">
        <div id="locale-changer" class="form-control">
            <form method="get" action="${pageContext.request.contextPath}/controller">
                <input type="hidden" name="command" value="changeLocale">
                <input type="hidden" name="page-path" value="/Admin/editCruise.jsp">
                <input class="btn" style="background: lightgray; width: 50px" type="submit" name="locale"
                       value="ua">
            </form>
            <form method="get" action="${pageContext.request.contextPath}/controller">
                <input type="hidden" name="command" value="changeLocale">
                <input type="hidden" name="page-path" value="/Admin/editCruise.jsp">
                <input class="btn" style="background: lightgray; width: 50px;" type="submit" name="locale"
                       value="en">
            </form>
        </div>
    </div>
</div>
<div class="container-fluid" id="container">
    <hr style="background-color: aliceblue">
    <form id="order-form" method="post" action="${pageContext.request.contextPath}/controller"
          enctype='multipart/form-data'>
        <div class="row">
            <div class="card mx-auto col-sm-6" style="margin-right: 10px! important">
                <article class="card-body mx-auto" style="margin-top: 50px">
                    <h3 class="card-title mt-3 text-center"><fmt:message key="order.label.header"/></h3>
                    <br>
                    <input type="hidden" name="command" value="editCruise"/>
                    <div id="info">
                        <c:set var="cruise" scope="session" value="${sessionScope.cruise}"/>
                        <input type="hidden" name="id" value="<c:out value="${cruise.id}"/>">
                        <h4><fmt:message key="cruise.label.name"/>:
                            <c:out value="${cruise.name}"/>
                            <h4><fmt:message key="cruise.label.ship.name"/>:
                                <c:out value="${cruise.ship.name}"/>
                                <h4><fmt:message key="ship.label.capacity"/>:
                                    <c:out value="${cruise.ship.passengerCapacity}"/>
                                    <h4><fmt:message key="cruise.label.departure"/>:
                                        <c:out value="${cruise.route.departure}"/>
                                        <h4><fmt:message key="cruise.label.destination"/>:
                                            <c:out value="${cruise.route.destination}"/>
                                            <h4><fmt:message key="cruise.label.leaving.date"/>:
                                                <c:out value="${cruise.startOfTheCruise}"/>
                                                <h4><fmt:message key="cruise.label.arriving.date"/>:
                                                    <c:out value="${cruise.endOfTheCruise}"/>
                                                    <h4><fmt:message key="cruise.label.price"/>:
                                                        <c:out value="${cruise.price}$"/>
                                                        <h4><fmt:message key="route.label.transitTime"/>:
                                                            <c:out value="${cruise.route.transitTime}"/>
                    </div>
                </article>
            </div>
            <form>
                <div class="card mx-auto col-sm-6" style="margin-left: 10px! important">
                    <article class="card-body mx-auto">
                        <h3 class="card-title mt-3 text-center"><fmt:message key="form.header"/></h3>
                        <br>
                        <c:if test="${sessionScope.message != null}">
                            <h5 style="color: red; text-align: center"><fmt:message
                                    key="${sessionScope.message}"/></h5>
                        </c:if>
                        <form id="cruise-form">
                            <c:if test="${sessionScope.message != null}">
                                <h5 style="color: red; text-align: center"><fmt:message
                                        key="${sessionScope.message}"/></h5>
                            </c:if>
                            <div class="form-group">
                                <label for="cruise_name"><fmt:message key="cruise.label.name"/></label>
                                <input
                                        type="text"
                                        name="cruise_name"
                                        id="cruise_name"
                                        placeholder="<fmt:message key="cruise.placeholder.name"/>"
                                        class="form-control col">
                            </div>
                            <div class="form-group">
                                <label for="ship_name"><fmt:message key="cruise.label.ship.name"/></label>
                                <input
                                        type="text"
                                        name="ship_name"
                                        id="ship_name"
                                        placeholder="<fmt:message key="cruise.placeholder.name"/>"
                                        class="form-control col">
                            </div>
                            <div class="form-group">
                                <label for="passenger_capacity"><fmt:message key="ship.label.capacity"/></label>
                                <input
                                        type="number"
                                        name="passenger_capacity"
                                        id="passenger_capacity"
                                        value="0"
                                        placeholder="<fmt:message key="ship.placeholder.capacity"/>"
                                        class="form-control col">
                            </div>

                            <div class="form-group">
                                <label for="departure"><fmt:message key="route.label.departure"/></label>
                                <input
                                        type="text"
                                        name="departure"
                                        id="departure"
                                        placeholder="<fmt:message key="route.placeholder.departure"/>"
                                        class="form-control col">
                            </div>
                            <div class="form-group">
                                <label for="destination"><fmt:message key="route.label.destination"/></label>
                                <input
                                        type="text"
                                        name="destination"
                                        id="destination"
                                        placeholder="<fmt:message key="route.placeholder.destination"/>"
                                        class="form-control col">
                            </div>
                            <% LocalDate date = LocalDate.now();%>
                            <div class="form-group">
                                <label for="start_date"><fmt:message key="cruise.label.leaving.date"/></label>
                                <input
                                        type="date"
                                        name="start_date"
                                        id="start_date"
                                        min="<%=date%>"
                                        value="00/00/0000"
                                        class="form-control col">
                            </div>
                            <div class="form-group">
                                <label for="end_date"><fmt:message key="cruise.label.arriving.date"/></label>
                                <input
                                        type="date"
                                        name="end_date"
                                        id="end_date"
                                        min="<%=date%>"
                                        value="00/00/0000"
                                        class="form-control col">
                            </div>
                            <div class="form-group">
                                <label for="price"><fmt:message key="cruise.label.price"/>$</label>
                                <input
                                        type="number"
                                        name="price"
                                        id="price"
                                        value="0"
                                        placeholder="<fmt:message key="cruise.placeholder.price"/>$"
                                        class="form-control col">
                            </div>
                            <div class="form-group">
                                <label for="transit_time"><fmt:message key="route.label.transitTime"/></label>
                                <input
                                        type="number"
                                        name="transit_time"
                                        id="transit_time"
                                        value="0"
                                        placeholder="<fmt:message key="route.placeholder.transitTime"/>"
                                        class="form-control col">
                            </div>
                            <div class=form-group" style="margin-top: 30px">
                                <button type="submit" id="login-submit" class="btn final-btn col"><fmt:message
                                        key="admin.button.edit"/></button>
                            </div>
                            <p class="text-center">
                                <fmt:message key="form.label.back"/>
                                <a href="displayCruises.jsp" style="color: green"><fmt:message key="button.back"/></a>
                            </p>
                        </form>
                    </article>
                </div>
            </form>
        </div>
    </form>
</div>
</body>
</html>
