<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix ="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/ckeditor/editor-style.css" type="text/css">
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
     <c:set var="userName" value="${pageContext.request.userPrincipal.name}" />
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
            
    
         <div class="col-md-6" style = "padding: 5px; border: 1px">
	        <form name="form" id="form" method="post" style="min-width: 1000px;">

                        <p><h3>${list.forumTitle}</h3></p>
                        <div>
                        <image src="/images${list.empPhoto }"
                        alt="User-Profile" class="theme-color-default-img img-fluid avatar avatar-50 avatar-rounded" style="object-fit:cover">
                        <b style="color: black; position: relative; bottom: 10px; display: inline;">
                        ${list.empName } ${list.empRank } </b>
                        <p style="position: relative; top: 10px; right: 88px; display: inline; text-align: left;"><fmt:formatDate value="${list.forumDate }" pattern="yy.MM.dd HH:mm"/> &nbsp &nbsp 조회수 ${list.forumCount }</p>
                        </div>
                        

						<textarea id="forumText" name="forumText">${list.forumText }</textarea>
						<script src="${pageContext.request.contextPath }/ckeditor/ckeditorforumone.js"></script>
						
						<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_TEAMLEADER')">
							<div id="action" style="display: none">
							<button type="submit" id="fedit" class="btn btn-light" onclick="javascript: form.action='/main/forum/edit/${list.forumNo}'">수정</button>
							<button type="button" id="fdelete" class="btn btn-light">삭제</button>
							<button type="button" id="flist" class="btn btn-light" style="float: right;">목록</button>
							
							</div>
                    	</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
						<button type="button" id="fadmindelete" class="btn btn-light">삭제</button>
                    	</sec:authorize>
                    	

                    	<div style="margin-top: 2em; border-top-style: solid; border-top-color: lightgreen;">
                    	<p style="font-size: 20px; color: black;">댓글</p>
                    	<div id="commentlist">
                    	<c:forEach items="${clist }" var="f">
                    	<br><div id="comment" style = "border-bottom-style: solid; border-bottom-color: lightgray; border-bottom-width: .1px">
                    		
                    	<image src="/images${f.empPhoto }"
                        alt="User-Profile" class="theme-color-default-img img-fluid avatar avatar-50 avatar-rounded" style="object-fit:cover">
                    		
                    		<b style="padding-left: 5px; color: black;">${f.empName } ${f.empRank }</b>
                    		<div id="deletebt">
                    			<input type="hidden" value=${f.commentNo }>
	                      		<c:choose>
	                    		<c:when test="${userName == f.empNo}">
	                    			<button type="button" id="cdelete" class="btn btn-light" style="float: right;" onclick="return commentDelete(${f.commentNo})">삭제</button>
	                    		</c:when>
	                    		</c:choose>
                    		</div>
                    		<div id="editbt">
                    			<input type="hidden" value=${f.commentNo }>
	                    		<c:choose>
			                   		<c:when test="${userName == f.empNo}">
			                   			<button type="button" id="cedit" class="btn btn-light" style="float: right;" onclick="return commentEdits(${f.commentNo})">수정</button>
			                   		</c:when>
	                    		</c:choose>
                    		</div>
                    		<div id="cancelbt" style="display: none;">
                    			<input type="hidden" value=${f.commentNo }>
	                      		<c:choose>
	                    		<c:when test="${userName == f.empNo}">
	                    			<button type="button" id="cdelete" class="btn btn-light" style="float: right;" onclick="return commentCancel(${f.commentNo})">취소</button>
	                    		</c:when>
	                    		</c:choose>
                    		</div>
                    		<div id="perfectbt" style="display: none;">
                    			<input type="hidden" value=${f.commentNo }>
	                    		<c:choose>
			                   		<c:when test="${userName == f.empNo}">
			                   			<button type="button" id="cedit" class="btn btn-light" style="float: right;" onclick="return commentPerfect(${f.commentNo})">완료</button>
			                   		</c:when>
	                    		</c:choose>
                    		</div>
                    		<div id="editdiv" style="display: none;">
                    			<input type="hidden" value=${f.commentNo }>
                    			<textarea style="width: 700px;" id="commentEdit" name="commentEdit">${f.commentText }</textarea>
                    		</div>
                    		<div id="readdiv">
                    			<input type="hidden" value=${f.commentNo }>
                    			<p style="padding-left: 60px; margin-top: .3em; color: black;">
                 				${f.commentText }</p>
                 			</div>
                    		<p style="padding-left: 60px; margin-top: .5em; display: inline;">
                    		<fmt:formatDate value="${f.commentDate }" pattern="yy.MM.dd HH:mm"/></p>
                    		</div>
                    	</c:forEach>
                    	</div>
                    	</div>
                    	
	        
	    	</form>
	    	<form method="post" name="form2" id="form2">
	    	<div>
	    	<b style="padding-left: 5px; color: black;">${list.empName } ${list.empRank }</b>
	    	<input type="hidden" id="empNo" name="empNo" value="${list.empNo }">
	    	<input type="hidden" id="forumNo" name="forumNo" value="${list.forumNo }">
	    	<textarea id="commentText" name="commentText" placeholder="댓글을 입력하세요!" style="width: 1000px; height: 100px;"></textarea>
	    	<button type="button" id="cwrite" class="btn btn-success" onclick="return commentWrite()">댓글쓰기</button>
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


	
	function commentWrite() {
		if(document.getElementById('commentText').value == ''){
			alert('댓글 내용을 입력하세요');
		}
		else{
			var submitObj = new Object();
			submitObj.empNo = $('#empNo').val();
			submitObj.forumNo = $('#forumNo').val();
			submitObj.commentText = $('#commentText').val();
			$.ajax({
				type : "POST",	
				url : "../comment/write",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify(submitObj)
			})
			.done(function (result){
				console.log(result)
				/* var htmls = $('#comment').html(); */
	
				/* $('#comment').html(htmls); */
				/* $('#comment'.html(location.href)) */
				/* $('#comment').replaceWith(location.href + ' :: #comment'); */
				
				/* $('#comment').children().remove();*/
				$('#commentlist').load(location.href + ' #commentlist');
			})
			.fail(function(jqXHR){
				console.log("jqXHR 오류래요")
				console.log(jqXHR)
			})
		}
	}

	
	function commentEditWrite() {
		if(document.getElementById('commentText').value == ''){
			alert('댓글 내용을 입력하세요');
		}
		else{
			var submitObj = new Object();
			submitObj.empNo = $('#empNo').val();
			submitObj.forumNo = $('#forumNo').val();
			submitObj.commentText = $('#commentText').val();
			$.ajax({
				type : "POST",	
				url : "../comment/write",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify(submitObj)
			})
			.done(function (result){
				console.log(result)
				/* var htmls = $('#comment').html(); */
	
				/* $('#comment').html(htmls); */
				/* $('#comment'.html(location.href)) */
				/* $('#comment').replaceWith(location.href + ' :: #comment'); */
				
				/* $('#comment').children().remove();*/
				$('#commentlist').load(location.href + ' #commentlist');
			})
			.fail(function(jqXHR){
				console.log("jqXHR 오류래요")
				console.log(jqXHR)
			})
		}
	}

	function commentEdits(no){
		$('#readdiv input').each(function(){
			if($(this).val() == no){
				$(this).parent().css("display", "none");
				$('#editdiv input').each(function(){
					if($(this).val() == no){
						$(this).parent().css("display", "");
						
						
						$('#canceldiv input').each(function(){
							if($(this).val() == no){
								#(this).parent().css("display", "")
							}
						})
						
						
					}
				})
			}
		})

		
	}
	
	function commentDelete(commentno) {
		var no = commentno;
		var no2 = $('#forumNo').val();
		$.ajax({
			type : "POST",	
			url : "../comment/delete",
			data: { "id": no, "fid": no2 }
		})
		.done(function (result){
			console.log(result)
			/* var htmls = $('#comment').html(); */

			/* $('#comment').html(htmls); */
			/* $('#comment'.html(location.href)) */
			/* $('#comment').replaceWith(location.href + ' :: #comment'); */
			
			/* $('#comment').children().remove();*/
			$('#commentlist').load(location.href + ' #commentlist');
		})
		.fail(function(jqXHR){
			console.log("jqXHR 오류래요")
			console.log(jqXHR)
		})
	
	}
	
	
	
	function forumEdit(no) {
		var suc;
		$.ajax({
			type : "POST",	
			url : "../forum/edit/" + no,
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		})
		.done(function (result){
			console.log(result)
			/* document.getElementById("forumText").value = result.forumText
			document.getElementById("forumTitle").value = result.forumTitle
			$("#btnSave").attr("disabled", true)
			$("#btnEdit").attr("disabled", false) */
			newEditor.setData(result.forumText)
		})
		.fail(function(jqXHR){
			console.log("jqXHR 오류래요")
			console.log(jqXHR)
		});
			
	}
	

	

      
      var url= window.location.href;
      $(".nav-item").find('a').each(function() {
        var burl = $(this).prop('href')
        var burl2 = burl+"#"
        if(url.match(burl) || url.match(burl2)){
            console.log(url);
            console.log($(this).prop('href'))
            $(this).toggleClass('active', $(this).attr('href'));
        }
    
      })
      $(document).ready(function(){
    	  var player = '<sec:authentication property="principal.username"/>';
    	  
    	  if(${list.empNo} == player){
    		  
    		  document.getElementById("action").style.display = "";
    	  }
      })
      
      </script>


  </body>
</html>
