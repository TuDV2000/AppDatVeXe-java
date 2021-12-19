<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="date" class="java.util.Date" />

<fmt:formatDate value="${date}" pattern="yyyy" var="currentYear" />
<c:url var="stats" value="/admin/month-stats/" />

<!DOCTYPE html>

<div id="content">
    <h1 class="text-center text-danger">THỐNG KÊ VÉ THEO THÁNG</h1>
    <div class="text-center">
        <button type="button" class="btn">
           <a href="${stats}<c:out value="${currentYear - 1}" />"><c:out value="${currentYear - 1}" /></a>
        </button>
        <button type="button" class="btn">
            <a href="${stats}<c:out value="${currentYear}" />"><c:out value="${currentYear}" /></a>
        </button>
        <button type="button" class="btn">
            <a href="${stats}<c:out value="${currentYear + 1}" />"><c:out value="${currentYear + 1}" /></a>
        </button>
    </div>

    <c:if test="${monthStats != null}">
    <table class="table">
        <tr>
            <th>Tháng-năm</th>
            <th>Số lượng vé đã bán được</th>
        </tr>
        <c:forEach items="${monthStats}" var="m">
            <tr>
                <td>${m[0]}-${m[1]}</td>
                <td>${m[2]}</td>
            </tr>
        </c:forEach>
    </table>
    <div>
        <canvas id="myMonthStatsChart"></canvas>
    </div>
    <script>
        let monthLabels=[], monthInfo=[];
        <c:forEach items="${monthStats}" var="m">
            monthLabels.push('Tháng ${m[0]}')
            monthInfo.push(${m[2]})
        </c:forEach>

        window.onload = function() {
            monthChart("myMonthStatsChart", monthLabels, monthInfo)
        }
    </script>
    </c:if>
</div>
