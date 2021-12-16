<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<c:url var="home" value="/" />
<c:url var="point" value="/admin/points" />

<script src="<c:url value="/js/header.js" />"></script>
<div class="container-fluid">
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="${home}">
            TuGi
            <i class="fas fa-bus-alt"></i>
        </a>
        <div class='menu-icon' onclick="handleClick()">
            <i class='fas fa-bars'></i>
        </div>
        <ul class="navbar-nav">
            <li class="nav-item active" onclick="closeNav()">
                <a class="nav-link" href=${home}>TRANG CHỦ</a>
            </li>
            <li class="nav-item active" onclick="closeNav()">
                <a class="nav-link" href="${point}">ĐỊA ĐIỂM</a>
            </li>
            <li class="nav-item active" onclick="closeNav()">
                <a class="nav-link" href="">TUYẾN XE</a>
            </li>
            <li class="nav-item active" onclick="closeNav()">
                <a class="nav-link" href="">CHUYẾN XE</a>
            </li>
            <li class="nav-item active" onclick="closeNav()">
                <a class="nav-link" href="">NGƯỜI DÙNG</a>
            </li>
        </ul>
    </nav>
</div>
