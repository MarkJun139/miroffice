<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
</head>
<body>
	
	<h3>부서 검색</h3>
		
		<form method="post">
			<select name="deptName" id="deptName">
				<c:forEach var="deptName" items="${deptName}">
					<option value="${deptName}">${deptName}</option>
				</c:forEach>
			</select>
			<input type="submit" value="검색">
		</form>
	
	<h3>주소록</h3>
	
	<table border="1">
		<tr>
			<td>부서</td>
			<td>이름</td>
			<td>주소</td>
			<td>전화번호</td>
		</tr>
		<c:forEach var="usersInfo" items="${usersInfo}">
		<tr>
			<td>${usersInfo.deptName}</td>
			<td>${usersInfo.empName}</td>
			<td>${usersInfo.empAddress}</td>
			<td>${usersInfo.empPhone}</td>
		</tr>
		</c:forEach>
	</table>
	
</body>
</html>