<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>사번 찾기 결과</title>
<%@include file="../logo.jsp"%>
</head>
<body class=" " data-bs-spy="scroll" data-bs-target="#elements-section"
	data-bs-offset="0" tabindex="0">
	<!-- loader Start -->
	<div id="loading">
		<div class="loader simple-loader">
			<div class="loader-body"></div>
		</div>
	</div>
	<!-- loader END -->

	<div class="wrapper">
		<section class="login-content">
			<div class="row m-0 align-items-center bg-white vh-100">
				<div class="col-md-6 p-0">
					<div
						class="card card-transparent auth-card shadow-none d-flex justify-content-center mb-0">
						<div class="card-body">
							<a href="../login"
								class="navbar-brand d-flex align-items-center mb-3"> <!--Logo start-->
								<!--logo End--> <!--Logo start-->
								<div class="logo-main">
									<div class="logo-normal">
										<img src="./images/icons/logo.png" style="width: 50px;">
									</div>
								</div> <!--logo End-->




								<h4 class="logo-title ms-3">미르 오피스</h4>
							</a>
							<h2 class="mt-3 mb-0">사원번호 찾기 결과</h2>
							<c:choose>
								<c:when test="${empty findid}">
									<p class="cnf-mail mb-1">존재하지 않는 사원입니다.</p>
									<div class="d-inline-block w-100">
										<a href="/login" class="btn btn-primary mt-3">로그인 화면으로</a>
									</div>
								</c:when>
								<c:otherwise>
									<p class="cnf-mail mb-1">[${findid.empName}]사원님의 사원번호는
										[${findid.empNo}]입니다.</p>
									<div class="d-inline-block w-100">
										<a href="/login" class="btn btn-primary mt-3">로그인 화면으로</a>
									</div>
									<div class="d-inline-block w-100">
										<a href="/findpassword" class="btn btn-primary mt-3">비밀번호
											찾기</a>
									</div>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
				</div>
				<div
					class="col-md-6 d-md-block d-none bg-primary p-0 mt-n1 vh-100 overflow-hidden">
					<img src="../images/auth/03.png"
						class="img-fluid gradient-main animated-scaleX" alt="images">
				</div>
			</div>
		</section>
	</div>

	<!-- Library Bundle Script -->
	<script src="../js/core/libs.min.js"></script>

	<!-- External Library Bundle Script -->
	<script src="../js/core/external.min.js"></script>

	<!-- Widgetchart Script -->
	<script src="../js/charts/widgetcharts.js"></script>

	<!-- mapchart Script -->
	<script src="../js/charts/vectore-chart.js"></script>
	<script src="../js/charts/dashboard.js"></script>

	<!-- fslightbox Script -->
	<script src="../js/plugins/fslightbox.js"></script>

	<!-- Settings Script -->
	<script src="../js/plugins/setting.js"></script>

	<!-- Slider-tab Script -->
	<script src="../js/plugins/slider-tabs.js"></script>

	<!-- Form Wizard Script -->
	<script src="../js/plugins/form-wizard.js"></script>

	<!-- AOS Animation Plugin-->

	<!-- App Script -->
	<script src="../js/hope-ui.js" defer></script>

</body>
</html>