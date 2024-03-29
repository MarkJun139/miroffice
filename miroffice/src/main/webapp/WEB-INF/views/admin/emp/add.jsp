<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix ="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<html lang="ko">
  <head>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>사원 등록</title>
      
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
      <link rel="stylesheet" href="/css/dark.min.css"/>
      
      <!-- Customizer Css -->
      <link rel="stylesheet" href="/css/customizer.min.css" />
      
      <!-- RTL Css -->
      <link rel="stylesheet" href="/css/rtl.min.css"/>
      
      
  </head>

<body class="  ">
    <%@include file="/WEB-INF/views/sidebar.jsp" %>
   
        <main class="main-content">
         <%@include file="/WEB-INF/views/header.jsp" %>
<!--  메인 여기부터!!! -->      
      

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div class="conatiner-fluid content-inner mt-n5 py-0">
<div class="row">
   <div class="col-md-12 col-lg-12">
      <div class="row">
         <div class="col-md-12 col-lg-12">
            <div class="overflow-hidden card" data-aos="fade-up" data-aos-delay="600">
               <div class="flex-wrap card-header d-flex justify-content-between">
                  <div class="header-title col-12">
                  	 <div class="col-12 row text-center">
                  	 	<div class="col-6 text-start">
                     		<h1 class="mb-2 card-title">사원 추가</h1>
                     	</div>
                     	<div class="col-6 text-end">
                     		<a href="/main/admin/emp/list" class="btn btn-secondary text-white float-right">사원 목록</a>
                     	</div>
                     </div>                          
                  </div>
               </div>
               <div class="card-body">
               		<div class="row">
                 	 <form action="addemp" class="row" method="post" enctype="multipart/form-data">
                 	 <div class="col-2">
                 	 	<div class="card-body">
	                 	 	<h5 class="card-title text-center">사진 등록</h5>
	                 	 	<label for="preview">
	                 	 		<img class="card-img-top" src="/images${emp.empPhoto}" width="170px" height="200px" style="object-fit:cover" alt="미리보기" id="previewImage">
	                 	 	</label>
	               			<input type="file" class="form-control" id="empPhotoFile" name="empPhotoFile" onchange="handleFileSelect()">
               			</div>
               		 </div>
               		 <div class="col-10">
                 	 <div class="row">
					    <div class="form-group col-md-4">
					      <label for="name">이름</label>
					      <input type="text" class="form-control" id="name" name="empName" placeholder="이름">
					    </div>
					    <div class="form-group col-md-4">
					      <label for="birth">생년월일</label>
					      <input type="date" class="form-control" id="birth" name="empBirth" placeholder="생년월일">
					    </div>
					    <div class="form-group col-md-4">
					      <label for="dept">부서</label>
					      <select id="dept" class="form-control" name="deptNo">
					        <option disabled hidden selected>부서 선택</option>
					        <c:forEach items="${deptList}" var="dept">
					        	<option value="${dept.deptNo}">${dept.deptName}</option>
					        </c:forEach>
					      </select>
					    </div>
					  </div>
					  <div class="row">
					    <div class="form-group col-md-4">
					      <label for="phoneNumber">전화번호</label>
					      <input type="tel" class="form-control" id="phoneNumber" name="empPhone" placeholder="- 제외">
					    </div>
					    <div class="form-group col-md-8">
					      <label for="email">이메일</label>
					      <input type="email" class="form-control" id="email" name="empEmail" placeholder="example@example.com">
					    </div>
					  </div>
					  <div class="row">
					  	<div class="form-group col-md-5">
						    <label for="Address">주소</label>
						    <input type="text" class="form-control" id="address" name="empAddress" placeholder="주소" readonly>
						</div>
						<div class="form-group col-md-5">
						    <label for="Address2">상세주소</label>
						    <input type="text" class="form-control" id="address2" name="empAddress2" placeholder="상세주소">
					    </div>
					    <div class="form-group col-md-2">
					    	<label>&nbsp;</label>
						    <a href="#" class="col-md-12 btn btn-primary pull-right" id="findAddress">주소 찾기</a>
					    </div>
					  </div>
					  <div class="row">
					    <div class="form-group col-md-3">
					      <label for="sal">연봉(단위 만)</label>
					      <input type="number" class="form-control" id="sal" name="empSal" placeholder="연봉" min="0">
					    </div>
					    <div class="form-group col-md-3">
					      <label for="hireDate">입사일</label>
					      <input type="date" class="form-control" id="hiredate" name="empHiredate" placeholder="입사일">
					    </div>
					    <div class="form-group col-md-3">
					      <label for="empJob">직군</label>
					      <input type="text" class="form-control" id="job" name="empJob" placeholder="직군">
					    </div>
					    <div class="form-group col-md-3">
					      <label for="empRank">직급</label>
					      <input type="text" class="form-control" id="rank" name="empRank" placeholder="직급">
					    </div>
					  </div>
					  <div class="form-group">
					  	권한 부여
					    <div class="form-check">
						  <input class="form-check-input" type="radio" name="empRole" id="user" value="ROLE_USER" checked>
						  <label class="form-check-label" for="user">
						    사원
						  </label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="empRole" id="teamleader" value="ROLE_TEAMLEADER">
						  <label class="form-check-label" for="teamleader">
						    팀장
						  </label>
						</div>
					  </div>
					  </div>
					  <button type="submit" class="col-md-12 btn btn-primary pull-right" id="addEmployee">
 						<span class="sr-only">등록하기</span>
					  </button>
					  <button type="submit" class="col-md-12 btn btn-primary pull-right" id="addEmployeeLoading" disabled>
					  	<span class="spinner-border spinner-border-sm loadingBtn" role="status" aria-hidden="true"></span>
 						<span class="sr-only">등록중...</span>
					  </button>
					  </form>
					</div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
      </div>
      
      
 <script>
 	function handleFileSelect() {
	    // input 요소에서 파일 선택
	    var fileInput = document.getElementById('empPhotoFile');
	    var file = fileInput.files[0];

	    // 파일이 선택되었을 때만 처리
	    if (file) {
	        // 파일의 확장자 확인
	        var extension = file.name.split('.').pop().toLowerCase();

	        // 지원하는 이미지 확장자 목록
	        var allowedExtensions = ['jpg', 'jpeg', 'png'];

	        // 이미지 확장자 확인
	        if (allowedExtensions.includes(extension)) {
	            // 이미지를 미리보기
	            console.log(file);
	            readURL(file);
	        } else {
	            alert('지원하지 않는 이미지 확장자입니다.');
	        }
	    }
	}
 	function readURL(file) {
 		var reader = new FileReader();

 	    reader.onload = function(e) {
 	        document.getElementById('previewImage').src = e.target.result;
 	    };
 	    reader.readAsDataURL(file);
	}
 	$(function(){
		$("#addEmployeeLoading").hide();
 		$("#addEmployee").click(function(e){	
 			const name = $("#name").val();
 			const email = $("#email").val();
 			const birth = $("#birth").val();
 			const phone = $("#phoneNumber").val();
 			const dept = $("#dept").val();
 			const address = $("#address").val();
 			const adderss2 = $("#address2").val();
 			const sal = $("#sal").val();
 			const hiredate = $("#hiredate").val();
 			const job = $("#job").val();
 			const rank = $("#rank").val();
 			
 			const reg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
 			
 			if(!name || !email || !birth || !phone || !dept || !address || !address2 || !sal || !hiredate || !job || !rank){
 				console.log(dept + name + email + birth + phone + address + address2 + sal + hiredate + job + rank)
 				alert("누락된 항목이 있습니다.");
 				e.preventDefault();
 			} else if(reg.test(name) || reg.test(job) || reg.test(rank) || reg.test(phone) || reg.test(dept)){
				alert("특수문자를 제거해주세요");
				e.preventDefault();
 			} else {
 				$("#addEmployeeLoading").show();
 				$("#addEmployee").hide();
 			}
 		})
 		$("#findAddress").click(function(){
 			new daum.Postcode({
 	 	        oncomplete: function(data) {
 	 	            $("#address").val(data.address);
 	 	            $("#address2").focus();
 	 	        }
 	 	    }).open();	
 		})
 		$("#address").click(function(){
 			new daum.Postcode({
 	 	        oncomplete: function(data) {
 	 	            $("#address").val(data.address);
 	 	            $("#address2").focus();
 	 	        }
 	 	    }).open();	
 		})
 	})
 	
 	
 	
 </script>




      <!-- 메인 여기까지 -->
<!-- Footer Section Start -->
      <%@include file = "/WEB-INF/views/footer.jsp" %>
      <!-- Footer Section End -->    </main>
      <%@include file = "/WEB-INF/views/setting.jsp" %>
    

    <!-- Library Bundle Script -->
    <script src="/js/core/libs.min.js"></script>
    
    <!-- External Library Bundle Script -->
    <script src="/js/core/external.min.js"></script>
    
    <!-- Widgetchart Script -->
    <script src="/js/charts/widgetcharts.js"></script>
    
    <!-- mapchart Script -->
    <script src="/js/charts/vectore-chart.js"></script>
    <script src="/js/charts/dashboard.js" ></script>
    
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
	var url= window.location.href;
	$(".nav-item").find('a').each(function() {
		var burl = $(this).prop('href')
		var burl2 = burl+"#"
		if(url == burl || url == burl2){
    		console.log($(this).prop('pathname'))
			console.log($(this).prop('href'))
    		$(this).toggleClass('active', $(this).attr('href'));
		}

	})
    </script>


  </body>
</html>
