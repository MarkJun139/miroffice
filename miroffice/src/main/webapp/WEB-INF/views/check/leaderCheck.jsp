<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>미르오피스</title>

<!-- Favicon -->
<link rel="shortcut icon" href="/images/favicon.ico" />

<!-- Library / Plugin Css Build -->
<link rel="stylesheet" href="/css/core/libs.min.css" />

<!-- Aos Animation Css -->
<link rel="stylesheet" href="/vendor/aos/dist/aos.css" />

<!-- Hope Ui Design System Css -->
<link rel="stylesheet" href="/css/hope-ui.min.css?v=2.0.0" />

<!-- Custom Css -->
<link rel="stylesheet" href="/css/custom.min.css?v=2.0.0" />

<!-- Dark Css -->
<link rel="stylesheet" href="/css/dark.min.css" />

<!-- Customizer Css -->
<link rel="stylesheet" href="/css/customizer.min.css" />

<!-- RTL Css -->
<link rel="stylesheet" href="/css/rtl.min.css" />

<style >
.button1 {
	margin-top: 10px;
	margin-left: 36px;
	background-color: #007bff;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 10px;
}

.button {
	background-color: #007bff;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 10px;
}
.button2 {
	margin-top: 20px;
	margin-left: 36px;
	background-color: #007bff;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 10px;
	width: 200px;
}
.name {
	margin-left: 300px;
	margin-top: -220px;
}
.time {
	margin-left: 700px;
	margin-top: -35px;
	font-size: 20px;
	color: black;
	width: 350px;
}
.table {
	width: 1000px;
	margin-left: 400px;
	margin-top: 30px;
}
.hidden {
	display: none;
}
.arrow {
    cursor: pointer;
    user-select: none;
}
.up {
	margin-left: 570px;
	margin-top: -344px;
	font-size: 30px;
	color: black;	
	transform: rotate(0deg);
	display: inline-flex;
}

.down {
	margin-left: 570px;
	margin-top: -344px;
	color: black;
	font-size: 30px;
	transform: rotate(deg);
	display: none;
}
.expanded .up {
    display: none;
}
.expanded .down {
    display: inline-flex;
}
</style>

<script>
	function toggle() {
		const section = document.getElementById('weeklySection');
		const arrow = document.querySelector('.arrow');
		section.classList.toggle('hidden');
		arrow.classList.toggle('expanded');
	}
</script>

</head>

<body class="  ">
	<%@include file="../sidebar.jsp"%>

	<main class="main-content">

		<div class="position-relative iq-banner">
			<!--Nav Start-->

			<%@include file="../header.jsp"%>
			<!--Nav End -->
		</div>

		<div class="conatiner-fluid content-inner mt-n5 py-0">

			<div class="overflow-hidden card" data-aos="fade-up"
				data-aos-delay="100" style="overflow-x: auto">
				<div class="flex-wrap card-header d-flex justify-content-between">
					<div class="header-title col-12">
						<div class="col-12 row text-center align-items-center">
							<div class="col-3 text-start">
								<h1 class="card-title">근태관리</h1>
							</div>
							<div class="col-3 text-start">
								<h2>
									<span class="badge badge-secondary badge-pill"
										style="background-color: var(--bs-info)">${deptName}</span>
								</h2>
							</div>
						</div>
					</div>
				</div>
				<!--  메인 여기부터!!! -->
				
				<h2 style="margin-left: 50px; margin-top: 100px">출퇴근 등록</h2>
				<form>
					<input onclick="javascript: form.action = '/main/start'" class="button2" type="submit" value="출근 등록"><br>
					<input onclick="javascript: form.action = '/main/end'" class="button2" type="submit" value="퇴근 등록">
				</form>
				
				<h2 class="name">${user.empName}님의근태</h2>
				
				<table class="time">
					<tr>
						<td>출근시간 :</td>
						<td>${start}</td>
						<td>퇴근시간 :</td>
						<td>${end}</td>
					</tr>
				</table>
				
				<h3 style="margin-left: 350px; margin-top: 50px;">이번달 근태 현황</h3>
				
				<table class="table">
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

				<h2 style="margin-left: 350px; margin-top: 50px; margin-bottom: 300px">주간 근태 현황</h2>
				<div class="arrow" onclick="toggle()">
					<span class="up">&#9650;</span>
					<span class="down">&#9660;</span>
				</div>

				<div id="weeklySection" class="hidden">
					<h3 style="margin-left: 350px; margin-top: -250px;">1주차 근태 현황</h3>

					<table class="table">
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

					<h3 style="margin-left: 350px; margin-top: 50px;">2주차 근태 현황</h3>

					<table class="table">
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

					<h3 style="margin-left: 350px; margin-top: 50px;">3주차 근태 현황</h3>

					<table class="table">
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

					<h3 style="margin-left: 350px; margin-top: 50px;">4주차 근태 현황</h3>

					<table class="table">
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
				</div>
				
				<sec:authorize access="hasRole('ROLE_TEAMLEADER')">
					<div style="position: fixed;">
					<h2 style="margin-left: 50px; margin-top: 370px;">부서원 검색</h2>

					<form action="/main/checkout/teamleader">
						<select style="margin-left: 35px; margin-top: 20px; width: 150px;"
							name="empName" id="empName">
							<c:forEach var="empName" items="${searchEmp}">
								<option value="${empName}">${empName}</option>
							</c:forEach>
						</select>
						<button class="button" type="submit">검색</button>
					</form>

					<h2 style="margin-left: 63px; margin-top: 50px">근태 처리</h2>

					<form>
						<input type="hidden" value="${user.empName}" name="empName">
						<input style="width: 205px; margin-left: 30px; margin-top: 20px"
							name="checkDate" type="date"><br>
						<button class="button1" type="submit"
							onclick="javascript: form.action = '/main/halfoff'">반차</button>
						<button class="button" type="submit"
							onclick="javascript: form.action = '/main/dayoff'">연차</button>
						<button class="button" type="submit"
							onclick="javascript: form.action = '/main/vacation'">휴가</button>
						<button class="button" type="submit"
							onclick="javascript: form.action = '/main/absenteeism'">결근</button>
					</form>
					</div>
				</sec:authorize>
				
				<!-- 메인 여기까지 -->
			</div>
		</div>

		<!-- Footer Section Start -->
		<%@include file="../footer.jsp"%>
		<!-- Footer Section End -->
	</main>
	<%@include file="../setting.jsp"%>


	<!-- Library Bundle Script -->
	<script src="/js/core/libs.min.js"></script>

	<!-- External Library Bundle Script -->
	<script src="/js/core/external.min.js"></script>

	<!-- Widgetchart Script -->
	<script src="/js/charts/widgetcharts.js"></script>

	<!-- mapchart Script -->
	<script src="/js/charts/vectore-chart.js"></script>
	<script src="/js/charts/dashboard.js"></script>

	<!-- fslightbox Script -->
	<script src="/js/plugins/fslightbox.js"></script>

	<!-- Settings Script -->
	<script src="/js/plugins/setting.js"></script>

	<!-- Slider-tab Script -->
	<script src="/js/plugins/slider-tabs.js"></script>

	<!-- Form Wizard Script -->
	<script src="/js/plugins/form-wizard.js"></script>

	<!-- AOS Animation Plugin-->
	<script src="/vendor/aos/dist/aos.js"></script>

	<!-- App Script -->
	<script src="/js/hope-ui.js" defer></script>

	<!-- sidebar 버튼 클릭 시 sidebar 활성화 -->
	<script>
		var url = window.location.href;
		$(".nav-item").find('a').each(function() {
			var burl = $(this).prop('href')
			var burl2 = burl + "#"
			if (url == burl || url == burl2) {
				console.log($(this).prop('pathname'))
				console.log($(this).prop('href'))
				$(this).toggleClass('active', $(this).attr('href'));
			}

		})
	</script>


</body>
</html>