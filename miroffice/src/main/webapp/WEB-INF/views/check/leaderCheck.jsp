<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태 확인</title>
</head>
<body>
	<h1>근태 확인</h1>
	
	<sec:authorize access="hasRole('ROLE_TEAMLEADER')">
		<h2>부서원 검색</h2>
		
		<form action="/main/checkout/teamleader">
			<select name="empName" id="empName">
				<c:forEach var="empName" items="${searchEmp}">
					<option value="${empName}">${empName}</option>
				</c:forEach>
			</select>
			<input type="submit" value="검색">
		</form>
		
		<h2>부서원 근태 관리</h2>
		
		<form>
		<select name="empName" id="empName">
				<c:forEach var="empName" items="${searchEmp}">
					<option value="${empName}">${empName}</option>
				</c:forEach>
		</select>
		<button type="submit" onclick="javascript: form.action = '/main/halfoff'">반차</button>
		<button type="submit" onclick="javascript: form.action = '/main/dayoff'">연차</button>
		<button type="submit" onclick="javascript: form.action = '/main/vacation'">휴가</button>
		<button type="submit" onclick="javascript: form.action = '/main/absenteeism'">결근</button>
		</form>
	</sec:authorize>
	
	<h2>${user.empName}님의 근태</h2>
	
	<h3>이번달 근태 확인</h3>
	
	<table border="1">
			<tr>
				<td>출근</td>
				<td>조퇴</td>
				<td>반차</td>
				<td>연차</td>
				<td>휴가</td>
				<td>지각</td>
				<td>결근</td>
				<td>근무시간</td>
			</tr>
			<tr>
				<td>${checkdate.checkOn}</td>
				<td>${checkdate.checkLeaveEarly}</td>
				<td>${checkdate.checkHalfoff}</td>
				<td>${checkdate.checkDayoff}</td>
				<td>${checkdate.checkVacation}</td>
				<td>${checkdate.checkLate}</td>
				<td>${checkdate.checkAbsenteeism}</td>
				<td>${checkTime}</td>
			</tr>
	</table>
	
	<h3>1주차 근태 확인</h3>
	
	<table border="1">
			<tr>
				<td>출근</td>
				<td>조퇴</td>
				<td>반차</td>
				<td>연차</td>
				<td>휴가</td>
				<td>지각</td>
				<td>결근</td>
				<td>근무시간</td>
			</tr>
			<tr>
				<td>${first.checkOn}</td>
				<td>${first.checkLeaveEarly}</td>
				<td>${first.checkHalfoff}</td>
				<td>${first.checkDayoff}</td>
				<td>${first.checkVacation}</td>
				<td>${first.checkLate}</td>
				<td>${first.checkAbsenteeism}</td>
				<td>${firstTime}</td>
			</tr>
	</table>
	
	<h3>2주차 근태 확인</h3>
	
	<table border="1">
			<tr>
				<td>출근</td>
				<td>조퇴</td>
				<td>반차</td>
				<td>연차</td>
				<td>휴가</td>
				<td>지각</td>
				<td>결근</td>
				<td>근무시간</td>
			</tr>
			<tr>
				<td>${second.checkOn}</td>
				<td>${second.checkLeaveEarly}</td>
				<td>${second.checkHalfoff}</td>
				<td>${second.checkDayoff}</td>
				<td>${second.checkVacation}</td>
				<td>${second.checkLate}</td>
				<td>${second.checkAbsenteeism}</td>
				<td>${secondTime}</td>
			</tr>
	</table>
	
	<h3>3주차 근태 확인</h3>
	
	<table border="1">
			<tr>
				<td>출근</td>
				<td>조퇴</td>
				<td>반차</td>
				<td>연차</td>
				<td>휴가</td>
				<td>지각</td>
				<td>결근</td>
				<td>근무시간</td>
			</tr>
			<tr>
				<td>${third.checkOn}</td>
				<td>${third.checkLeaveEarly}</td>
				<td>${third.checkHalfoff}</td>
				<td>${third.checkDayoff}</td>
				<td>${third.checkVacation}</td>
				<td>${third.checkLate}</td>
				<td>${third.checkAbsenteeism}</td>
				<td>${thirdTime}</td>
			</tr>
	</table>
	
	<h3>4주차 근태 확인</h3>
	
	<table border="1">
			<tr>
				<td>출근</td>
				<td>조퇴</td>
				<td>반차</td>
				<td>연차</td>
				<td>휴가</td>
				<td>지각</td>
				<td>결근</td>
				<td>근무시간</td>
			</tr>
			<tr>
				<td>${four.checkOn}</td>
				<td>${four.checkLeaveEarly}</td>
				<td>${four.checkHalfoff}</td>
				<td>${four.checkDayoff}</td>
				<td>${four.checkVacation}</td>
				<td>${four.checkLate}</td>
				<td>${four.checkAbsenteeism}</td>
				<td>${fourTime}</td>
			</tr>
	</table>
	
	<form action="start">
		출근 등록 : <input type="submit" name="출근">
	</form>
	<form action="end">
		퇴근 등록 : <input type="submit" name="퇴근">
	</form>
</body>
</html>