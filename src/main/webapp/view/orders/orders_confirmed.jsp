<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/directive/page.jspf"%>
<%@ include file="/view/directive/taglib.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/style.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/table.css"
	type="text/css">
</head>
<body>
	<%@ include file="/view/orders/menu.jspf"%>
	<br>
	<%@ include file="/view/orders/check_content.jspf"%>
	<c:if test="${not empty orders}">
		<table border="1">
			<tr>
				<th>Номер заказа
				<th>Количество дней
				<th>Конечная сумма
				<th>Детали
			</tr>
			<c:forEach items="${orders}" var="order" varStatus="varstatus">
				<tr>
					<td>№ ${order.getId()} ${order.getName()}
					<td>${order.getDays()}
					<td>${order.getPrice()}
					<td><a
						href="${pageContext.servletContext.contextPath}/Controller?command=get_order&id=${order.getId()}">
							Детали заказа</a>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>