<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/17/2021
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<div class="schedule-container">
    <h1 class="title-page">Các tuyến xe</h1>
    <div class="search-container">
        <div class="search-box">
            <input type="text" placeholder="Tìm điểm đi..."></input>
            <button type="submit">
                <i class="fas fa-search-location"></i>
            </button>
        </div>
        <div class="search-box">
            <input type="text" placeholder="Tìm điểm đến..."></input>
            <button type="submit">
                <i class="fas fa-search-location"></i>
            </button>
        </div>
    </div>
    <div class="schedule-scroll">
        <div class="schedule-table">
            <table>
                <thead>
                <tr class="table-head">
                    <th class="schedule-route-name"> Tuyến xe </th>
                    <th class="date"> Ngày khởi hành </th>
                    <th class="time"> Giờ khởi hành </th>
                    <th class="prize"> Giá vé </th>
                    <th class="end">  </th>
                </tr>
                </thead>
            </table>
            <div>
                <table class="group-table">
                    <thead>
                    <tr>
                        <th colSpan="10" class="start-place-title"> Sài Gòn đi</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr class="table-data">
                            <th class="schedule-route-name">Hà Nội </th>
                            <th class="date"> 19/10/2021</th>
                            <th class="time"> 5h30 </th>
                            <th class="price"> 2000000 </th>
                            <th class="end"> <a href="#">Mua vé</a> </th>
                        </tr>
                        <tr class="table-data">
                            <th class="schedule-route-name">Hà Nội </th>
                            <th class="date"> 19/10/2021</th>
                            <th class="time"> 5h30 </th>
                            <th class="price"> 2000000 </th>
                            <th class="end"> <a href="#">Mua vé</a> </th>
                        </tr>
                        <tr class="table-data">
                            <th class="schedule-route-name">Hà Nội </th>
                            <th class="date"> 19/10/2021</th>
                            <th class="time"> 5h30 </th>
                            <th class="price"> 2000000 </th>
                            <th class="end"> <a href="#">Mua vé</a> </th>
                        </tr>
                    </tbody>
                </table>
                <table class="group-table">
                    <thead>
                    <tr>
                        <th colSpan="10" class="start-place-title"> Hà Nội đi</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="table-data">
                        <th class="schedule-route-name">Sài Gòn </th>
                        <th class="date"> 19/10/2021</th>
                        <th class="time"> 5h30 </th>
                        <th class="price"> 2000000 </th>
                        <th class="end"> <a href="#">Mua vé</a> </th>
                    </tr>
                    <tr class="table-data">
                        <th class="schedule-route-name">Vũng Tàu </th>
                        <th class="date"> 19/10/2021</th>
                        <th class="time"> 5h30 </th>
                        <th class="price"> 2000000 </th>
                        <th class="end"> <a href="#">Mua vé</a> </th>
                    </tr>
                    <tr class="table-data">
                        <th class="schedule-route-name">Nha Trang </th>
                        <th class="date"> 19/10/2021</th>
                        <th class="time"> 5h30 </th>
                        <th class="price"> 2000000 </th>
                        <th class="end"> <a href="#">Mua vé</a> </th>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>