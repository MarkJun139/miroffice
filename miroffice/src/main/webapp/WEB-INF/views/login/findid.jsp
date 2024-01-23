<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../logo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="/css/loginerror.css" rel="stylesheet" type="text/css">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>아이디 찾기</title>
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
                                </svg>
									</div>
									<div class="logo-mini">
										<svg class="text-primary icon-30" viewBox="0 0 30 30"
											fill="none" xmlns="http://www.w3.org/2000/svg">
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
                                </svg>
									</div>
								</div> <!--logo End-->




								<h4 class="logo-title ms-3">미르 오피스</h4>
							</a>
							<h2 class="mb-2">사원번호 찾기</h2>
							<form method="post" action="/findidresult" class="findid">
								<div class="row">
									<div class="col-lg-12">
										<div class="floating-label form-group">
											<label for="name" class="form-label">이름</label> <input
												type="text" class="form-control" id="name" name="empName"
												aria-describedby="email" placeholder=" " value="${insertName }">
											<c:if test="${nameError != null}">
												<div class="error">${nameError}</div>
											</c:if>
											<label for="birth" class="form-label">전화번호</label> <input
												type="text" class="form-control" id="phone"
												name="empPhone" aria-describedby="email" placeholder=" "
												value="${insertPhone}">
											<c:if test="${phoneError != null}">
												<div class="error">${phoneError}</div>
											</c:if>
										</div>
									</div>
								</div>
								<button type="submit" class="btn btn-primary" id="findidbutton">찾기</button>
							</form>
						</div>
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