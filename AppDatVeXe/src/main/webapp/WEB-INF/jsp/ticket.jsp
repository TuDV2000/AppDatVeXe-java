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



<div class="ticket-container">
    <h1 class="title-page"> thông tin vé </h1>
    <div class="ticket-data-container">
        <div class="ticket-data">
            <h3 class="start-place-title">30/08/2021</h3>
            <h3 class="trip-star-place"> Khởi hành : Sài Gòn </h3>
            <h3 class="trip-destination"> Điểm đến : Hà Nội </h3>
            <h3>Số ghế : </h3>
            <h3>Tổng tiền</h3>
            <h3 class="start-place-title">1.500.000</h3>
            <img class="bus-img" src="<c:url value="/images/xe-nha-1.png" />" />
        </div>
        <div class="sit-position">
            <h3 class="start-place-title">Sơ đồ ghế</h3>
            <div class="seat-table-container">
                    <%-- Hiển thị các ghế ở đây --%>
                <div class="seat-table">
                    <button class="empty-seat" >
                        <img class="seat-icon" src="<c:url value="/images/svg/account.svg" />" />
                        <p class="seat-id">A1</p>
                    </button>
                    <button class="booked-seat" >
                        <img class="seat-icon" src="<c:url value="/images/svg/account.svg" />" />
                        <p class="seat-id">A1</p>
                    </button>
                </div>
                        <%--  Hình minh họa          --%>
                <div class="seat-statuses">
                    <div class="status-item">
                        <div class="empty-seat-icon-small-background">
                            <img class="seat-icon-small" src="<c:url value="/images/svg/account.svg" />" />
                        </div>
                        <div class="status-name">Trống</div>
                        <div class="booked-seat-icon-small-background">
                            <img class="seat-icon-small" src="<c:url value="/images/svg/account.svg" />" />
                        </div>
                        <div class="status-name">Đã đặt</div>
                    </div>
                </div>
                <div class="selected-seat-container">
                </div>
            </div>
        </div>
    </div>
    <div class="ticket-btn-container">
        <div class="ticket-btn-return">
            <button type="button" class="btn btn-primary btn-lg ticket">Quay Lại</button>
        </div>
        <div class="ticket-btn-submit">
            <button type="button" class="btn btn-primary btn-lg ticket">Đặt vé</button>
        </div>

    </div>

</div>
