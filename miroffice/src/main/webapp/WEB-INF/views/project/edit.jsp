<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix ="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<html lang="ko">
  <head>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>프로젝트 수정</title>
      
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
    <%@include file="../sidebar.jsp" %>
   
        <main class="main-content">
         <%@include file="../header.jsp" %>
<!--  메인 여기부터!!! -->      
      

<div class="conatiner-fluid content-inner mt-n5 py-0">
<div class="row">
   <div class="col-md-12 col-lg-12">
      <div class="row">
         <div class="col-md-12 col-lg-12">
            <div class="overflow-hidden card" data-aos="fade-up" data-aos-delay="600">
               <div class="flex-wrap card-header d-flex justify-content-between">
                  <div class="header-title col-12 align-items-center">
                  	 <div class="col-12 row text-center">
                  	 	<div class="col-6 text-start">
                     		<h1 class="mb-2 card-title">프로젝트 등록</h1>
                     	</div>
                     	<div class="col-6 text-end">
                     		<a href="/main/projectlist" class="btn btn-secondary text-white float-right">프로젝트 목록</a>
                     	</div>
                     </div>                          
                  </div>
               </div>
               <div class="card-body">
                 	 <form action="/main/teamleader/project/edit" method="post">
                 	 <input type="hidden" name = "_method" value = "put"/>
                 	 <div class="row">
					    <div class="form-group col-md-12">
					      <label for="projecttitle">프로젝트 이름</label>
					      <input class="form-control projecttitle" type="text" id="projecttitle" name="projecttitle" placeholder="프로젝트 제목" value="${project.projecttitle}">
					    </div>
					    <div class="form-group col-md-12">
					      <label for="projecttext">프로젝트 내용</label>
					      <textarea class="form-control projecttext" id="projecttext" style="height:600px" name="projecttext" placeholder="프로젝트 내용">${project.projecttext}</textarea>
					    </div>
					    <div class="form-group col-md-6">
					      <label for="projectstart">프로젝트 시작일</label>
					      <input class="form-control projectstart" type="date" id="projectstart" name="projectstart" placeholder="프로젝트 시작일" value="${project.projectstart}">
					    </div>
					    <div class="form-group col-md-6">
					      <label for="projectend">프로젝트 종료일</label>
					      <input class="form-control projectend" type="date" id="projectend" name="projectend" placeholder="프로젝트 종료일" value="${project.projectend}">
					    </div>
					  </div>
					  <button type="submit" class="col-md-12 btn btn-primary pull-right">프로젝트 수정</button>
					  </form>
					</div>
               
            </div>
         </div>
      </div>
   </div>
</div>
</div>


<script>
$(function(){
	$("form button").click(function(e) {
		const title = $(".projecttitle").val();
		const text = $(".projecttext").val();
		const start = $(".projectstart").val();
		const end = $(".projectend").val();
		if(!title || !text || !start || !end ){
			alert("내용을 입력하세요");
			e.preventDefault();
		} else if(end < start){
			alert("시작일이 종료일보다 클 수 없습니다");
			e.preventDefault();
		}
	})
})

</script>



      <!-- 메인 여기까지 -->
<!-- Footer Section Start -->
      <%@include file = "../footer.jsp" %>
      <!-- Footer Section End -->    </main>
      <%@include file = "../setting.jsp" %>
    

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

							







