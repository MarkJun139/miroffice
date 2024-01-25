<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix ="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/ckeditor/content-styles.css" type="text/css">


<html lang="ko">
  <head>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>미르오피스</title>

      <!-- Favicon -->
      <link rel="shortcut icon" href="/images/icons/logo.png" />
      
      <!-- Library / Plugin Css Build -->
      <link rel="stylesheet" href="/css/core/libs.min.css" />
      
      <link rel="stylesheet" href="/css/mylist.css" />
      
      <link rel="stylesheet" type="text/css" href="/css/core/usercs.css"/>
      
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
        
      <div class="position-relative iq-banner">
        <!--Nav Start-->
        
            <%@include file="../header.jsp" %>
        <!--Nav End -->
      </div>

<div class="conatiner-fluid content-inner mt-n5 py-0">

            <div class="overflow-hidden card" data-aos="fade-up" data-aos-delay="100" style="overflow-x: auto">
                           <div class="flex-wrap card-header d-flex justify-content-between">
                  <div class="header-title col-12">
                  <div class="col-12 row text-center align-items-center">
                              	 	<div class="col-3 text-start" id="coldoc">
                     		 <h1 class="card-title">${title	 }</h1>
                     	</div>
                     	<div class="col-3 text-start">
                     	<h2><span class="badge badge-secondary badge-pill" style="background-color:var(--bs-info)">${deptName}</span></h2>
                     	</div>
                     	</div>
                     	</div>
                     	</div>
                     	
                     	
                     	
<div class="p-2 card-body" style="border: 1px; margin-right:20px;">
            <div style="float: left;">
            <div class="table-responsive">
               <table id="datatable" class="table table-striped" data-toggle="data-table">
                  <thead>
                     <tr>
                        <th>결재양식</th>
                        <th>날짜</th>
                     </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${list }" var="f">
                     <tr>
                        <td><a href="#" onclick="return getApproval(${f.appNo});">${f.appTitle}</a>
                        <br>작성자 ${f.empName }</td>
                        <td><fmt:formatDate value="${f.appDate }" dateStyle="short"/></td>
                     </tr> 
                     </c:forEach>
                     </tbody>
               </table>
            </div>
         	</div>
         <div class="col-md-8" style = "padding: 5px; border: 1px; float:left;">
	        <form name="form" id="form" method="post" action="./approval/approve">
	        	<!-- <input type="hidden" name="_method" value="PUT"> -->
	        	<input type="hidden" name="option" id="option" value="">
	        	<input type="hidden" name="appNo" id="appNo" value="">
	            <input type="text" name="appTitle" id="appTitle" placeholder="양식 이름" readonly style="font-size: 16pt; display: inline; float: left;">
	            <table id="appro" style="padding-left: 50px; float: left; position: relative;">
	            	<tr>
		            	<th colspan="3">
		            	<div>결재 현황</div>
		            	</th>
		            	<th>
		            	최종승인
		            	</th>
	            	</tr>
	            	<tr>
			            <td><div id="approve1">
			            
			            </div></td>
			            <td><div id="approve2">
			            
			            </div></td>
			            <td><div id="approve3">
			            
			            </div></td>
			            <td rowspan="2"><div id="approvefinal">	
			            </div></td>
						</tr>
						<tr>
			            <td><div id="approve11">
			            
			            </div></td>
			            <td><div id="approve22">
			            
			            </div></td>
			            <td><div id="approve33">
			            
			            </div></td>
			            </tr>
	            	</tbody>
		            </table>
	            <div id="toolbar-container"></div>
		        <div>	
				<textarea id="appText" name="appText" placeholder="좌측에 결재 신청할 양식을 클릭해주세요"></textarea>
				</div>
		    	<script src="/ckeditor/ckeditorapprove.js"></script>
		    	
		    	<button type="button" id="btnEdit" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" disabled>결재 승인</button>
		    	<button type="button" id="btnCan" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" disabled>결재 반려</button>
	   			
	   			



	    	</form>
    	</div>
    	</div>
   		</div>
	</div>
    	<script>

		$(document).on('click', '#btnEdit', function(e){
			
			e.preventDefault();
			if(newEditor.getData() == ''){
				alert('내용을 입력하세요');
			}
			else{
				$('#modal1').modal("show");
			}
		});
		
		$(document).on('click', '#btnCan', function(e){
			
			e.preventDefault();
			if(newEditor.getData() == ''){
				alert('내용을 입력하세요');
			}
			else{
				$('#modal2').modal("show");
			}
		});
		$(document).on('click', '#btnSave', function(e){
			e.preventDefault();
			var array = new Array();
			$('input:checkbox[name=ckbox]:checked').each(function(){
				array.push(this.value);
				
			});
			$("#appAdmin1").val(array[0])
			$("#appAdmin2").val(array[1])
			$("#appAdmin3").val(array[2])
			$("#option").val("submit")

			
			
			$("#form").submit();
		});
		
		$(document).on('click', '#btnSave2', function(e){
			e.preventDefault();
			var array = new Array();
			$('input:checkbox[name=ckbox]:checked').each(function(){
				array.push(this.value);
				
			});
			$("#appAdmin1").val(array[0])
			$("#appAdmin2").val(array[1])
			$("#appAdmin3").val(array[2])
			$("#option").val("cancel")

			
			$("#form").submit();
		});
		$(document).on('click', '#btnClose', function(e){
			e.preventDefault();
			$('#modal1').modal("hide");
			document.forms['modalf'].reset();
		});
		
		function getApproval(no) {
			new Promise( (succ, fail )=> {
				$.ajax({
					type : "POST",	
					url : "approval/one/" + no,
					contentType: "application/json; charset=utf-8",
					dataType: "json"
				})
				.done(function (result){
					console.log(result)
					document.getElementById("appNo").value = result.appNo
					document.getElementById("appTitle").value = result.appTitle
					$("#btnCan").attr("disabled", false)
					$("#btnEdit").attr("disabled", false)
					newEditor.setData(result.appText)
					
					if(result.appApprove1 == null){
						var appr1 = "대기";
					}
					else if(result.appApprove1 == false){
						var appr1 = "반려";
					}
					else if(result.appApprove1 == true){
						var appr1 = "승인";
					}
					if(result.appApprove2 == null){
						var appr2 = "대기";
					}
					else if(result.appApprove2 == false){
						var appr2 = "반려";
					}
					else if(result.appApprove2 == true){
						var appr2 = "승인";
					}
					if(result.appApprove3 == null){
						var appr3 = "대기";
					}
					else if(result.appApprove3 == false){
						var appr3 = "반려";
					}
					else if(result.appApprove3 == true){
						var appr3 = "승인";
					}
					document.getElementById("approve1").innerHTML = result.appAppr1
					document.getElementById("approve11").innerHTML = appr1
					if(result.appAdmin2 != null){
						document.getElementById("approve2").innerHTML = result.appAppr2
						document.getElementById("approve22").innerHTML = appr2
					}
					else{
						document.getElementById("approve2").innerHTML = "없음"
						document.getElementById("approve22").innerHTML = ""
					}
					if(result.appAdmin3 != null){
						document.getElementById("approve3").innerHTML = result.appAppr3
						document.getElementById("approve33").innerHTML = appr3
					}
					else{
						document.getElementById("approve3").innerHTML = "없음"
						document.getElementById("approve33").innerHTML = ""
					}
					if(result.appApprovefinal == null){
						document.getElementById("approvefinal").innerHTML = "대기"
					}
					else if(result.appApprovefinal == true){
						document.getElementById("approvefinal").innerHTML = "승인"
					}
					else if(result.appApprovefinal == false){
						document.getElementById("approvefinal").innerHTML = "반려"
					}
				
					succ(result);
				})
				.fail(function(jqXHR){
					console.log("jqXHR 오류래요")
					console.log(jqXHR)
					fail(error);
				});
				
			}).then((arg) =>{
				$.ajax({
					type : "POST",
					url : "approval/oneapprove/" + no,
					contentType: "application/json; charset=utf-8",
					dataType: "json"
				})
				.done(function (result2){
					console.log(result2.length);
					let index = 1;
					let approve = null;

				})
				.fail(function(jqXHR){
					console.log("실패했어!");
				})
			});
		}



</script>

		    	<form id="modalf" method="post">
				<div class="modal fade" id="modal1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="staticBackdropLabel">해당 결재를 승인하시겠습니까?</h1>
				      </div>

				      <div class="modal-footer">
				        <button type="button" id="btnClose" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				        <button type="button" id ="btnSave" class="btn btn-primary">승인</button>
				      </div>
				    </div>
				  </div>
				</div>
	    	</form>
	    	
	    			    	<form id="modalf2" method="post">
				<div class="modal fade" id="modal2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="staticBackdropLabel">해당 결재를 반려하시겠습니까?</h1>
				      </div>

				      <div class="modal-footer">
				        <button type="button" id="btnClose" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				        <button type="button" id ="btnSave2" class="btn btn-primary">반려</button>
				      </div>
				    </div>
				  </div>
				</div>
	    	</form>
	    	
	    	
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

