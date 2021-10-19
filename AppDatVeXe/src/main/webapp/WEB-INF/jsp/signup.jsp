<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/19/2021
  Time: 10:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" ></script>

    <link href="<c:url value="css/signup.css" />" rel="stylesheet" type="text/css"/>
</head>
<body>

<c:url var="home" value="/" />

<section class="vh-100 bg-image" style="background-image: url('https://mdbootstrap.com/img/Photos/new-templates/search-box/img4.jpg');">
    <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 15px;">
                        <a class="back-to-mainpage" href="${home}">
                            <i class="fas fa-chevron-left"></i>
                            Quay lại
                        </a>
                        <div class="card-body p-5">
                            <h2 class="text-uppercase text-center mb-5">Đăng ký tài khoản</h2>

                            <form>

                                <div class="form-outline mb-4">
                                    <input type="text" id="form3Example1cg" class="form-control form-control-lg" />
                                    <label class="form-label" for="form3Example1cg">Tên của bạn</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="email" id="form3Example3cg" class="form-control form-control-lg" />
                                    <label class="form-label" for="form3Example3cg">Địa chỉ Email</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="password" id="form3Example4cg" class="form-control form-control-lg" />
                                    <label class="form-label" for="form3Example4cg">Mật khẩu</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="password" id="form3Example4cdg" class="form-control form-control-lg" />
                                    <label class="form-label" for="form3Example4cdg">Xác thực mật khẩu</label>
                                </div>

                                <div class="form-check d-flex justify-content-center mb-5">
                                    <input
                                            class="form-check-input me-2"
                                            type="checkbox"
                                            value=""
                                    />
                                    <label class="form-check-label" for="form2Example3g">
                                        Đồng ý với <u>các điều khoản dịch vụ</u>
                                    </label>
                                </div>

                                <div class="d-flex justify-content-center">
                                    <button type="button" class="btn btn-success btn-block btn-lg gradient-custom-4 text-white">Đăng ký</button>
                                </div>

                                <p class="text-center text-muted mt-5 mb-0">Đã có tài khoản? <a href="#!" class="fw-bold text-body"><u>Đăng nhập ở đây</u></a></p>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
