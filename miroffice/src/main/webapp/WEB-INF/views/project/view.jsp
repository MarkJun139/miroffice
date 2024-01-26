<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix ="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<html lang="ko">
  <head>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>프로젝트 상세</title>
      
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

<c:set var="name" value="${pageContext.request.userPrincipal.name}" />
<c:set var="role" value="${pageContext.request.userPrincipal.authorities}" />
<!-- 팝업 창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5>프로젝트 삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<h4><span style="font-weight: bold;" class="modal-title"></span><br> 프로젝트를 정말 삭제하시겠습니까?</h4>
      </div>
      <div class="modal-footer">
        <form action="/main/teamleader/project/delete/${project.projectno}" method="post" >
	    	<input type="hidden" name="_method" value="delete"/>
	    	<input class="btn text-white btn-danger" type="submit" value="프로젝트 삭제">
	    </form>
      </div>
    </div>
  </div>
</div>

<div class="conatiner-fluid content-inner mt-n5 py-0">
<div class="row">
   <div class="col-md-12 col-lg-12">
      <div class="row">
         <div class="col-md-12 col-lg-12">
            <div class="overflow-hidden card" data-aos="fade-up" data-aos-delay="600">
               <div class="card-header">
                  <div class="header-title col-12">
                  	 <div class="col-12 row text-center align-items-center">
                  	 	<div class="col-6 text-start">
                     		<h1 class="mb-2 card-title">${project.projecttitle}</h1>
                     		<c:choose>
	                           	<c:when test="${project.projectpercent == 100}"> 
	                           		<span class="badge badge-secondary" style="background-color:var(--bs-success)" >완료된 프로젝트</span>
	                           	</c:when>
	                           	<c:when test="${project.projectdiffdate < 0}">
	                          			<span class="badge badge-secondary" style="background-color:var(--bs-secondary)" >기한 만료된 프로젝트</span>
	                          		</c:when>
	                           	<c:when test="${project.projectpercent < 100}"> 
	                           		<span class="badge badge-secondary" style="background-color:var(--bs-warning)" >진행중인 프로젝트</span>
	                           	</c:when>
                          	</c:choose>
                     		
                     	</div>
                     </div>                          
                  </div>
               </div>
               <div class="card-body">
               		<p class="card-text">${project.projecttext}</p>
               </div>
               <div class="card-footer col-12">
               		<div class="col-12 row text-center align-items-center">
                  	 	<div class="col-6 text-start">
                     		<a href="/main/projectlist" class="btn btn-primary">프로젝트 목록</a>
                     	</div>
                     	<div class="col-6 text-end">
                     		<c:if test="${project.projectpercent < 100}">
                     		<a href="/main/teamleader/project/edit/${project.projectno}" class="btn btn-info text-white">프로젝트 수정</a>
                     		</c:if>
                     		<c:if test="${project.empno == name}"> 
                    			<button type="button" class="btn btn-danger project_popup" data-bs-toggle="modal" data-bs-target="#exampleModal" project="${project.projectno}" title="${project.projecttitle}">프로젝트 삭제</button>
                    		</c:if>
                    	</div>
                    </div>
			   </div>
            </div>
         </div>
      </div>
   </div>
</div>
</div>

<script>
$(function(){
	$(".project_popup").on("click", function(){
		const project_no = $(this).attr("project");
		const project_title = $(this).attr("title");
		$("#projectno").val(project_no);
		$(".modal-title").text(project_title);
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
