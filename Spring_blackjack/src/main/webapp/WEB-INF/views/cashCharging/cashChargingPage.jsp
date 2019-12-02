<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<html>
<head>
	<title>캐시 충전</title>
</head>
<body>
	캐시 충전
	<table>
		<tr>
			<th>Current cash</th>
		</tr>
		<c:forEach var="Customer" items="${listAllCustomer}">
			<tr>
				<td>${Customer.currentCash}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
