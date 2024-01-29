<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix ="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<html lang="ko">
  <head>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>사원 목록</title>
      
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
      

<div class="conatiner-fluid content-inner mt-n5 py-0">
<!-- 팝업 창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">사원 삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
      <h4><span style="font-weight: bold;" class="empNameBody"></span> 님을 정말 삭제하시겠습니까?</h4>
      <h7>해당 사원을 삭제하면 게시판, 근태 등 관련 정보를 함께 삭제합니다</h7>
      </div>
      <div class="modal-footer">
      <form action="/main/admin/emp/delete" method="post" class="empDeleteForm">
       		<input type="hidden" name="_method" value="delete" />
       		<input type="hidden" name="empNo" id="empNo"/>
       		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
       		
       	</form>
       	<a class="btn btn-danger empDeleteBtn">사원 삭제</a>
      </div>
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
                  	 	<div class="col-6 text-start">
                     		<h1 class="mb-2 card-title">사원 관리</h1>
                     	</div>
                     	<div class="col-6 text-end">
                     		<a href="../emp/add" class="btn btn-primary text-white float-right">사원 등록</a>
                     	</div>
                     </div>                          
                  </div>
               </div>
               <div class="card-body">
               	  <div class="col-12 d-flex">
                  		<input type="text" class="form-control searchInput" id="searchInput" placeholder="이름를 입력하세요">
                  </div>
                  <div class="mt-4 table-responsive">
                  	
                     <table id="basic-table" class="table mb-0 table-striped" role="grid">
                        <thead>
                           <tr>
                              <th><input class="form-check-input" type="checkbox" id="empListCheck"></th>
                              <th></th>
                              <th>사원번호</th>
                              <th>사원이름</th>
                              <th>부서명</th>
                              <th>직무</th>
                              <th>직급</th>
                              <th>연봉</th>
                              <th>권한</th>
                              <th></th>
                              <th></th>
                           </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${empList}" var="emp" >
	                           <tr>
	                           	  <td class="col-md-1">
	                              	<input class="form-check-input empCheckbox" name="empDelCheck" type="checkbox" value="${emp.empNo}" id="flexCheckDefault">
	                              </td>
	                           	  <td class="col-md-1">
	                                 <img src="/images${emp.empPhoto}" width="125px" height="150px" style="object-fit:cover" alt="사원 사진">	 
	                              </td>
	                              <td class="col-md-1">
	                                 ${emp.empNo}
	                              </td>
	                              <td class="col-md-1 empNameVal">
									 ${emp.empName}
								  </td>
	                              <td class="col-md-2">
	                                 ${emp.deptName}
	                              </td>
	                              <td class="col-md-2">
	                                 ${emp.empJob}
	                              </td>
	                              <td class="col-md-1">
	                                 ${emp.empRank}
	                              </td>
	                              <td class="col-md-1">
	                                 ${emp.empSal}
	                              </td>
	                              <td class="col-md-1">
	                                 <c:if test="${emp.empRole == 'ROLE_USER'}">
	                                 	사원
	                                 </c:if>
	                                 <c:if test="${emp.empRole == 'ROLE_TEAMLEADER'}">
	                                 	팀장
	                                 </c:if>
	                              </td>
	                              <td class="col-md-1">
	                              	
	                              	<a href="../emp/edit/${emp.empNo}" class="btn btn-primary project_popup">정보 수정</a>
	                              	
	                              </td>
	                              <td class="col-md-1">
	                              	<button type="button" class="btn btn-danger delete_popup" data-bs-toggle="modal" data-bs-target="#exampleModal" empNo="${emp.empNo}" empName="${emp.empName}">사원 삭제</button>
	                              </td>
	                           </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
               </div>
               <div class="card-footer align-items-center">
               		<button type="submit" class="btn btn-danger empDeleteCheckbox">선택 삭제</button>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
      </div>
      
      <script>

		$(function(){
			$(".delete_popup").on("click", function(e){
				
				const empNo = $(this).attr("empNo");
				const empName = $(this).attr("empName");
				$("#empNo").val(empNo);
				$(".empNameBody").text(empName);
			
				e.preventDefault();
			})
			
			$(".empDeleteBtn").click(function(e){
				const empNo = $("#empNo").val();
				$.ajax({
					type:"POST",
					url:"/main/admin/emp/delete",
					data: {empNo : empNo},
					success : function(res) {
						alert(empNo + " 번 사원 삭제");
						$(".empDeleteForm").submit();
						window.location.href = "/main/admin/emp/list";
					},
					error: function(a, b, c) {
						alert("에러")
			            console.error("ajax Error : ", a, b,c);
			            console.log(select);
			        }
				})	
				
			})
			
			
			$("#empListCheck").change(function() {
	            if ($(this).prop("checked")) {
	                $("[name='empDelCheck']").prop("checked", true);
	            } else {
	                $("[name='empDelCheck']").prop("checked", false);
	            }
	        });
			
			
			$(".empDeleteCheckbox").on("click",function(e){
				const select = $(".empCheckbox:checked").map(function() {
			        return this.value;
			    }).get();
				
				if(select.length === 0){
					alert("삭제할 사원을 선택해주세요");
					return;
					e.preventDefault();
				}
				var conf = confirm("정말로" + select + "사원을 삭제하시겠습니까? 선택한 사원의 정보가 삭제됩니다.");
				if(conf){
					$.ajax({
						type:"DELETE",
						url: "/main/admin/emp/deletecheck",
						data : {empDelCheck : select},
						traditional: true,
						success : function(res) {
							alert("사원번호 : " + select + "삭제 성공");
							window.location.href = "/main/admin/emp/list";
						},
						error: function(a, b, c) {
							alert("참조된 값 존재")
				            console.error("ajax Error : ", a, b,c);
				            console.log(select);
				        }
					})
					e.preventDefault();	
				} else {
					e.preventDefault();
					return;
				}
				
			})
			
			$(".searchInput").keyup(function(){
			    console.log("검색확인");
			    
			    var searchName = $(this).val().trim().toLowerCase();
			    
			    $("#basic-table > tbody > tr").hide();

			    $("#basic-table > tbody > tr").filter(function() {
			    	
			        return $(this).find('.empNameVal').text().toLowerCase().includes(searchName);
			        
			    }).show();
			});
			
			
			
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



