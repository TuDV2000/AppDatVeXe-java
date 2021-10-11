<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="actionAdd" value="/add"/>

<h1>Hệ thống đặt vé xe</h1>

<c:if test="${mgs != null}">${mgs}</c:if>

<form:form method="post" action="${actionAdd}" modelAttribute="user">
    <h1 class="text-center "> Đăng ký Tài Khoản</h1>
    <div class="form-group">
        <label>Username</label>
        <form:input path="username" cssClass="form-control"  />
    </div>
    <div class="form-group">
        <label>Password</label>
        <form:input path="password" cssClass="form-control"  />
    </div>
    <div class="form-group">
        <label>Last Name</label>
        <form:input path="firstName" type="text" class="form-control"   />
    </div>
    <div class="form-group">
        <label>First Name</label>
        <form:input path="lastName" type="text" class="form-control"   />
    </div>
    <div class="form-group">
        <label>Email</label>
        <form:input path="email" type="text" class="form-control"   />
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>

</form:form>

