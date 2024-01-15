<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>개인정보 변경</h1>

<form method="post" action="update">
	사진 : <input name="empPhoto" value="${user.empPhoto}"><br>
	이름 : <input name="empName" value="${user.empName}"><br>
	전화번호 : <input name="empPhone" value="${user.empPhone}"><br>
	주소 : <input name="empAddress" value="${user.empAddress}"><br>
	상세 주소 : <input name="empAddress2" value="${user.empAddress2}"><br>
	이메일 : <input name="empEmail" value="${user.empEmail}"><br>
	비밀번호 : <input name="empPw" type="password" value="${user.empPw}"><br>
	<input type="submit">
</form>

</body>
</html>