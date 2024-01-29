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
                     	<div class="col-5 text-start">
                     	</div>
                     	<div class="col-4 text-start" align="right" style="float: right;">
                    		<form method="get">
	                     		<select name="type" id="type">
	                     			<option value="forum_title">제목</option>
	                     			<option value="forum_text">내용</option>
	                     		</select>
	                     		<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" style="width: 50%; height: 23px;">
	                     		<button type="submit" style="height: 25px;">검색</button>
                     		</form>
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

              <th style="width: 5%">부서</th>        
              <th>제목</th>
              <th style="width: 10%">작성자</th>
              <th style="width: 1%">조회수</th>
              <th style="width: 5%">작성날짜</th>
              <th style="width: 5%">파일</th>
           </tr>
        </thead>
        <tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="6" class="text-center">
					<h3>등록된 게시글이 없습니다</h3>
				</td>
			</tr>
		</c:if>
        <c:forEach items="${list }" var="f">
        
           <tr>
           	  <td>${f.deptName }</td>
              <td>
              <c:if test="${f.forumNotice == true}">
              <span class="badge badge-info" style="background-color: var(--bs-info)">공지</span>
              </c:if>
              <a href="./forum/${f.forumNo }">${f.forumTitle} 
              <c:if test="${f.commentCount > 0}">
              <p style="display: inline; color: skyblue;">(${f.commentCount })</p>
              </c:if>
              </a></td>
              <td>${f.empName } ${f.empRank }</td>
              <td>${f.forumCount }</td>
              <td><fmt:formatDate value="${f.forumDate }" dateStyle="short" type="both" timeStyle="short"/></td>
              <td>
              															<c:if test="${not empty f.forumFiles}">
																<i class="icon"> <svg class="icon-20" width="20"
																		viewBox="0 0 24 24" fill="none"
																		xmlns="http://www.w3.org/2000/svg">
			                                    <path opacity="0.4"
																			d="M16.191 2H7.81C4.77 2 3 3.78 3 6.83V17.16C3 20.26 4.77 22 7.81 22H16.191C19.28 22 21 20.26 21 17.16V6.83C21 3.78 19.28 2 16.191 2Z"
																			fill="currentColor"></path>
			                                    <path fill-rule="evenodd"
																			clip-rule="evenodd"
																			d="M8.07996 6.6499V6.6599C7.64896 6.6599 7.29996 7.0099 7.29996 7.4399C7.29996 7.8699 7.64896 8.2199 8.07996 8.2199H11.069C11.5 8.2199 11.85 7.8699 11.85 7.4289C11.85 6.9999 11.5 6.6499 11.069 6.6499H8.07996ZM15.92 12.7399H8.07996C7.64896 12.7399 7.29996 12.3899 7.29996 11.9599C7.29996 11.5299 7.64896 11.1789 8.07996 11.1789H15.92C16.35 11.1789 16.7 11.5299 16.7 11.9599C16.7 12.3899 16.35 12.7399 15.92 12.7399ZM15.92 17.3099H8.07996C7.77996 17.3499 7.48996 17.1999 7.32996 16.9499C7.16996 16.6899 7.16996 16.3599 7.32996 16.1099C7.48996 15.8499 7.77996 15.7099 8.07996 15.7399H15.92C16.319 15.7799 16.62 16.1199 16.62 16.5299C16.62 16.9289 16.319 17.2699 15.92 17.3099Z"
																			fill="currentColor"></path>


			                                </svg>
																</i>
															</c:if>
				</td>
           </tr>
           </c:forEach>
        </tbody>

     </table>

	<button type="button" onclick="location.href='./forum/write'" id="fwrite" class="btn btn-success" style="float: left;">글쓰기</button>
	
	        <div class="bd-example" style="float:left; margin-left: 25%;">
            <nav aria-label="Another pagination example">
                <ul class="pagination pagination-sm flex-wrap">
                	<c:if test="${page == 1}">
	                    <li class="page-item disabled">
	                        <a class="page-link" href="./forum?page=${page-1 }" tabindex="-1">이전</a>
	                    </li>
	                </c:if>
					<c:if test="${page != 1}">
	                    <li class="page-item">
	                        <a class="page-link" href="./forum?page=${page-1 }" tabindex="-1">이전</a>
	                    </li>
	                    
	                    <li class="page-item"><a class="page-link" href="./forumadmin?page=${page-1 }">${page-1 }</a></li>
                    </c:if>
                    <li class="page-item active" aria-current="page">
                        <a class="page-link">${page }</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="./forumadmin?page=${page+1 }">${page+1 }</a></li>
                    <li class="page-item">
                        <a class="page-link" href="./forumadmin?page=${page+1 }">다음</a>
                    </li>
                </ul>
            </nav>
        </div>
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
