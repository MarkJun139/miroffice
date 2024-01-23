<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../logo.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>임시 비밀번호 발급</title>
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
				<div
					class="col-md-6 d-md-block d-none bg-primary p-0 mt-n1 vh-100 overflow-hidden">
					<img src="../images/auth/02.png"
						class="img-fluid gradient-main animated-scaleX" alt="images">
				</div>
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
                                    <rect x="-0.757324" y="19.2427"
												width="28" height="4" rx="2"
												transform="rotate(-45 -0.757324 19.2427)"
												fill="currentColor" />
                                    <rect x="7.72803" y="27.728"
												width="28" height="4" rx="2"
												transform="rotate(-45 7.72803 27.728)" fill="currentColor" />
                                    <rect x="10.5366" y="16.3945"
												width="16" height="4" rx="2"
												transform="rotate(45 10.5366 16.3945)" fill="currentColor" />
                                    <rect x="10.5562" y="-0.556152"
												width="28" height="4" rx="2"
												transform="rotate(45 10.5562 -0.556152)" fill="currentColor" />
									</div>
								</div> <!--logo End-->




								<h4 class="logo-title ms-3">미르 오피스</h4>
							</a>
							<h2 class="mb-2">임시 비밀번호 발급</h2>
							<!-- <form method="post" action="/findpasswordresult"> -->
							<div class="row">
								<div class="col-lg-12">
									<div class="floating-label form-group">
										<c:choose>
											<c:when test="${empty password}">
												<p class="cnf-mail mb-1">존재하지 않는 사원입니다.</p>
											</c:when>
											<c:otherwise>
												<p class="cnf-mail mb-1">${name}님,${email}로 임시 비밀번호가
													전송되었습니다.</p>
												<p class="cnf-mail mb-1">로그인 후 비밀번호 재설정하시기 바랍니다.</p>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<div class="d-inline-block w-100">
									<a href="/login" class="btn btn-primary mt-3">로그인 화면으로</a>
								</div>
							</div>
						</div>
						<div class="sign-bg sign-bg-right">
						</div>
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
</body>
</html>