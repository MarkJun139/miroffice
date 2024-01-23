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

<style>
.button {
	background-color: #007bff;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 10px;
}

.table {
	margin-left: 300px;
	margin-top: 50px;
	width: 1000px;
}
.hidden {
    display: none;
}

</style>
<script>
        function showPage(pageNumber) {
            var tables = document.getElementsByClassName('tablePage');
            for (var i = 0; i < tables.length; i++) {
                tables[i].classList.add('hidden');
            }

            var currentPage = document.getElementById('tablePage' + pageNumber);
            if (currentPage) {
                currentPage.classList.remove('hidden');
            }
        }

        function createPages() {
            var tables = document.getElementsByClassName('table');
            var pageCount = Math.ceil(tables.length / 20);

            for (var i = 0; i < pageCount; i++) {
                var tablePage = document.createElement('table');
                tablePage.classList.add('table', 'tablePage', 'hidden');
                tablePage.id = 'tablePage' + (i + 1);

                var thead = tables[0].getElementsByTagName('thead')[0].cloneNode(true);
                tablePage.appendChild(thead);

                var tbody = document.createElement('tbody');
                for (var j = i * 20; j < Math.min((i + 1) * 20, tables.length); j++) {
                    tbody.appendChild(tables[j].getElementsByTagName('tbody')[0].cloneNode(true));
                }
                tablePage.appendChild(tbody);

                document.body.appendChild(tablePage);
            }
        }

        window.onload = createPages;
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
								<h1 class="card-title">주소록</h1>
							</div>
						</div>
					</div>
				</div>
				<!--  메인 여기부터!!! -->

				<h3 style="margin-left: 50px; margin-top: 100px">부서 검색</h3>

				<form method="post">
					<select style="margin-left: 40px; margin-top: 20px; width: 100px"
						name="deptName" id="deptName">
						<c:forEach var="deptName" items="${deptName}">
							<option value="${deptName}">${deptName}</option>
						</c:forEach>
					</select>
					<button class="button" type="submit">검색</button>
				</form>

				<h3 style="margin-left: 280px; margin-top: -170px;">사원 정보</h3>

				<table class="table">
					<tr>
						<td>부서</td>
						<td>이름</td>
						<td>주소</td>
						<td>전화번호</td>
					</tr>
					<c:forEach var="usersInfo" items="${usersInfo}">
						<tr>
							<td>${usersInfo.deptName}</td>
							<td>${usersInfo.empName}</td>
							<td>${usersInfo.empAddress}</td>
							<td>${usersInfo.empPhone}</td>
						</tr>
					</c:forEach>
				</table>

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