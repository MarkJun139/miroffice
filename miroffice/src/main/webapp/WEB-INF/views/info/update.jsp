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

<style type="text/css">
.form-container {
    height: 450px;
    border: 2px solid;
    padding: 10px;
    margin: 20px;
    border-radius: 5px;
    color: black;
}
.form-container2 {
    height: 260px;
    border: 2px solid;
    padding: 10px;
    margin: 20px;
    border-radius: 5px;
    color: black;
}
.image {
	margin: 50px; width : 200px;
	height: 300px;
	border: 2px solid;
	color: black;
	width: 200px
}

.name {
	width: 200px;
	border: 2px solid;
	text-align: center;
	font-size: 25px;
	margin-left: 400px;
	margin-top: -38px;
}
.phone {
	width: 300px;
	border: 2px solid;
	text-align: center;
	font-size: 25px;
	margin-left: 1000px;
	margin-top: -38px;
}
.address {
	width: 900px;
	border: 2px solid;
	text-align: center;
	font-size: 25px;
	margin-left: 400px;
	margin-top: -38px;
}
.address2 {
	width: 900px;
	border: 2px solid;
	text-align: center;
	font-size: 25px;
	margin-left: 400px;
	margin-top: 28px;
}
.email {
	width: 900px;
	border: 2px solid;
	text-align: center;
	font-size: 25px;
	margin-left: 400px;
	margin-top: -38px;
	margin-bottom: 100px;
}
.edit-button {
    position: absolute;
    bottom: 385px;
    right: 50px;
    padding: 10px;
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
    width: 100px;
    border-radius: 10px;
    margin-top: -500px;
 }
 .edit-button2 {
    position: absolute;
    bottom: 35px;
    right: 50px;
    padding: 10px;
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
    width: 100px;
    border-radius: 10px;
    margin-top: -500px;
 }
  
 .pwd1 {
	width: 900px;
	border: 2px solid;
	text-align: center;
	font-size: 25px;
	margin-left: 400px;
	margin-top: -38px;
	margin-bottom: 100px;
}
</style>

<script>
	function success(){
		alert("개인정보를 변경하였습니다.")
	}
</script>
<script>
	function pwdCheck(){
		var password1 = document.getElementById("pwd1").value;
        var password2 = document.getElementById("pwd2").value;
        
        if(password1 == password2) {
        	document.getElementById("passwordForm").submit();
        } else {
			alert("비밀번호가 일치하지 않습니다. 다시 시도해주세요.")        	
        }
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
								<h1 class="card-title">개인정보 변경</h1>
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

				<div class="form-container">
				<form method="post">
					<input type="hidden" value="${user.empNo}" name="empNo">
					<img class="image" src="${image}" name="empPhoto">
					<h3 style="margin-top: -350px; margin-left: 300px;">이름 :</h3>
					<input class="name" value="${user.empName}" name="empName">
					<h3 style="margin-left: 850px; margin-top: -40px">전화번호 :</h3>
					<input class="phone" value="${user.empPhone}" name="empPhone">
					<h3 style="margin-left: 300px; margin-top: 65px">주소 :</h3>
					<input class="address" value="${user.empAddress}" name="empAddress">
					<input class="address2" value="${user.empAddress2}" name="empAddress2">
					<h3 style="margin-left: 272px; margin-top: 50px">이메일 :</h3>
					<input class="email" value="${user.empEmail}" name="empEmail">
					<button class="edit-button" onclick="success()">수정</button>
				</form>
				</div>
				
				
				<h1 style="margin-left: 20px">비밀번호 변경</h1>
				<div class="form-container2">
					<h3 style="margin-top: 50px; margin-left: 200px;">새 비밀번호 :</h3>
					<input id="pwd1" class="pwd1" type="password" name="empPw">
				<form id="passwordForm" method="post" action="pwdUpdate">
					<input type="hidden" value="${user.empNo}" name="empNo">
					<h3 style="margin-top: -50px; margin-left: 150px;">비밀번호 재입력:</h3>
					<input id="pwd2" class="pwd1" name=empPw type="password" name="empPw">
					<button class="edit-button2" onclick="pwdCheck()">수정</button>
				</form>
				</div>


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