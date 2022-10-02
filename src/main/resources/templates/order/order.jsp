<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的订单</title>
	<%--静态包含base标签，css样式，jQuery文件--%>
	<%@ include file="/pages/common/head.jsp"%>
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
</style>
	<script type="text/javascript">
		$(function () {
			//给收货绑定单击事件
			$(".shouhuo").click(function () {
				var status = $(this).attr('status');
				//alert(status);
				if(status=="0"){
					alert("该订单还未发货，不可确定收货！");
				}else if(status=="2"){
					alert("您已确定收货，无需再次收货！");
				} else{
					var orderId = $(this).attr('orderId');
					if(confirm("是否为订单号为【"+orderId+"】的订单确定收货？")){
						alert("确认收货成功！");
						location.href="http://localhost:8080/book02/orderServlet?action=receiverOrder&orderId="+orderId;
					}else {
						location.href="http://localhost:8080/book02/orderServlet?action=showMyOrders";
					}
				}

			});
		});
	</script>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
			<span class="wel_word">我的订单</span>
		<%--静态包含，登录成功后的菜单--%>
		<%@ include file="/pages/common/login_success-menu.jsp"%>
	</div>
	
	<div id="main">
		
		<table>
			<tr>
				<td>日期</td>
				<td>金额</td>
				<td>状态</td>
				<td>详情</td>
				<td>收货</td>
			</tr>
			<c:if test="${empty requestScope.orders}">
				<tr>
					<td colspan="5"><a href="index.jsp">亲爱的顾客，您当前没有订单！(点击前往下单)</a></td>
				</tr>
			</c:if>
			<c:if test="${not empty requestScope.orders}">
				<c:forEach items="${requestScope.orders}" var="item">
					<tr>
						<td>${item.createTime}</td>
						<td>${item.price}</td>
						<%--<td>${item.status==1?"已发货":"未发货"}</td>--%>
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
						<td><a href="orderServlet?action=showOrderDetail&orderId=${item.orderId}">查看详情</a></td>
						<td><button class="shouhuo" orderId="${item.orderId}" status=${item.status}>点击收货</button></td>
					</tr>
				</c:forEach>
			</c:if>

		</table>
		
	
	</div>

	<%--静态包含页脚内容--%>
	<%@include file="/pages/common/footer.jsp"%>
</body>
</html>