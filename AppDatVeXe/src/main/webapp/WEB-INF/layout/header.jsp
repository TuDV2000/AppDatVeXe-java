<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<c:url var="schedule" value="/lines" />
<c:url var="tickets" value="/tikcets" />
<c:url var="home" value="/" />
<c:url var="signin" value="/signin" />

<script>
    var flagicon = false;
    function handleClick(){
        if(!flagicon)
        {
            document.getElementsByClassName('fas fa-bars')[0].className='fas fa-times';
            document.getElementsByClassName('navbar-nav')[0].className='navbar-nav show';
            flagicon = true;
        }
        else {
            closeNav();
        }
    }
    function closeNav(){
        document.getElementsByClassName('fas fa-times')[0].className='fas fa-bars';
        document.getElementsByClassName('navbar-nav show')[0].className='navbar-nav';
        flagicon = false;
    }
</script>
<div class="container-fluid">
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="#">
            TuGi
            <i class="fas fa-bus-alt"></i>
        </a>
        <div class='menu-icon' onclick="handleClick()">
            <i class='fas fa-bars'></i>
        </div>
        <ul class="navbar-nav">
            <li class="nav-item active" onclick="closeNav()">
                <a class="nav-link" href=${home}>Trang chủ</a>
            </li>
            <li class="nav-item active" onclick="closeNav()">
                <a class="nav-link" href="${schedule}">Tuyến xe</a>
            </li>
            <li class="nav-item active" onclick="closeNav()">
                <a class="nav-link" href="#">Đặt vé</a>
            </li>
            <li class="nav-item active" onclick="closeNav()">
                <a class="nav-link" href="${tickets}">Hướng dẫn</a>
            </li>
            <li onclick="closeNav()" >
                <a class="nav-link-signup" href=${signin}>ĐĂNG NHẬP</a>
            </li>
        </ul>
        <a class="header-nav-button-signup" href="${signin}">
            <button type="button" class="btn btn-outline-light">ĐĂNG NHẬP</button>
        </a>
    </nav>
</div>
