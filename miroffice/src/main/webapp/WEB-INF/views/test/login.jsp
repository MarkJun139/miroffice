<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
</head>
<body>
	<form method="post" action="/login">
		<input name='userId' placeholder='사번'><br> 
		<input type="password" name='password' placeholder='비밀번호'><br>
		<input type='submit' value='로그인'>
	</form>
	<a href='/findnumber'>사번찾기</a> <a href="/findpassword">비밀번호 찾기</a>
</body>
</html>