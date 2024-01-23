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
            	<form name="form" id="form" action="write" method="post">
    	<tr> 
    	<h2>
			<td class="orange">문서명</td>
			<td><input name="appTitle" id="appTitle" size="40" width="60"/></td>
			</h2>
		</tr>

    <!-- The toolbar will be rendered in this container. -->
    <div id="toolbar-container"></div>

    <!-- This container will become the editable. -->
    <div>	
		<textarea id="appText" name="appText" placeholder="내용을 입력해 주세요"></textarea>
	</div>
    	<script src="/ckeditor/ckeditorapprove.js"></script>
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
</div>
    <script>
	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();
		
		if(document.getElementById('appTitle').value == ''){
			alert('제목을 입력하세요');
		}
		else if(newEditor.getData() == ''){
			alert('내용을 입력하세요');
		}
		else{
			<!--e.preventDefault();-->
			$("#form").submit();
		}
	});
	$(document).on('click', '#btnList', function(e){
		e.preventDefault();	
		location.href="../approval";
	});
	</script>


     
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

