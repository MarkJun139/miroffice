<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>마이페이지</h1><br>
	
	<table border="1">
			<tr>
				<td>사진</td>
				<td>이름</td>
				<td>부서명</td>
				<td>직급</td>
				<td>주소</td>
				<td>이메일</td>
			</tr>
			<tr>
				<td>${user.empPhoto}</td>
				<td>${user.empName}</td>
				<td>${dept.deptName}</td>
				<td>${user.empRank}</td>
				<td>${user.empAddress}</td>
				<td>${user.empEmail}</td>
			</tr>
	</table>
	
	<form action="check">
		<button>수정</button>
	</form>
</body>
</html>