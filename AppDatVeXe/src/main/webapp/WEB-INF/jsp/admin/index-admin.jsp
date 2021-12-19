<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="lineStats" value="/admin/line-stats" />
<c:url var="tripStats" value="/admin/trip-stats" />
<c:url var="monthstats" value="/admin/month-stats" />

<!DOCTYPE html>

<div id="content">
    <button type="button" class="btn">
        <a href="${lineStats}">Thống kê vé theo tuyến xe</a>
    </button>
    <button type="button" class="btn">
        <a href="${tripStats}">Thống kê vé theo chuyến xe</a>
    </button>
    <button type="button" class="btn">
        <a href="${monthstats}">Thống kê vé theo tháng</a>
    </button>
</div>