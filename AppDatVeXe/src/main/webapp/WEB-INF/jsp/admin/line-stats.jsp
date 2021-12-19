<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<div id="content">
    <h1 class="text-center text-danger">THỐNG KÊ VÉ THEO TUYẾN XE</h1>
    <table class="table">
        <tr>
            <th>Mã tuyến xe</th>
            <th>Tên tuyến</th>
            <th>Số lượng vé đã bán được</th>
        </tr>
        <c:forEach items="${lineStats}" var="l">
            <tr>
                <td>${l[0]}</td>
                <td>${l[1]}</td>
                <td>${l[2]}</td>
            </tr>
        </c:forEach>
    </table>
    <div>
        <canvas id="myLineStatsChart"></canvas>
    </div>
</div>

<script>
    //Thong ke theo line
    let lineLabels=[], lineInfo=[];
    <c:forEach items="${lineStats}" var="l">
    lineLabels.push('${l[1]}')
    lineInfo.push(${l[2]})
    </c:forEach>

    window.onload = function() {
        lineChart("myLineStatsChart", lineLabels, lineInfo)
    }
</script>