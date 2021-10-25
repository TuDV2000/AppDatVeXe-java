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

    <script src="jquery-3.5.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" ></script>

    <link href="<c:url value="css/signup.css" />" rel="stylesheet" type="text/css"/>
</head>
<body>

<c:url var="home" value="/" />
<c:url var="signin" value="/signin" />

<script>
    const form = document.getElementById('form');
    form.addEventListener('submit', e => {
        e.preventDefault();

        checkInput();
    });
    function test(){
        checkInput();
        console.log(checkInput());
    }
    function checkInput(){
        const fullname = document.getElementById("fullname");
        const username = document.getElementById('username');
        const email = document.getElementById('email');
        const password = document.getElementById('password');
        const password2 = document.getElementById('password2');
        const checker = document.getElementById('checker');

        //full name
        if(fullname.value.trim() == ""){
            setErrorFor(fullname, 'Không được để trống tên của bạn');
            return false;
        }else {
            setSuccessFor(fullname);
        }
        //user name
        if(username.value.trim() == ""){
            setErrorFor(username, 'Không được để trống tên đăng nhập');
            return false;
        }else {
            setSuccessFor(username);
        }
        //email
        if(email.value.trim() ==""){
            setErrorFor(email,'Không được để trống email');
            return false;
        }else if(!isEmail(email.value.trim())){
            setErrorFor(email, 'Email không hợp lệ');
            return false;
        }else {
            setSuccessFor(email);
        }
        //password
        if(password.value.trim() == ""){
            setErrorFor(password, 'Không được để trống mật khẩu');
            return false;
        }else if (password.value.trim().length <= 6){
            setErrorFor(password,'Mật khẩu phải dài hơn 6 ký tự')
            return false;
        }else {
            setSuccessFor(password);
        }
        //password check
        if(password2.value.trim() == ""){
            setErrorFor(password2,'Không được để trống xác thực mật khẩu');
            return false;
        }else if(password.value.trim() != password2.value.trim()){
            setErrorFor(password2, 'Mật khẩu xác thực không đúng');
            return false;
        }else {
            setSuccessFor(password2);
        }
        // checker
        if (checker.checked){
            checker.parentElement.style.color = 'black';
        }else {
            checker.parentElement.style.color = 'red';
            return false;
        }
        return true;
    }
    function  setErrorFor(input, message){
        const formOutline = input.parentElement;
        const small = formOutline.querySelector('small');

        small.innerText = message;
        formOutline.className = "form-outline mb-4 error";
    }
    function setSuccessFor(input){
        const formOutline = input.parentElement;
        formOutline.className = "form-outline mb-4 success";
    }
    function isEmail(email) {
        return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
    }
</script>
<section class="bg-image" style="background-image: url('https://mdbootstrap.com/img/Photos/new-templates/search-box/img4.jpg');">
    <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 15px;">
                        <a class="back-to-mainpage" href="${signin}" >
                            <i class="fas fa-chevron-left"></i>
                            Quay lại
                        </a>
                        <div class="card-body p-5">
                            <h2 class="text-uppercase text-center mb-5">Đăng ký tài khoản</h2>

                            <form class="form-signup" id="form">
                                <div class="form-outline mb-4">
                                    <small>Erro message</small>
                                    <input type="text" id="fullname" class="form-control form-control-lg" />
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                    <label class="form-label" >Tên của bạn</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <small>Erro message</small>
                                    <input type="text" id="username" class="form-control form-control-lg" />
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                    <label class="form-label" >Tên đăng nhập</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <small>Erro message</small>
                                    <input type="email" id="email" class="form-control form-control-lg" />
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                    <label class="form-label" >Địa chỉ Email</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <small>Erro message</small>
                                    <input type="password" id="password" class="form-control form-control-lg" />
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                    <label class="form-label" >Mật khẩu</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <small>Erro message</small>
                                    <input type="password" id="password2" class="form-control form-control-lg" />
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                    <label class="form-label" >Xác thực mật khẩu</label>
                                </div>

                                <div class="form-check d-flex justify-content-center mb-5">
                                    <input
                                            id="checker"
                                            class="form-check-input me-2"
                                            type="checkbox"
                                            value=""
                                    />
                                    <label class="form-check-label" >
                                        Đồng ý với <u>các điều khoản dịch vụ</u>
                                    </label>
                                </div>

                                <div class="d-flex justify-content-center">
                                    <button onclick="test()" type="button" class="btn btn-success btn-block btn-lg gradient-custom-4 text-white">Đăng ký</button>
                                </div>

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
