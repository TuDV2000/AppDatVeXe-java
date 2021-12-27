<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/11/2021
  Time: 8:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="feedBack" value="/trip/feed-back" />

<c:if test="${mgs == 'Success'}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        Thanh toán thành công !!!
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
</c:if>

<!DOCTYPE html>
<div class="schedule-container">
    <div class="ticket-container">
        <h1 class="title-page"> Chi tiết vé </h1>
        <div class="ticketdetail-container">
            <div class="ticketdetail-data-container">
                <div class="vehicle-detail-container">
                    <div>
                        <img class="bus-img ticketdetail" src="<c:url value="/images/xe-nha-1.png" />" />
                    </div>
                    <section class="card-cont">
                        <h3> Biển số xe: ${ticketDetail.vehicle.licensePlate}</h3>
                        <h3> Tài xế: ${ticketDetail.vehicle.driver.firstName} ${ticketDetail.vehicle.driver.lastName}</h3>
                        <h3> Khai thác tuyến: ${ticketDetail.ticket.trip.line.startPoint.address } => ${ticketDetail.ticket.trip.line.endPoint.address }</h3>
                    </section>

                </div>
                <article class="card-ticket-detail">
                    <section class="date-ticket-detail">
                        <time>
                            <span>Ghế</span>
                            <span>${ticketDetail.seatPosition}</span>
                        </time>
                    </section>
                    <section class="card-cont">
                        <small>Mã vé: ${ticketDetail.id}</small>
                        <h3>${ticketDetail.ticket.customer.firstName} ${ticketDetail.ticket.customer.lastName}</h3>
                        <div class="even-date">
                            <i class="fa fa-calendar"></i>
                            <time>
                                <span>Khởi hành: ${ticketDetail.ticket.trip.startTime}</span>
                                <span>Thời gian quãng đường: ${ticketDetail.ticket.trip.line.time}h</span>
                            </time>
                        </div>
                        <div class="even-info">
                            <i class="fa fa-map-marker"></i>
                            <p>
                                ${ticketDetail.ticket.trip.line.startPoint.address} => ${ticketDetail.ticket.trip.line.endPoint.address}
                            </p>
                        </div>
                        <div class="even-info">
                            <i class="fas fa-money-bill"></i>
                            <p> Giá vé: ${ticketDetail.currentPrice}</p>
                        </div>
                    </section>
                    <section class="card-cont tag">
                        <p>
                            Tugi
                        </p>
                    </section>
                </article>
                <div>
                    <c:if test="${fbContent == null}">
                    <form action="${feedBack}" method="post">
                        <input name="ticketId" type="hidden" value="${ticketDetail.ticket.id}">
                        <input name="tripId" type="hidden" value="${ticketDetail.ticket.trip.id}">
                        <label for="content">Nội dung phản hồi</label>
                        <input id="content" name="content" type="text" class="form-group">
                        <input class="form-group" type="submit" value="Gửi phản hồi">
                    </form>
                    </c:if>
                    <c:if test="${fbContent != null}">
                    <h1>Bạn đã phản hồi chuyến xe này</h1>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>