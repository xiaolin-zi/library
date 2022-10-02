<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>订单详情</title>
    <%--静态包含base标签，css样式，jQuery文件--%>
    <%@ include file="/pages/common/head.jsp"%>
    <style type="text/css">
        h1 {
            text-align: center;
            margin-top: 200px;
        }
    </style>
</head>
<body>

<div id="header">
    <img class="logo_img" alt="" src="static/img/logo.gif" >
    <span class="wel_word">订单详情</span>
    <%--静态包含，登录成功后的菜单--%>
    <%@ include file="/pages/common/login_success-menu.jsp"%>
</div>

<div id="main">

    <table>
        <tr>
            <td>商品名称</td>
            <td>商品数量</td>
            <td>商品价格</td>
            <td>总价</td>
            <td>订单编号</td>
        </tr>
        <c:if test="${empty requestScope.orderItems}">
            <tr>
                <td colspan="5"><a href="index.jsp">该订单已失效</a></td>
            </tr>
        </c:if>
        <c:if test="${not empty requestScope.orderItems}">
            <c:forEach items="${requestScope.orderItems}" var="item">
                <tr>
                    <td>${item.name}</td>
                    <td>${item.count}</td>
                    <td>${item.price}</td>
                    <td>${item.totalPrice}</td>
                    <td>${item.orderId}</td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
</div>

<%--静态包含页脚内容--%>
<%@include file="/pages/common/footer.jsp"%>
</body>
</html>