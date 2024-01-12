<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="/ckeditor/content-styles.css" type="text/css">



<!DOCTYPE html>
<html lang="ko">
<head>
	<style>
	.ck-editor__editable {
	    min-height: 300px; }
	.ck-editor__editable p {margin: 0}
	.ck-content { font-size: 13px; }
	</style>
    <meta charset="utf-8">
    <title>버근가?</title>

</head>
<body>
<div class="card-body">
            <p>더 아름답게널안을수있게</p>
            <div class="table-responsive">
               <table id="datatable" class="table table-striped" data-toggle="data-table">
                  <thead>
                  
                     <tr>
                        <th>글제목</th>
                        <th>Position</th>
                        <th>Office</th>
                        <th>Age</th>
                        <th>Start date</th>
                        <th>Salary</th>
                     </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${list }" var="f">
                     <tr>
                        <td><a href="#" onclick="return getApproval(${f.appNo});">${f.appTitle}</a></td>
                        <td>${f.empName }</td>
                        <td><fmt:formatDate value="${f.appDate }" dateStyle="short"/></td>
                        <td>0</td>
                     </tr>
                     </c:forEach>
                  <tfoot>
                     <tr>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Office</th>
                        <th>Age</th>
                        <th>Start date</th>
                        <th>Salary</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
        <form name="form" id="form" action="approval/edit" method="post">
        	<input type="hidden" name="_method" value="PUT">
        	<input type="hidden" name="appNo" id="appNo">
            <input type="text" name="appTitle" id="appTitle">
            <div id="toolbar-container"></div>
	        <div>	
			<textarea id="appText" name="appText" placeholder="내용을 입력해 주세요"></textarea>
			</div>
	    	<script src="/ckeditor/ckeditorapprove.js"></script>
	    	
	    	<button type="button" id="btnEdit">수정</button>
   			<button type="button" id="btnList">취소</button>
    	</form>
    	<script>
		function getApproval(no) {
			$.ajax({
				type : "POST",
				url : "../admin/approval/one/" + no,
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			})
			.done(function (result){
				console.log(result)
				document.getElementById("appNo").value = result.appNo
				document.getElementById("appTitle").value = result.appTitle
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
		$(document).on('click', '#btnEdit', function(e){
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
</body>
</html>