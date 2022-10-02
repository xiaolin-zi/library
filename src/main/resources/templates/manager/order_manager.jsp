<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单管理</title>
	<%--静态包含base标签，css样式，jQuery文件--%>
	<%@ include file="/pages/common/head.jsp"%>
	<script type="text/javascript">
		$(function () {
			//给发货绑定单击事件
			$(".fahuo").click(function () {
				var status = $(this).attr('status');
				if(status=="2"){
					alert("此订单用户已确定收货，不能继续发货！");
				}else if(status=="1") {
					alert("此订单已发货，无需再次发货！");
				}else{
					var orderId = $(this).attr('orderId');
					if(confirm("你确定要给订单编号为【"+orderId+"】的订单发货吗？")){
						alert("发货成功！");
						location.href="http://localhost:8080/book02/orderServlet?action=sendOrder&orderId="+orderId;
					}else{
						location.href="http://localhost:8080/book02/orderServlet?action=showAllOrders"
					}
				}
			});
		});
	</script>
</head>

<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
			<span class="wel_word">订单管理系统</span>
		<%--静态包含manager管理模块的菜单--%>
		<%@include file="/pages/common/manager_menu.jsp"%>
	</div>
	
	<div id="main">
		<table>
			<tr>
				<td>日期</td>
				<td>金额</td>
				<td>详情</td>
				<td>状态</td>
				<td>发货</td>
			</tr>
			<c:if test="${empty requestScope.allOrders}">
				<tr>
					<td colspan="4"><a href="index.jsp">当前没有用户下单!</a></td>
				</tr>
			</c:if>
			<c:if test="${not empty requestScope.allOrders}">
				<c:forEach items="${requestScope.allOrders}" var="item">
					<tr>
						<td>${item.createTime}</td>
						<td>${item.price}</td>
						<td><a href="orderServlet?action=showOrderDetail&orderId=${item.orderId}">查看详情</a></td>
						<c:choose>
							<c:when test="${item.status==1}">
								<td>已发货</td>
							</c:when>
							<c:when test="${item.status==0}">
								<td>未发货</td>
							</c:when>
							<c:when test="${item.status==2}">
								<td>已收货</td>
							</c:when>
						</c:choose>
						<td><button class="fahuo" orderId="${item.orderId}" status="${item.status}">点击发货</button></td>
					</tr>
				</c:forEach>
			</c:if>

		</table>
	</div>

	<%--静态包含页脚内容--%>
	<%@include file="/pages/common/footer.jsp"%>
</body>
</html>