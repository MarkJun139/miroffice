<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/ckeditor/content-styles.css" type="text/css">

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


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
    <title>내가 신청한 결재양식</title>

</head>
<body>
<div class="card-body" style="border: 1px; float:left; margin-right:50px;">
            <p>나의</p>
            <div class="table-responsive">
               <table id="datatable" class="table table-striped" data-toggle="data-table">
                  <thead>
                     <tr>
                        <th>결재양식</th>
                     </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${list }" var="f">
                     <tr>
                        <td><a href="#" onclick="return getApproval(${f.appNo});">${f.appTitle}</a></td>
                        <td>${f.empName }</td>
                        <td><fmt:formatDate value="${f.appDate }" dateStyle="short"/></td>
                     </tr> 
                     </c:forEach>
               </table>
            </div>
         </div>
         <div style = "max-width: 1000px; min-width: 500px; border: 1px; float:left;">
	        <form name="form" id="form" method="post">
	        	<!-- <input type="hidden" name="_method" value="PUT"> -->
	        	<input type="hidden" name="appNo" id="appNo" value="">
	            <input type="text" name="appTitle" id="appTitle" placeholder="양식 이름" readonly style="font-size: 16pt;">
	            <input type="text" id="approve1" readonly>
	            <input type="text" id="approve2" readonly>
	            <input type="text" id="approve3" readonly>
	            <div id="toolbar-container"></div>
		        <div>	
				<textarea id="appText" name="appText" placeholder="좌측에 결재 신청할 양식을 클릭해주세요"></textarea>
				</div>
		    	<script src="/ckeditor/ckeditorapprove.js"></script>
		    	
		    	<button type="button" id="btnEdit" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" disabled>결재 신청</button>
	   			<button type="button" id="btnList">취소</button>
	   			



	    	</form>
    	</div>
    	<script>
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
					$("#btnSave").attr("disabled", true)
					$("#btnEdit").attr("disabled", false)
					newEditor.setData(result.appText)
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
					result2.forEach(function(string){
						if(string.empApprove==true)
							approve = "승인"
						if(string.empApprove==false)
							approve = "거절"
						if(string.empApprove==null)
							approve = "미승인";
						if(index == 1)
							document.getElementById("approve1").value = string.empRank + " " + string.empName + " "+ approve 
						if(index == 2)
							document.getElementById("approve2").value = string.empRank + " " + string.empName + " "+ approve
						if(index == 3)
							document.getElementById("approve3").value = string.empRank + " " + string.empName + " "+ approve
						console.log(string.empName)
						index++
					})
				})
				.fail(function(jqXHR){
					console.log("실패했어!");
				})
			});
		}


</script>
</body>
</html>