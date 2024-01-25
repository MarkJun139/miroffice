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
      
      <!-- <link rel="stylesheet" href="//cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css"/> -->
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
                     		 <h1 class="card-title">게시판</h1>
                     	</div>
                     	<div class="col-3 text-start">
                     	<h2><span class="badge badge-secondary badge-pill" style="background-color:var(--bs-info)">${deptName}</span></h2>
                     	</div>
                     	</div>
                     	</div>
                     	</div>
<!--  메인 여기부터!!! -->      

<div class="card-body" style="border: 1px; float:left; margin-right:20px;">
            
    
    <form name="form" id="form" method="post">
  <div class="mt-4 table-responsive" style="width: 1000px;">
		<table id="basic-table" class="table mb-0 table-hover" role="grid" style="width: 1000px;">
	        
        <thead>
           <tr>
        
              <th>제목</th>
              <th style="width: 10%">작성자</th>
              <th style="width: 1%">조회수</th>
              <th style="width: 5%">작성날짜</th>
           </tr>
        </thead>
        <tbody>
        <c:forEach items="${list }" var="f">
           <tr>
              <td>
              <c:if test="${f.forumNotice == true}">
              <span class="badge badge-info" style="background-color: var(--bs-info)">중요</span>
              </c:if>
              <a href="./forum/${f.forumNo }">${f.forumTitle} 
              <c:if test="${f.commentCount > 0}">
              <p style="display: inline; color: skyblue;">(${f.commentCount })</p>
              </c:if>
              </a></td>
              <td>${f.empRank } ${f.empName }</td>
              <td>${f.forumCount }</td>
              <td><fmt:formatDate value="${f.forumDate }" dateStyle="short" type="both" timeStyle="short"/></td>
           </tr>
           </c:forEach>
        </tbody>

     </table>

	<button type="button" onclick="location.href='./forum/write'" id="fwrite" class="btn btn-success">글쓰기</button>

	
  </div>
          </form>
</div>






      <!-- 메인 여기까지 -->
</div>
</div>

<!-- Footer Section Start -->
      <%@include file = "../footer.jsp" %>
      <!-- Footer Section End -->    </main>
      <%@include file = "../setting.jsp" %>
    
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>

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


      function getApproval(no) {
        $.ajax({
          type : "GET",	
          url : "./forum/one/" + no,
          contentType: "application/json; charset=utf-8",
          dataType: "json"
        })
        .done(function (result){
          console.log(result)
          document.getElementById("appNo").value = result.appNo
          document.getElementById("appTitle").value = result.appTitle
          $("#btnSave").attr("disabled", true)
          $("#btnEdit").attr("disabled", false)
          newEditor.setData(result.appText)
        })
        .fail(function(jqXHR){
          console.log("jqXHR 오류래요")
          console.log(jqXHR)
        })
        .always(function(){
          console.log(no);
        })
      }
    
      <!-- sidebar 버튼 클릭 시 sidebar 활성화 -->
      $(function(){
         $('#datatable2').removeAttr('width').DataTable({
          aaSorting: [],
          lengthMenu: [10, 30],
          order : [[ 3, "desc" ]],
          destroy : true,
          autoWidth: false,
          columnDefs: [
        	  {width: 400, targets: 0},
        	  {width: 200, targets: 1},
        	  {width: 200, targets: 2},
        	  {width: 200, targets: 3}
          ]

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
