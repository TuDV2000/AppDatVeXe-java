<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="col-sm-11 info-content">
    <div class="top-table">
        <span class="navbar-brand"> Tuyến xe </span>
        <a class="header-nav-button-signup">
           <button type="button" class="btn btn-outline-light admin"
                    data-toggle="modal" data-target="#createLineModal">Thêm tuyến</button>
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
            <c:forEach var="l" items="${lines}">
                <tbody>
                <tr>
                    <td>${l.id}</td>
                    <td>${l.name}</td>
                    <td>${l.startPoint.address}</td>
                    <td>${l.endPoint.address}</td>
                    <td>${l.price}</td>
                    <td>${l.kilometer}km</td>
                    <td>${l.time}h</td>
                    <td>${l.trips.size()}</td>
                    <td><a href="#" data-toggle="modal" data-target="#updateLineModal${l.id}">Sửa</a></td>
                    <td><a href="#" data-toggle="modal" data-target="#deleteLineModal${l.id}">Xóa</a></td>
                </tr>
                </tbody>
            </c:forEach>
        </table>
        <!-- Modal Create -->
        <div class="modal fade" id="createLineModal" tabindex="-1" aria-labelledby="createLineModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm tuyến</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form id="createLineForm" method="post" action="${create}" accept-charset="utf-8">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="name" class="col-form-label">Tên tuyến </label>
                                <small>Erro message</small>
                                <input type="text" class="form-control" id="name" name="lineName">
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                            </div>
                            <div class="form-group">
                                <label for="startPlace" class="col-form-label">Điểm khởi hành</label>
                                <small>Erro message</small>
                                <select class="form-control" id="startPlace" name="startPlace">
                                    <option>Chọn điểm</option>
                                    <c:forEach var="p" items="${points}">
                                        <option>${p.address}</option>
                                    </c:forEach>
                                </select>
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                            </div>
                            <div class="form-group">
                                <label for="endPlace" class="col-form-label">Điểm kết thúc</label>
                                <small>Erro message</small>
                                <select class="form-control" id="endPlace" name="endPlace">
                                    <option>Chọn điểm</option>
                                    <c:forEach var="p" items="${points}">
                                        <option>${p.address}</option>
                                    </c:forEach>
                                </select>
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                            </div>
                            <div class="form-group">
                                <label for="price" class="col-form-label">Giá vé</label>
                                <small>Erro message</small>
                                <input type="number" class="form-control" id="price" name="price">
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                            </div>
                            <div class="form-group">
                                <label for="distance" class="col-form-label">Quảng đường </label>
                                <small>Erro message</small>
                                <input type="number" class="form-control" id="distance" name="distance">
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                            </div>
                            <div class="form-group">
                                <label for="time" class="col-form-label">Thời gian dự kiến</label>
                                <small>Erro message</small>
                                <input type="number" class="form-control" id="time" name="time">
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <input onclick="return checkInput()" type="submit" class="btn btn-primary" value="Lưu tuyến">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Modal Update -->
        <c:forEach var="l" items="${lines}">
            <div class="modal fade" id="updateLineModal${l.id}" tabindex="-1" aria-labelledby="updateLineModal" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Chỉnh sửa tuyến xe</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form id="updateLineForm" method="post" action="${update}" accept-charset="utf-8">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="idline" class="col-form-label">id </label>
                                    <input type="text" class="form-control" name="idline" id="idline" readonly="readonly" value="${l.id}">
                                </div>
                                <div class="form-group">
                                    <label class="col-form-label">Tên tuyến </label>
                                    <input type="text" class="form-control" readonly="readonly" value="${l.name}">
                                </div>
                                <div class="form-group">
                                    <label class="col-form-label">Điểm bắt đầu </label>
                                    <input type="text" class="form-control" readonly="readonly" value="${l.startPoint.address}">
                                </div>
                                <div class="form-group">
                                    <label class="col-form-label">Điểm bắt đầu </label>
                                    <input type="text" class="form-control" readonly="readonly" value="${l.endPoint.address}">
                                </div>
                                <div class="form-group">
                                    <label for="priceUpdate-${l.id}" class="col-form-label">Giá vé</label>
                                    <small>Erro message</small>
                                    <input type="number" class="form-control" id="priceUpdate-${l.id}" name="price" value="${l.price}">
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                </div>
                                <div class="form-group">
                                    <label for="distanceUpdate-${l.id}" class="col-form-label">Quảng đường </label>
                                    <small>Erro message</small>
                                    <input type="number" class="form-control" id="distanceUpdate-${l.id}" name="distance" value="${l.kilometer}">
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                </div>
                                <div class="form-group">
                                    <label for="timeUpdate-${l.id}" class="col-form-label">Thời gian dự kiến</label>
                                    <small>Erro message</small>
                                    <input type="number" class="form-control" id="timeUpdate-${l.id}" name="time" value="${l.time}">
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                <input onclick="return checkLineUpdateInput(${l.id})" type="submit" class="btn btn-primary" value="Cập nhật tuyến">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
        <!-- Modal Delete -->
        <c:forEach var="l" items="${lines}">
            <div class="modal fade" id="deleteLineModal${l.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Xóa ${l.name}</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Xác nhận xóa tuyến ${l.startPoint.address} => ${l.endPoint.address}
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <a href="<c:url value="/line/${l.id}/delete"/>">
                                <button type="button" class="btn btn-primary">Xác nhận</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>