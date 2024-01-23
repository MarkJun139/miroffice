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
.employee-container {
	display: flex;
	align-items: baseline;
}

.image {
	margin: 50px;
	width: 200px;
	height: 300px;
	border: 2px solid;
	color: black;
}

.info {
	display: flex;
	flex-direction: column;
}

.left {
	display:flex;
	flex-direction: row; 
}

.name {
	width: 200px;
	font-size: 25px;
	margin-left: 420px;
	margin-top: -40px;
	border: 2px solid;
	text-align: center;
	color: black;
}

.department {
	width: 200px;
	font-size: 25px;
	margin-left: 850px;
	margin-top: -40px;
	border: 2px solid;
	text-align: center;
	color: black;
}

.rank {
	width: 200px;
	font-size: 25px;
	margin-left: 1220px;
	margin-top: -40;
	border: 2px solid;
	text-align: center;
	color: black;
}

.address {
	margin-top: -37px;
	margin-left: 420px;
	border: 2px solid;
	font-size: 25px;
	width: 1000px;
	text-align: center;
	color: black;
}

.email {
	margin-top: -37px;
	margin-left: 420px;
	margin-bottom: 100px;
	border: 2px solid;
	font-size: 25px;
	width: 1000px;
	text-align: center;
	color: black;
}

.edit-button {
    position: absolute;
    bottom: 10px;
    right: 10px;
    padding: 10px;
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
    width: 100px;
    border-radius: 10px;
  }
.image {
	margin: 50px;
}
</style>

<script>
	function passwordCheck(){
		window.location.href = "/main/check";		
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
								<h1 class="card-title">마이페이지</h1>
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

					<img class="image" src="${image}" alt="Employ Photo">
					<h3 style="margin-left: 320px; margin-top: -350px;">이름 :</h3>
					<div class="name">${user.empName}</div>
					<h3 style="margin-left: 720px; margin-top: -35px;">부서명 :</h3>
					<div class="department">${dept.deptName}</div>
					<h3 style="margin-left: 1120px; margin-top: -35px;">직책 :</h3>
					<div class="rank">${user.empRank}</div>
					<h3 style="margin-top: 100px; margin-left: 320px">주소 :</h3>
					<div class="address">${user.empAddress}</div>
					<h3 style="margin-top: 100px; margin-left: 305px">이메일 :</h3>
					<div class="email">${user.empEmail}</div>
					<button class="edit-button" onclick="passwordCheck()">수정</button>
					

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
