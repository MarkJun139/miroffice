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

<form method="post">
	<input type="hidden" value="${user.empNo}" name="empNo">
	사진 : <input value="${user.empPhoto}" name="empPhoto"><br>
	이름 : <input value="${user.empName}" name="empName"><br>
	전화번호 : <input value="${user.empPhone}" name="empPhone"><br>
	주소 : <input value="${user.empAddress}" name="empAddress"><br>
	상세 주소 : <input value="${user.empAddress2}" name="empAddress2"><br>
	이메일 : <input value="${user.empEmail}" name="empEmail"><br>
	비밀번호 : <input type="password" value="${user.empPw}" name="empPw"><br>
	<input type="submit">
</form>

</body>
</html>