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
            <a class="nav-link admin" id="v-pills-employees-tab" data-toggle="pill" href="#v-pills-employees" role="tab" aria-controls="v-pills-employees" aria-selected="false">Nhân viên</a>
            <a class="nav-link admin" id="v-pills-line-tab" data-toggle="pill" href="#v-pills-line" role="tab" aria-controls="v-pills-line" aria-selected="false">Tuyến xe</a>
            <a class="nav-link admin" id="v-pills-trip-tab" data-toggle="pill" href="#v-pills-trip" role="tab" aria-controls="v-pills-trip" aria-selected="false">Chuyến xe</a>
        </div>
    </nav>
    <div id="content">
        <div class="row">
            <div class="container-fluid">
                <button type="button" id="sidebarCollapse" class="btn btn-info">
                    <i class="fas fa-align-left"></i>
                </button>
            </div>
            <div class="tab-content" id="v-pills-tabContent">
                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                    <div class="col-md-6 info-content">


                    </div>
                </div>
                <div class="tab-pane fade" id="v-pills-employees" role="tabpanel" aria-labelledby="v-pills-employees-tab">.2..</div>
                <div class="tab-pane fade" id="v-pills-line" role="tabpanel" aria-labelledby="v-pills-line-tab">..3.</div>
                <div class="tab-pane fade" id="v-pills-trip" role="tabpanel" aria-labelledby="v-pills-trip-tab">..4.</div>
            </div>

        </div>
    </div>

</div>
