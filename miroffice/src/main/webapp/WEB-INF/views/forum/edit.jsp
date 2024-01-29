<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                              	 	<div class="col-3 text-start">
                     		 <h1 class="card-title">글쓰기</h1>
                     	</div>
                     	<div class="col-3 text-start">
                     	<h2><span class="badge badge-secondary badge-pill" style="background-color:var(--bs-info)">${deptName}</span></h2>
                     	</div>
                     	</div>
                     	</div>
                     	</div>
<!--  메인 여기부터!!! -->      

<form name="form" id="form" action="../edit" method="post" enctype="multipart/form-data">
		<input type="hidden" id="empNo" name="empNo" value="${pageContext.request.userPrincipal.name}"/>
		<input type="hidden" id="forumNo" name="forumNo" value="${list.forumNo }"/>
		<input type="hidden" id="forumNotice" name="forumNotice" value="${list.forumNotice }"/>
		<input type="hidden" id="forumOfiles" name="forumOfiles" value="${list.forumOfiles }"/>
		<input type="hidden" id="forumFiles" name="forumFiles" value="${list.forumFiles }"/>
		
		
		<div class="container" style="height: 60px;">
		<div style="display: inline; float: right;">
	
	        <div class="mb-3">
                <input type="file" class="form-control" id="files" name="files">
                		<c:if test="${list.forumOfiles != null}">


			<br>기존파일 : ${list.forumOfiles }
					
		</c:if>
            </div>

		</div>
		
		
		<div style="display: inline; float: left;">
    	<h2>
			<input name="forumTitle" id="forumTitle" size="33" width="30" style="font-size: 30" value="${list.forumTitle }">
			
			</h2>
			<sec:authentication property = "principal.users.empRole" var="role"/>
	            <c:if test="${role == 'ROLE_TEAMLEADER'}">
				<label><input class="form-check-input me-1" id="ckbox" type="checkbox" value="${list.forumNotice }">공지 올리기</label>
			</c:if>
		</div>

	</div>


    <!-- The toolbar will be rendered in this container. -->
    <div id="toolbar-container"></div>

    <!-- This container will become the editable. -->
    <div>	
		<textarea id="forumText" name="forumText" placeholder="내용을 입력해 주세요" value=${list.forumText }</textarea>
	</div>
    	<script src="/ckeditor/ckeditorforum.js"></script>
		<!--
		<div class="bd-example">
	        <div class="mb-3">
                <label class="form-label" for="customFile">Upload</label>
                <input type="file" class="form-control" id="customFile">
            </div>
        </div>
        -->
            
    <button type="button" id="btnSave">완료</button>
    <button type="button" id="btnList">취소</button>
    </form>
    
    <script>

    var checklist; 

	
	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();
		
		if(document.getElementById('forumTitle').value == ''){
			alert('제목을 입력하세요');
		}
		else if(newEditor.getData() == ''){
			alert('내용을 입력하세요');
		}
		else{
			<!--e.preventDefault();-->
			document.getElementById("forumNotice").value = checklist;
			$("#form").submit();
		}
	});
	$(document).on('click', '#btnList', function(e){
		e.preventDefault();	
		location.href="../approval";
	});

    $(document).ready(function(){
    	  var x = $('#forumNotice').val()
    	  checklist = x
    	  if(x == 'true'){
    	  	$('#ckbox').prop('checked', true);
    	  }
  		  $("input[type='checkbox']").on("click", function(){
  			  if($('#ckbox').is(":checked")==true){
  				checklist = true;  
  			  }
  			  else if($('#ckbox').is(":checked")==false){
  				  checklist = false;
  			  }
  		  })
      })
      
	

    
      
	</script>





      <!-- 메인 여기까지 -->
</div>
</div>

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

      <!-- sidebar 버튼 클릭 시 sidebar 활성화 -->
      $(function(){
         $('#datatable2').dataTable({
          aaSorting: [],
          lengthMenu: [10, 30],
          order : [[ 3, "desc" ]],
          destroy : true
         });
        });
      
      
      var url= window.location.href;
      $(".nav-item").find('a').each(function() {
        var burl = $(this).prop('href')
        var burl2 = burl+"#"
        if(url == burl || url == burl2){
            console.log(url);
          console.log($(this).prop('href'))
            $(this).toggleClass('active', $(this).attr('href'));
        }
    
      })
    
      
      </script>


  </body>
</html>
