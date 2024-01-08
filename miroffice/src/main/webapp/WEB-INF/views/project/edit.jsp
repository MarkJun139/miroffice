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
			<div class="col-10 p-5">
				
				
				<div class="card">
					<div class="card-header">
						<h3>프로젝트 수정</h3>
					</div>
					<div class="card-body">
						<div class="form-group">
							<form action="/main/project/edit" method="post">
								<input type="hidden" name = "_method" value = "put"/>
								<input type="hidden" name="projectno" value="${project.projectno}"/>
								<input class="form-control" type="text" name="projecttitle" placeholder="프로젝트 제목" value="${project.projecttitle}"><br>
								<input class="form-control" type="text" name="projecttext" placeholder="프로젝트 내용" value="${project.projecttext}"><br>
								<input class="form-control" type="date" name="projectstart" placeholder="프로젝트 시작일" value="${project.projectstart}"><br>
								<input class="form-control" type="date" name="projectend" placeholder="프로젝트 종료일" value="${project.projectend}"><br>
								<input type="submit" class="btn btn-primary text-white float-right" value="등록하기">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>









