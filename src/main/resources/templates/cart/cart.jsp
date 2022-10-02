<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物车</title>
	<%--静态包含base标签，css样式，jQuery文件--%>
	<%@ include file="/pages/common/head.jsp"%>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
			<span class="wel_word">购物车</span>
		<%--静态包含，登录成功后的菜单--%>

		<div>
			<%--用户还没登录，显示--%>
			<c:if test="${empty sessionScope.user}">
				<a href="pages/user/login.jsp">登录</a> |
				<a href="pages/user/regist.jsp">注册</a> &nbsp;&nbsp;
			</c:if>
			<%--已经登录显示--%>
			<c:if test="${not empty sessionScope.user}">
				<%@ include file="/pages/common/login_success-menu.jsp"%>
			</c:if>
		</div>
		<script type="text/javascript">
			$(function () {
				var success = ${sessionScope.success};
				if(success==false){
					alert("您购买的商品中库存不足");
				}
				//给删除绑定单击事件
				$("a.deleteItem").click(function () {
					return confirm("你确定要删除【"+$(this).parent().parent().find("td:first").text()+"】吗？");
				});

				//给清空购物车绑定单击事件
				$("a.clearCart").click(function () {
					return confirm("你确定要清空购物车吗？");
				});

				//给输入框绑定失去焦点事件===内容发生改变事件
				$(".updateCount").change(function () {
					var name = $(this).parent().parent().find("td:first").text();
					var count = this.value;
					//attr用于设置或返回被选元素的值和属性
					var id=$(this).attr('bookId');
					if(confirm("你确定要将【"+name+"】商品数量修改为"+count+"吗？")){
						//发起请求，给服务器保存修改
						location.href="http://localhost:8080/book02/cartServlet?action=updateCount&count="+count+"&id="+id;
					}else {
						//defaultValue属性是表单项Dom对象的属性，他表示默认的value属性值
						this.value = this.defaultValue;
					}

				});

				// //给结账绑定单击事件
				$("a.settle").click(function () {


					if(${empty sessionScope.user}) {
						if (confirm("您当前还未登录，是否前往登录？")) {
							location.href = "http://localhost:8080/book02/pages/user/login.jsp";
							return false;
						} else {
							location.href = "http://localhost:8080/book02/pages/cart/cart.jsp";
							return false;
						}
					}else{
						/*var msg = $(this).attr('orderMsg');
						alert(msg);*/

					}
				});

			});

		</script>




		<%--<%@ include file="/pages/common/login_success-menu.jsp"%>--%>
	</div>
	
	<div id="main">
	
		<table>
			<tr>
				<td>商品名称</td>
				<td>数量</td>
				<td>单价</td>
				<td>金额</td>
				<td>操作</td>
			</tr>
			<c:if test="${empty sessionScope.cart.items}">
				<%--购物车为空--%>
				<tr>
					<td colspan="5"><a href="index.jsp">亲爱的顾客，您当前的购物车为空！(点击前往浏览商品)</a></td>
				</tr>
			</c:if>
			<c:if test="${not empty sessionScope.cart.items}">
				<%--购物车非空--%>
				<c:forEach items="${sessionScope.cart.items}" var="entry">
					<tr>
						<td>${entry.value.name}</td>
						<td>
							<input bookId="${entry.value.id}" class="updateCount" style="width: 40px" type="text" value="${entry.value.count}">
						</td>
						<td>${entry.value.price}</td>
						<td>${entry.value.totalPrice}</td>
						<td><a  class="deleteItem" href="cartServlet?action=deleteItem&id=${entry.value.id}">删除</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<c:if test="${not empty sessionScope.cart.items}">
				<div class="cart_info">
					<span class="cart_span">购物车中共有<span class="b_count">${sessionScope.cart.totalCount}</span>件商品</span>
					<span class="cart_span">总金额<span class="b_price">${sessionScope.cart.totalPrice}</span>元</span>
					<span class="cart_span"><a class="clearCart" href="cartServlet?action=clearCart">清空购物车</a></span>
					<span class="cart_span"><a class="settle" bookName="${sessionScope.bookName}" isOk="${sessionScope.isOrderOk}" orderMsg="${requestScope.orderMsg}"  href="orderServlet?action=createOrder">去结账</a></span>
				</div>
		</c:if>

	
	</div>

	<%--静态包含页脚内容--%>
	<%@include file="/pages/common/footer.jsp"%>
</body>
</html>