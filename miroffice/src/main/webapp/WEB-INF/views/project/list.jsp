<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix ="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<html lang="ko">
  <head>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

<div class="conatiner-fluid content-inner mt-n5 py-0">

<!-- 팝업 창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="teamleader/project/editprogress" method="post">
      <div class="modal-body">
      		<input type="hidden" name = "_method" value = "put"/>
      		<input type="hidden" name="projectno" id="projectno" value="">  
      		<input type="number" class="form-control" id="projectpercent" name="projectpercent" placeholder="진행률" max="100" min="0">
      		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary project-update">진행률 수정</button>
      </div>
      </form>
    </div>
  </div>
</div>


<div class="row">
   <div class="col-md-12 col-lg-12">
      <div class="row">
         <div class="col-md-12 col-lg-12">
            <div class="overflow-hidden card" data-aos="fade-up" data-aos-delay="600">
               <div class="flex-wrap card-header d-flex justify-content-between">
                  <div class="header-title col-12">
                  	 <div class="col-12 row text-center align-items-center">
                  	 	<div class="col-3 text-start">
                     		 <h1 class="card-title">프로젝트 관리</h1>
                     	</div>
                     	<div class="col-3 text-start">
                     	<h2><span class="badge badge-secondary badge-pill" style="background-color:var(--bs-info)">${deptName}</span></h2>
                     	</div>
                     	<c:if test="${role == '[ROLE_TEAMLEADER]'}" >
	                     	<div class="col-6 text-end">
	                     		<a href="teamleader/projectwrite" class="btn btn-primary text-white float-right">프로젝트 등록</a>
	                     	</div>
                     	</c:if>
                     </div>                          
                  </div>
               </div>
               <div class="p-0 card-body">
                  <div class="mt-4 table-responsive">
                     <table id="basic-table" class="table mb-0 table-hover" role="grid">
                        <thead>
                           <tr>
                              
                              <th>프로젝트 제목</th>
                              <th></th>
                              <th>시작일</th>
                              <th>종료일</th>
                              <th>남은 날</th>
                              <th>담당자</th>
                              <th>프로젝트 진행률</th>
                              <c:if test="${role == '[ROLE_TEAMLEADER]'}" >
                              <th>수정</th>
                              </c:if>
                           </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${projectList}" var="project" >
	                           <tr>
	                              <td class="col-md-4" style="cursor:pointer" onClick="location.href='project/view/${project.projectno}'">
	                              <a href="project/view/${project.projectno}">
	                                 <div class="d-flex align-items-center">
	                                    <!-- <img class="rounded bg-soft-primary img-fluid avatar-40 me-3" src="/images/shapes/01.png" alt="profile"> -->
	                                    <h6>${project.projecttitle}&nbsp; 
	                                    	
	                                    </h6>
	                                 </div>
	                              </a>
	                              </td>
	                              <td class="align-items-center text-center">
	                              	<c:choose>
                                    	<c:when test="${project.projectpercent == 100}"> 
                                    		<span class="badge badge-secondary" style="background-color:var(--bs-success)" >완료</span>
                                    	</c:when>
                                    	<c:when test="${project.projectdiffdate < 0}">
                                   			<span class="badge badge-secondary" style="background-color:var(--bs-secondary)" >기한 만료</span>
                                   		</c:when>
                                    	<c:when test="${project.projectpercent < 100}"> 
                                    		<span class="badge badge-secondary" style="background-color:var(--bs-warning)" >진행중</span>
                                    	</c:when>
                                   	</c:choose>
	                              </td>
	                              <td class="col-md-1">
	                                 ${project.projectstart}
	                              </td>
	                              <td class="col-md-1">
									 ${project.projectend}
								  </td>
								  <td>
								  	<c:choose>
								  		<c:when test="${project.projectdiffdate >= 1}">
								  			${project.projectdiffdate} 일
								  		</c:when>
								  		<c:when test="${project.projectdiffdate == 0}">
								  			오늘
								  		</c:when>
								  		<c:otherwise>
								  			기한 만료
								  		</c:otherwise>
								  	</c:choose>
								  </td>
								  <td class="col-md-1 align-items-center">
	                           	     ${project.empname }
	                           	  </td>
	                              <td class="col-md-3">
	                                 <h6>${project.projectpercent} %</h6>
	                                 <div class="shadow-none progress bg-soft-primary w-100" style="height: 4px">
	                                 	<c:if test="${project.projectpercent < 100}">
	                                 		<div class="progress-bar bg-primary" data-toggle="progress-bar" role="progressbar" aria-valuenow="${project.projectpercent}" aria-valuemin="0" aria-valuemax="100"></div>
	                                 	</c:if>
	                                 	<c:if test="${project.projectpercent == 100}">
	                                 		<div class="progress-bar bg-success" data-toggle="progress-bar" role="progressbar" aria-valuenow="${project.projectpercent}" aria-valuemin="0" aria-valuemax="100"></div>
	                                 	</c:if>
	                                 </div>
	                              </td>
	                              <c:choose>
	                              	<c:when test="${role == '[ROLE_TEAMLEADER]'}">
	                              		<td class="col-md-1">
			                              	<button type="button" class="btn btn-primary project_popup" data-bs-toggle="modal" data-bs-target="#exampleModal" project="${project.projectno}" percent="${project.projectpercent}" title="${project.projecttitle}">진행률 수정</button>
			                            </td>
	                              	</c:when>
	                              	<c:when test="${project.projectpercent == 100}">
	                              		
	                              	</c:when>
	                              </c:choose>
	                           </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
               </div>
            </div>
         </div>
      </div>
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
			$(".project_popup").on("click", function(){
				const project_no = $(this).attr("project");
				const project_percent = $(this).attr("percent");
				const project_title = $(this).attr("title");
				$("#projectno").val(project_no);
				$("#projectpercent").val(project_percent);
				$(".modal-title").text(project_title);
			})
			$(".project-update").click(function(e){
				const percent = $("#projectpercent").val();
				if(percent > 100 || percent < 0){
					e.preventDefault();
					alert("값을 제대로 입력해주세요")
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

