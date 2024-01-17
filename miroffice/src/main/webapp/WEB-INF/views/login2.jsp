<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>미르오피스 로그인</title>

<!-- Favicon -->
<link rel="shortcut icon" href="/images/favicon.ico" />

<!-- Library / Plugin Css Build -->
<link rel="stylesheet" href="/css/core/libs.min.css" />


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
				<div class="col-md-6">
					<div class="row justify-content-center">
						<div class="col-md-10">
							<div
								class="card card-transparent shadow-none d-flex justify-content-center mb-0 auth-card">
								<div class="card-body">
									<a href="../../dashboard/index.html"
										class="navbar-brand d-flex align-items-center mb-3"> <!--Logo start-->
										<!--logo End--> <!--Logo start-->
										<div class="logo-main">
											<div class="logo-normal">
												<svg class="text-primary icon-30" viewBox="0 0 30 30"
													fill="none" xmlns="http://www.w3.org/2000/svg">
                                          <rect x="-0.757324"
														y="19.2427" width="28" height="4" rx="2"
														transform="rotate(-45 -0.757324 19.2427)"
														fill="currentColor" />
                                          <rect x="7.72803" y="27.728"
														width="28" height="4" rx="2"
														transform="rotate(-45 7.72803 27.728)" fill="currentColor" />
                                          <rect x="10.5366" y="16.3945"
														width="16" height="4" rx="2"
														transform="rotate(45 10.5366 16.3945)" fill="currentColor" />
                                          <rect x="10.5562"
														y="-0.556152" width="28" height="4" rx="2"
														transform="rotate(45 10.5562 -0.556152)"
														fill="currentColor" />
                                      </svg>
											</div>
											<div class="logo-mini">
												<svg class="text-primary icon-30" viewBox="0 0 30 30"
													fill="none" xmlns="http://www.w3.org/2000/svg">
                                          <rect x="-0.757324"
														y="19.2427" width="28" height="4" rx="2"
														transform="rotate(-45 -0.757324 19.2427)"
														fill="currentColor" />
                                          <rect x="7.72803" y="27.728"
														width="28" height="4" rx="2"
														transform="rotate(-45 7.72803 27.728)" fill="currentColor" />
                                          <rect x="10.5366" y="16.3945"
														width="16" height="4" rx="2"
														transform="rotate(45 10.5366 16.3945)" fill="currentColor" />
                                          <rect x="10.5562"
														y="-0.556152" width="28" height="4" rx="2"
														transform="rotate(45 10.5562 -0.556152)"
														fill="currentColor" />
                                      </svg>
											</div>
										</div> <!--logo End-->




										<h4 class="logo-title ms-3">미르오피스</h4>
									</a>
									<h2 class="mb-2 text-center">로그인</h2>

									<form method="post" action="/login">
										<div class="row">
											<div class="col-lg-12">
												<div class="form-group">
													<label for="empno" class="form-label">사원번호</label> <input
														type="number" class="form-control" name="username"
														id="empno" aria-describedby="number"
														placeholder=" ">
												</div>
											</div>
											<div class="col-lg-12">
												<div class="form-group">
													<label for="emppw" class="form-label">비밀번호</label> <input
														type="password" class="form-control" name="password"
														id="emppw" aria-describedby="password" placeholder=" ">
												</div>
											</div>
											<div class="col-lg-12 d-flex justify-content-between">
												<!--                                     <div class="form-check mb-3">
                                       <input type="checkbox" class="form-check-input" id="customCheck1" name="remember_empno">
                                       <label class="form-check-label" for="customCheck1">사원번호 저장</label>
                                   </div> -->
												<div class="form-check mb-3">
													<input type="checkbox" class="form-check-input"
														id="customCheck2" name="remember-me"> <label
														class="form-check-label" for="customCheck1">로그인
														기억하기</label>
												</div>

											</div>
										</div>
										<div class="d-flex justify-content-center">
											<button type="submit" formmethod="POST"
												class="btn btn-primary">로그인</button>
										</div>
									</form>
									<form>
										<p class="mt-3 text-center">
											사원번호를 잊으셨나요? <a href="/findid" class="text-underline">사원번호
												찾기</a>
										</p>
										<p class="mt-3 text-center">
											비밀번호를 잊으셨나요? <a href="/findpassword" class="text-underline">비밀번호
												찾기</a>
										</p>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="sign-bg">
						<svg width="280" height="230" viewBox="0 0 431 398" fill="none"
							xmlns="http://www.w3.org/2000/svg">
                     <g opacity="0.05">
                     <rect x="-157.085" y="193.773" width="543"
								height="77.5714" rx="38.7857"
								transform="rotate(-45 -157.085 193.773)" fill="#3B8AFF" />
                     <rect x="7.46875" y="358.327" width="543"
								height="77.5714" rx="38.7857"
								transform="rotate(-45 7.46875 358.327)" fill="#3B8AFF" />
                     <rect x="61.9355" y="138.545" width="310.286"
								height="77.5714" rx="38.7857"
								transform="rotate(45 61.9355 138.545)" fill="#3B8AFF" />
                     <rect x="62.3154" y="-190.173" width="543"
								height="77.5714" rx="38.7857"
								transform="rotate(45 62.3154 -190.173)" fill="#3B8AFF" />
                     </g>
                  </svg>
					</div>
				</div>
				<div
					class="col-md-6 d-md-block d-none bg-primary p-0 mt-n1 vh-100 overflow-hidden">
					<img src="/images/auth/01.png"
						class="img-fluid gradient-main animated-scaleX" alt="images">
				</div>
			</div>
		</section>
	</div>

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

	<!-- App Script -->
	<script src="/js/hope-ui.js" defer></script>

</body>
<script>

var regex = /^[0-9]+$/;
$('#empno').keyup(function(){
	if(regex.test($(this).val())){
	} else {
		alert("숫자만 입력 가능합니다.");
	}
})
</script>
</html>