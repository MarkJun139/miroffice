<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix ="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<html lang="ko">
  <head>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>프로젝트 등록</title>
      
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
                 	 <form action="/main/teamleader/project/write" method="post">
                 	 <div class="row">
					    <div class="form-group col-md-12">
					      <label for="name">프로젝트 이름</label>
					      <input class="form-control projecttitle" type="text" name="projecttitle" placeholder="프로젝트 제목">
					    </div>
					    <div class="form-group col-md-12">
					      <label for="birth">프로젝트 내용</label>
					      <textarea class="form-control projecttext"  style="height:600px" name="projecttext" placeholder="프로젝트 내용"></textarea>
					    </div>
					    <div class="form-group col-md-6">
					      <label for="birth">프로젝트 시작일</label>
					      <input class="form-control projectstart" type="date" name="projectstart" placeholder="프로젝트 시작일">
					    </div>
					    <div class="form-group col-md-6">
					      <label for="birth">프로젝트 종료일</label>
					      <input class="form-control projectend" type="date" name="projectend" placeholder="프로젝트 종료일">
					    </div>
					  </div>
					  <button type="submit" class="col-md-12 btn btn-primary pull-right">프로젝트 등록</button>
					  </form>
					</div>
            	</div>
         </div>
      </div>
   </div>
</div>
<div class="bd-example">
    <div class="form-group">
        <input type="text" class="form-control date_flatpicker" placeholder="Date Picker">
    </div>
</div>
</div>
<div class="btn-download">
    <a class="btn btn-success px-3 py-2" href="https://iqonic.design/product/admin-templates/hope-ui-admin-free-open-source-bootstrap-admin-template/" target="_blank" >
        <svg class="icon-24"  width="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path opacity="0.4" d="M17.554 7.29614C20.005 7.29614 22 9.35594 22 11.8876V16.9199C22 19.4453 20.01 21.5 17.564 21.5L6.448 21.5C3.996 21.5 2 19.4412 2 16.9096V11.8773C2 9.35181 3.991 7.29614 6.438 7.29614H7.378L17.554 7.29614Z" fill="currentColor"></path>
            <path d="M12.5464 16.0374L15.4554 13.0695C15.7554 12.7627 15.7554 12.2691 15.4534 11.9634C15.1514 11.6587 14.6644 11.6597 14.3644 11.9654L12.7714 13.5905L12.7714 3.2821C12.7714 2.85042 12.4264 2.5 12.0004 2.5C11.5754 2.5 11.2314 2.85042 11.2314 3.2821L11.2314 13.5905L9.63742 11.9654C9.33742 11.6597 8.85043 11.6587 8.54843 11.9634C8.39743 12.1168 8.32142 12.3168 8.32142 12.518C8.32142 12.717 8.39743 12.9171 8.54643 13.0695L11.4554 16.0374C11.6004 16.1847 11.7964 16.268 12.0004 16.268C12.2054 16.268 12.4014 16.1847 12.5464 16.0374Z" fill="currentColor"></path>
        </svg>
    </a>
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