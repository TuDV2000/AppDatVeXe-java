<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<script>
    $(document).ready(function () {

        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });

    });
</script>
<div class="wrapper">
    <!-- Sidebar -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3>Admin username</h3>
        </div>
        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link admin active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Tổng quan</a>
            <a class="nav-link admin" id="v-pills-line-tab" data-toggle="pill" href="#v-pills-line" role="tab" aria-controls="v-pills-line" aria-selected="false">Tuyến xe</a>
            <a class="nav-link admin" id="v-pills-trip-tab" data-toggle="pill" href="#v-pills-trip" role="tab" aria-controls="v-pills-trip" aria-selected="false">Chuyến xe</a>
        </div>
    </nav>
    <div id="content">
        <div class="container-fluid">
            <button type="button" id="sidebarCollapse" class="btn btn-info">
                <i class="fas fa-align-left"></i>
            </button>
        </div>
        <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                <div class="row">
                    <div class="col-sm-5 info-content">
                        <div class="navbar">
                            <span class="navbar-brand"> Tuyến xe </span>
                        </div>
                        <h3>
                            Số lượng : ${lines.size()}
                        </h3>
                        <div class="schedule-scroll admin">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Tuyến xe</th>
                                    <th>Giá vé</th>
                                    <th>Quãng đường</th>
                                    <th>Thời gian</th>
                                    <th>Số lượng chuyến</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="l" items="${lines}">
                                <tr>
                                    <td>${l.startPoint.address}    =>    ${l.endPoint.address}</td>
                                    <td>${l.price}</td>
                                    <td>${l.kilometer}km</td>
                                    <td>${l.time}h</td>
                                    <td>${l.trips.size()}</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-sm-5 info-content">
                        <div class="navbar">
                            <span class="navbar-brand"> Chuyến xe </span>
                        </div>
                        <h3>
                            Số lượng : ${trips.size()}
                        </h3>
                        <div class="schedule-scroll admin">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Chuyến xe</th>
                                    <th>Ghế trống</th>
                                    <th>Tài xế</th>
                                    <th>Thời gian khởi hành</th>
                                    <th>Thời gian dự kiến</th>
                                    <th>Phụ thu</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="t" items="${trips}">
                                <tr>
                                    <td>${t.line.startPoint.address}    =>    ${t.line.endPoint.address}</td>
                                    <td>${t.blankSeat}</td>
                                    <td>${t.driver.firstName}${t.driver.lastName}</td>
                                    <td>${t.startTime}</td>
                                    <td>${t.endTime}</td>
                                    <td>${t.extra_changes}</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-sm-6 info-content">
                        <div class="navbar">
                            <span class="navbar-brand"> Khách hàng </span>
                        </div>
                        <h3>
                            Số lượng : ${customers.size()}
                        </h3>
                        <div class="schedule-scroll admin">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Họ và Tên</th>
                                    <th>Số điện thoại</th>
                                    <th>Email</th>
                                    <th>Địa chỉ</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="c" items="${customers}">
                                <tr>
                                    <td>${c.firstName} ${c.lastName}</td>
                                    <td>${c.numberPhone}</td>
                                    <td>${c.email}</td>
                                    <td>${c.address}</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-sm-4 info-content">
                        <div class="navbar">
                            <span class="navbar-brand"> Nhân viên </span>
                        </div>
                        <h3>
                            Số lượng : ${employees.size()}
                        </h3>
                        <div class="schedule-scroll admin">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>id</th>
                                    <th>Họ và Tên</th>
                                    <th>Số điện thoại</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="e" items="${employees}">
                                <tr>
                                    <td>${e.id}</td>
                                    <td>${e.firstName} ${e.lastName}</td>
                                    <td>${e.numberPhone}</td>
                                    <td>${e.permission.name}</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="v-pills-line" role="tabpanel" aria-labelledby="v-pills-line-tab">
                <div class="col-sm-11 info-content">
                    <div class="navbar">
                        <span class="navbar-brand"> Tuyến xe </span>
                        <a class="header-nav-button-signup">
                            <button type="button" class="btn btn-outline-light admin"
                                    data-toggle="modal" data-target="#exampleModal">Thêm tuyến</button>
                        </a>
                    </div>
                    <h3>
                        Số lượng : ${lines.size()}
                    </h3>
                    <div class="schedule-scroll">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>id</th>
                                <th>Tên tuyến</th>
                                <th>Điểm bắt đầu</th>
                                <th>Điểm kết thúc</th>
                                <th>Giá </th>
                                <th>Quảng đường</th>
                                <th>Thời gian</th>
                                <th>Số lượng chuyến</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="l" items="${lines}">
                            <tr>
                                <td>${l.id}</td>
                                <td>${l.name}</td>
                                <td>${l.startPoint.address}</td>
                                <td>${l.endPoint.address}</td>
                                <td>${l.price}</td>
                                <td>${l.kilometer}km</td>
                                <td>${l.time}h</td>
                                <td>${l.trips.size()}</td>
                                <td><a href="#">Sửa</a></td>
                                <td><a href="#">Xóa</a></td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Thêm tuyến</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form id="form" method="post" action="" accept-charset="utf-8">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="name" class="col-form-label">Tên tuyến </label>
                                                <small>Erro message</small>
                                                <input type="text" class="form-control" id="name" name="name">
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="startPlace" class="col-form-label">Điểm khởi hành</label>
                                                <small>Erro message</small>
                                                <select class="form-control" id="startPlace">
                                                    <c:forEach var="l" items="${lines}">
                                                        <option>Chọn điểm</option>
                                                        <option>${l.startPoint.address}</option>
                                                    </c:forEach>
                                                </select>
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="endPlace" class="col-form-label">Điểm kết thúc</label>
                                                <small>Erro message</small>
                                                <select class="form-control" id="endPlace">
                                                    <c:forEach var="l" items="${lines}">
                                                        <option>Chọn điểm</option>
                                                        <option>${l.startPoint.address}</option>
                                                    </c:forEach>
                                                </select>
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="price" class="col-form-label">Giá vé</label>
                                                <small>Erro message</small>
                                                <input type="text" class="form-control" id="price" name="price">
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="distance" class="col-form-label">Quảng đường </label>
                                                <small>Erro message</small>
                                                <input type="text" class="form-control" id="distance" name="distance">
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="time" class="col-form-label">Thời gian</label>
                                                <small>Erro message</small>
                                                <input type="text" class="form-control" id="time" name="time">
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                            <input onclick="" type="submit" class="btn btn-primary" value="Lưu tuyến">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="v-pills-trip" role="tabpanel" aria-labelledby="v-pills-trip-tab">..4.</div>
        </div>
    </div>

</div>
