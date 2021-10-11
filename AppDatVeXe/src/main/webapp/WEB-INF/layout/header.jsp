<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:url var="pageRegist" value="/add" />
<c:url var="home" value="/" />

<nav class="navbar">
    <div class="navbar-container">
        <a href="${home}" class="navbar-logo">
            TuGi
            <i class="fas fa-bus-alt" />
        </a>
        <div class="menu-icon">
            <i class="fas fa-times"/>
        </div>
        <ul class="nav-menu active">
            <li class="nav-item">
                <a href="${home}" class="nav-links">Trang chủ</a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-links">Tuyến xe</a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-links">Hướng dẫn</a>
            </li>

            <li class="nav-item">
                <a href="#" class="nav-links">Đặt vé</a>
            </li>

            <li class="nav-item">
                <a href="${pageRegist}" class="nav-links">ĐĂNG KÝ</a>
            </li>
        </ul>
    </div>
</nav>