<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<style>
	a {
		text-decoration-line: none;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-light bg-light">
		<div class="container">
			<div class="row">
				<div class="col-2">
					<a class="navbar-brand" href="/main">회사로고</a>
				</div>
				<div class="col-10">
				</div>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-2">
				<div class="card" style="border:none">
					<img class="card-img-top" src="https://blog.kakaocdn.net/dn/bftRiB/btqAjaghSBk/5CcN9W5qyCU8HLylVYcXb1/img.png" alt="employee">
					<div class="card-body">
						<h5 class="card-title text-center">부서명</h5>
						<p class="card-text text-center">사원명</p>
					</div>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item list-group-item-action">근태관리</li>
					<li class="list-group-item list-group-item-action">주소록</li>
					<li class="list-group-item list-group-item-action">전자결제</li>
					<li class="list-group-item list-group-item-action">일정</li>
					<li class="list-group-item list-group-item-action">공지사항</li>
					<li class="list-group-item list-group-item-action"> 
						<a href="projectlist">프로젝트 관리</a>
					</li>
					<li class="list-group-item list-group-item-action">게시판</li>
					<li class="list-group-item list-group-item-action">마이페이지</li>
				</ul>
			</div>
			<div class="col-10">
				<div class="container">
					<div class="row">
						<div class="col-6 p-3">
							<div class="card">
								<div class="card-header">
									근로시간 확인
								</div>
								<div class="card-body">
									<h5 class="card-title">주간 근로시간 확인</h5>
									<a href="#" class="btn btn-info text-white">출근 등록</a>
									<a href="#" class="btn btn-info text-white">퇴근 등록</a>
								</div>
							</div>
						</div>
						<div class="col-6 p-3">
							<div class="card">
								<div class="card-header">
									프로젝트 관리
								</div>
								<div class="card-body">
									<ul class="list-group list-group-flush">
										<li class="list-group-item">
											프로젝트1
										    <div class="progress">
												<div class="progress-bar" role="progressbar" style="width:60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
											</div>
										</li>
										<li class="list-group-item">
										    프로젝트2
										    <div class="progress">
												<div class="progress-bar" role="progressbar" style="width:40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
											</div>
										</li>
										<li class="list-group-item">
										    프로젝트3
										    <div class="progress">
												<div class="progress-bar" role="progressbar" style="width:78%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100"></div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-4 p-3">
							<div class="card">
								<div class="card-header">
									캘린더
								</div>
								<div class="card-body">
									<h5 class="card-title">캘린더</h5>
									
								</div>
							</div>
						</div>
						<div class="col-4 p-3">
							<div class="card">
								<div class="card-header">
									공지사항
								</div>
								<div class="card-body">
									<ul class="list-group list-group-flush">
										  <li class="list-group-item">
										    공지사항1
										  </li>
										  <li class="list-group-item">
										    공지사항2
										  </li>
										  <li class="list-group-item">
										    공지사항3
										  </li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-4 p-3">
							<div class="card">
								<div class="card-header">
									부서 공지사항
								</div>
								<div class="card-body">
									<ul class="list-group list-group-flush">
										  <li class="list-group-item">
										    공지사항1
										  </li>
										  <li class="list-group-item">
										    공지사항2
										  </li>
										  <li class="list-group-item">
										    공지사항3
										  </li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>









