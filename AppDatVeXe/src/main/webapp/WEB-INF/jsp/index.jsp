<%-- 
    Document   : index
    Created on : Aug 16, 2021, 10:13:08 PM
    Author     : VanTu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>

<div class="hero-container">
    <img class="main-img" src="<c:url value="/images/img-10.jpg"/>" alt="anh" >
</div>
<div class="book-ticket">
    <div class="book-ticket-container">
        <div class="select-container">
            <div class="select-place-container">
                <div class="auto-fill-place">
                    <label class="label-small">Điểm đi</label>
                    <select class="selectpicker place">
                        <option>       </option>
                        <option>Sài Gòn</option>
                        <option>Hà Nội</option>
                        <option>Đà Nẵng</option>
                    </select>
                </div>
                <div class="auto-fill-place">
                    <label class="label-small">Điểm đến</label>
                    <select class="selectpicker place">
                        <option>    </option>
                        <option>Hà Nội</option>
                        <option>Sài Gòn</option>
                        <option>Đà Nẵng</option>
                    </select>
                </div>
            </div>
            <div class="select-date-container">
                <div class="select-date">
                    <label class="label-small">Ngày đi</label>
                    <input class="input-date" type="date">
                </div>
            </div>
        </div>
        <Button type="button" class="btn btn-primary search">TÌM CHUYẾN</Button>
    </div>
</div>
<div class='cards'>
    <h2>NHỮNG TUYẾN ĐI PHỔ BIẾNN </h2>
    <div class='cards__container'>
        <div class='cards__wrapper'>
            <ul class='cards__items'>
                <li class='cards__item'>
                    <a class='cards__item__link' href="#">
                    <figure class='cards__item__pic-wrap' data-category="Sài Gòn => Hà Nội">
                        <img
                                class='cards__item__img'
                                alt='Travel Image'
                                src="<c:url value="images/hanoi.jpg"/>"
                        />
                    </figure>
                    <div class='cards__item__info'>
                        <label class='cards__item__text'>
                            <i class="fas fa-map-marker-alt"></i>
                            1.723km
                        </label>
                        <label class='cards__item__text'>
                            <i class="fas fa-clock"></i>
                            8
                        </label>
                        <label class='cards__item__text'>
                            <i class="fas fa-money-bill-wave"></i>
                            1.500.000
                        </label>
                    </div>
                    </a>
                </li>
                <li class='cards__item'>
                    <a class='cards__item__link' href="#">
                        <figure class='cards__item__pic-wrap' data-category="Sài Gòn => Hà Nội">
                            <img
                                    class='cards__item__img'
                                    alt='Travel Image'
                                    src="<c:url value="images/hanoi.jpg"/>"
                            />
                        </figure>
                        <div class='cards__item__info'>
                            <label class='cards__item__text'>
                                <i class="fas fa-map-marker-alt"></i>
                                1.723km
                            </label>
                            <label class='cards__item__text'>
                                <i class="fas fa-clock"></i>
                                8
                            </label>
                            <label class='cards__item__text'>
                                <i class="fas fa-money-bill-wave"></i>
                                1.500.000
                            </label>
                        </div>
                    </a>
                </li>
            </ul>
            <ul class='cards__items'>
                <li class='cards__item'>
                    <a class='cards__item__link' href="#">
                        <figure class='cards__item__pic-wrap' data-category="Sài Gòn => Hà Nội">
                            <img
                                    class='cards__item__img'
                                    alt='Travel Image'
                                    src="<c:url value="images/hanoi.jpg"/>"
                            />
                        </figure>
                        <div class='cards__item__info'>
                            <label class='cards__item__text'>
                                <i class="fas fa-map-marker-alt"></i>
                                1.723km
                            </label>
                            <label class='cards__item__text'>
                                <i class="fas fa-clock"></i>
                                8
                            </label>
                            <label class='cards__item__text'>
                                <i class="fas fa-money-bill-wave"></i>
                                1.500.000
                            </label>
                        </div>
                    </a>
                </li>
                <li class='cards__item'>
                    <a class='cards__item__link' href="#">
                        <figure class='cards__item__pic-wrap' data-category="Sài Gòn => Hà Nội">
                            <img
                                    class='cards__item__img'
                                    alt='Travel Image'
                                    src="<c:url value="images/hanoi.jpg"/>"
                            />
                        </figure>
                        <div class='cards__item__info'>
                            <label class='cards__item__text'>
                                <i class="fas fa-map-marker-alt"></i>
                                1.723km
                            </label>
                            <label class='cards__item__text'>
                                <i class="fas fa-clock"></i>
                                8
                            </label>
                            <label class='cards__item__text'>
                                <i class="fas fa-money-bill-wave"></i>
                                1.500.000
                            </label>
                        </div>
                    </a>
                </li>
                <li class='cards__item'>
                    <a class='cards__item__link' href="#">
                        <figure class='cards__item__pic-wrap' data-category="Sài Gòn => Hà Nội">
                            <img
                                    class='cards__item__img'
                                    alt='Travel Image'
                                    src="<c:url value="images/hanoi.jpg"/>"
                            />
                        </figure>
                        <div class='cards__item__info'>
                            <label class='cards__item__text'>
                                <i class="fas fa-map-marker-alt"></i>
                                1.723km
                            </label>
                            <label class='cards__item__text'>
                                <i class="fas fa-clock"></i>
                                8
                            </label>
                            <label class='cards__item__text'>
                                <i class="fas fa-money-bill-wave"></i>
                                1.500.000
                            </label>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="tugi-quality-honor">
    <div class="title-container">
        <label class="title">TUGI - Chất lượng là danh dự</label>
    </div>
    <div class="summary">
        <div class="summary-item">
            <img class="summary-icon" src="<c:url value="images/svg/group.svg"/>" alt="group" />
            <div class="text">
                <p class="summary-title">20M</p>
                <p class="subtitle">Hơn 20 triệu lượt khách</p>
                <p class="des">Tư Giang phục vụ hơn 20 triệu lượt khách/bình quân 1 năm trên toàn quốc</p>
            </div>
        </div>
        <div class="summary-item">
            <img class="summary-icon" src="<c:url value="images/svg/ticketing.svg"/>" alt="ticketing" />
            <div class="text">
                <p class="summary-title">250</p>
                <p class="subtitle">Hơn 250 phòng vé, phòng hàng</p>
                <p class="des">Tư Giang có hơn 250 phòng vé, trạm trung chuyển, bến xe... trên toàn hệ thống</p>
            </div>
        </div>
        <div class="summary-item">
            <img class="summary-icon" src="<c:url value="images/svg/bus.svg"/>" alt="bus" />
            <div class="text">
                <p class="summary-title">1,600</p>
                <p class="subtitle">Hơn 1,600 chuyến mỗi ngày</p>
                <p class="des">Tư Giang phục vụ hơn 1600 chuyến xe đường dài và liên tỉnh mỗi ngày</p>
            </div>
        </div>

    </div>
</div>

