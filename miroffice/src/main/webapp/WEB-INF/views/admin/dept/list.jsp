<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix ="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<html lang="ko">
  <head>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>부서 목록</title>
      
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
<!-- 부서 추가 팝업 창 -->
<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
<form action="/main/admin/dept/adddept" method="post" class="addDeptForm">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <div class="modal-header">
        <h5 class="modal-title">부서 등록</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	
	      	<div class="form-group">
	      	<label for="name">부서 번호</label>
			<input type="number" class="form-control" id="deptNo" name="deptNo" placeholder="부서 번호">
			</div>
			<div class="form-group">
	     	<label for="name">부서 이름</label>
			<input type="text" class="form-control" id="deptName" name="deptName" placeholder="부서 이름">
			</div>
		
      </div>
      <div class="modal-footer">
       		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
       		<button type="submit" class="btn btn-primary project_popup" id="addDepartment">부서 등록</button>
      </div>
    </div>
  </div>
  </form>
</div>
<!-- 팝업 창 -->
<!-- 부서 정보 수정 팝업 창 -->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
<form action="/main/admin/dept/update" method="post" class="deptUpdateForm">
 <input type="hidden" name = "_method" value = "put"/>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">부서 정보 수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<input type="hidden" class="form-control deptNo" name="deptNo" readonly >
		<div class="form-group">
     	<label for="name">부서 이름</label>
		<input type="text" class="form-control deptName" name="deptName" placeholder="부서 이름">
		</div>
      </div>
      <div class="modal-footer">
       		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
       		<input type="submit" class="btn btn-primary project_popup deptUpdateSubmit" value="부서명 수정">
      </div>
    </div>
  </div>
  </form>
</div>
<!-- 부서 정보 수정 팝업 창 -->
<!-- 부서 삭제 팝업 창 -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">부서 삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
      <h4><span style="font-weight: bold;" id="deptNameBody"></span> 부서를 정말 삭제하시겠습니까?</h4>
      </div>
      <div class="modal-footer">
      <form action="/main/admin/dept/delete" method="post" class="deptDeleteForm">
       		<input type="hidden" name="_method" value="delete" />
       		<input type="hidden" name="deptNo" class="deptDeleteNo"/>
       		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
       		<input type="submit" class="btn btn-danger project_popup deptDeleteSubmit" value="부서 삭제">
       	</form>
      </div>
    </div>
  </div>
</div>
<!-- 부서 삭제 팝업 창 -->
<div class="row">
   <div class="col-md-12 col-lg-12">
      <div class="row ">
         <div class="col-md-12 col-lg-12">
            <div class="overflow-hidden card" data-aos="fade-up" data-aos-delay="600">
               <div class="flex-wrap card-header d-flex justify-content-between">
                  <div class="header-title col-12">
                  	 <div class="col-12 row text-center align-items-center">
                  	 	<div class="col-6 text-start">
                     		<h1 class="mb-2 card-title">부서 관리</h1>
                     	</div>
                     	<div class="col-6 text-end align-center">
                     		<button type="button" class="btn btn-info " data-bs-toggle="modal" data-bs-target="#addModal">부서 등록</button>
                     	</div>
                     </div>                          
                  </div>
               </div>
               <form action="/main/admin/dept/deletecheck" method="post">
               <input type="hidden" name="_method" value="delete" />
               <div class="p-0 card-body">
               
                  <div class="mt-4 table-responsive">
                     <table id="basic-table" class="table mb-0 table-striped" role="grid">
                        <thead>
                           <tr>
                           	  <th><input class="form-check-input" type="checkbox" id="deptListCheck"></th>
                              <th>부서 번호</th>
                              <th>부서 이름</th>
                              <th>부서 수정</th>
                              <th>부서 삭제</th>
                           </tr>
                        </thead>
                        <tbody>
                        
                        	<c:forEach items="${deptList}" var="dept" >
	                           <tr>
	                              <td class="col-md-1">
	                              	<input class="form-check-input deptCheckbox" name="deptDelCheck" type="checkbox" value="${dept.deptNo}" id="flexCheckDefault">
	                              </td>
	                           	  <td class="col-md-1">
	                                 ${dept.deptNo} 
	                              </td>
	                              <td class="col-md-4">
	                                 ${dept.deptName}
	                              </td>
	                              <td class="col-md-1">
	                              	
	                              	<button type="button" class="btn btn-info update_popup" data-bs-toggle="modal" data-bs-target="#updateModal" deptNo="${dept.deptNo}" deptName="${dept.deptName}">정보 수정</button>
	                              	
	                              </td>
	                              <td class="col-md-1">
	                              	<button type="button" class="btn btn-danger delete_popup" data-bs-toggle="modal" data-bs-target="#deleteModal" deptNo="${dept.deptNo}" deptName="${dept.deptName}">부서 삭제</button>
	                              </td>
	                           </tr>
	                          
                           </c:forEach>
                        
                        </tbody>
                     </table>
                  </div>
               </div>
               <div class="card-footer align-items-center">
               		<button type="submit" class="btn btn-danger deptDeleteCheckbox" deptNo="${dept.deptNo}" deptName="${dept.deptName}">선택 삭제</button>
               </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
      </div>
      
      <script>

		$(function(){
			$(".delete_popup").on("click",function(){
				const deptNo = $(this).attr("deptNo");
				const deptName = $(this).attr("deptName");
				$(".deptDeleteNo").val(deptNo);
				$("#deptNameBody").text(deptName);
			})
			$(".update_popup").on("click",function(){
				const deptNo = $(this).attr("deptNo");
				const deptName = $(this).attr("deptName");
				$(".deptNo").val(deptNo);
				$(".deptName").val(deptName);
				$(".deptNameBody").text(deptName);
			})
			$("#deptListCheck").change(function() {
	            if ($(this).prop("checked")) {
	                $("[name='deptDelCheck']").prop("checked", true);
	            } else {
	                $("[name='deptDelCheck']").prop("checked", false);
	            }
	        });
			
			$(".deptUpdateSubmit").click(function(e) {
				const deptNo = $(".deptNo").val();
				const deptName = $(".deptName").val();
				if(!deptNo || !deptName){
					alert("내용을 입력하세요");
					e.preventDefault();
				} else if(deptNo < 0 || deptNo == 99){
					alert("지정할 수 없는 부서번호 입니다");
					e.preventDefault();
				} else {
					const reg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
					if(reg.test(deptName)){
						alert("부서이름에 특수문자를 사용할 수 없습니다");
						e.preventDefault();
						return;
					}
					
					const deptData = {
						deptNo : deptNo,
						deptName : deptName
					};
					$.ajax({
						type:"PUT",
						url: "/main/admin/dept/update",
						contentType: "application/json",
						data: JSON.stringify(deptData),
						success: function(res){
							alert("수정 성공");
							window.location.href = "/main/admin/dept/list";
						},
						error : function(){
							alert("에러")
						}
					})
					e.preventDefault();
				}
				
			})
			
			
			
			$("#addDepartment").click(function(e) {
				const deptNo = $("#deptNo").val();
				const deptName = $("#deptName").val();
				
				if(!deptNo || !deptName){
					alert("내용을 입력하세요");
					e.preventDefault();
				} else if(deptNo < 0 || deptNo == 99){
					alert("지정할 수 없는 부서번호 입니다");
					e.preventDefault();
				} else {
					const reg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
					if(reg.test(deptName)){
						alert("부서이름에 특수문자를 사용할 수 없습니다");
						e.preventDefault();
						return;
					}
					
					$.ajax({
						type:"GET",
						url: "/main/checkDeptNo",
						data: {deptno : deptNo},
						success: function(res){
							if(res == 1) {
								alert("부서번호가 이미 존재합니다");
							} else {
								$(".addDeptForm").submit();
							}
						},
						error : function(){
							alert("에러")
						}
					})
					e.preventDefault();
				}
			})
			
			$(".deptDeleteSubmit").click(function(e){
				const deptNo = $(".deptDeleteNo").val();
				
				$.ajax({
					type:"POST",
					url: "/main/admin/dept/delete",
					data : {deptno : deptNo},
					success : function(res) {
						window.location.href = "/main/admin/dept/list";
					},
					error : function(){
						alert("해당 부서 부서원을 먼저 삭제, 수정해주세요");
					}
				})
				e.preventDefault();
			})
			$(".deptDeleteCheckbox").on("click",function(e){
				const select = $(".deptCheckbox:checked").map(function() {
			        return this.value;
			    }).get();
				if(select.length === 0){
					alert("삭제할 부서를 선택해주세요");
					e.preventDefault();
					return;
				} 
				$.ajax({
					type:"POST",
					url: "/main/admin/dept/deletecheck",
					data : {deptDelCheck : select},
					traditional: true,
					success : function(res) {
						alert("부서번호 : " + select + "삭제 성공");
						window.location.href = "/main/admin/dept/list";
					},
					error: function(a, b, c) {
						alert("체크된 해당 부서 부서원을 먼저 삭제, 수정해주세요")
			            console.error("ajax Error : ", a, b,c);
			            console.log(select);
			        }
				})
				e.preventDefault();
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
