<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>아이디 찾기</title>

<!-- Favicon -->
<link rel="shortcut icon" href="../images/favicon.ico" />

<!-- Library / Plugin Css Build -->
<link rel="stylesheet" href="../css/core/libs.min.css" />


<!-- Hope Ui Design System Css -->
<link rel="stylesheet" href="../css/hope-ui.min.css?v=2.0.0" />

<!-- Custom Css -->
<link rel="stylesheet" href="../css/custom.min.css?v=2.0.0" />

<!-- Dark Css -->
<link rel="stylesheet" href="../css/dark.min.css" />

<!-- Customizer Css -->
<link rel="stylesheet" href="../css/customizer.min.css" />

<!-- RTL Css -->
<link rel="stylesheet" href="../css/rtl.min.css" />


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
												aria-describedby="email" placeholder=" "> <label
												for="birth" class="form-label">전화번호</label> <input
												type="text" class="form-control" id="phone" name="empPhone"
												aria-describedby="email" placeholder="'-'제외">
										</div>
									</div>
								</div>
								<button type="submit" class="btn btn-primary" id="findidbutton">찾기</button>
							</form>
						</div>
					</div>
					<div class="sign-bg sign-bg-right">
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
</body>
<script>
$('#findidbutton').click(function(){
    if($('#name').val() == ''){
    	  alert("이름을 입력하세요.");
          return false;
      }
    if($('#phone').val() == ''){
    	alert("전화번호를 입력하세요.");
          return false;
      }
    return true;
});
</script>
</html>