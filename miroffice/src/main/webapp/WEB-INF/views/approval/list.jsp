<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
    <title>버근가?</title>

</head>
<body>
<div class="card-body" style="border: 1px; float:left; margin-right:50px;">
            <p>ㅁㄴㅇㄹ</p>
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
	            <div id="toolbar-container"></div>
		        <div>	
				<textarea id="appText" name="appText" placeholder="좌측에 결재 신청할 양식을 클릭해주세요"></textarea>
				</div>
		    	<script src="/ckeditor/ckeditorapprove.js"></script>
		    	
		    	<button type="button" id="btnEdit" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" disabled>결재 신청</button>
	   			<button type="button" id="btnList">취소</button>
	   			

				
				<!-- Modal -->
				<div class="modal fade" id="modal1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="staticBackdropLabel">결재자 선택(최대 3명)</h1>
				      </div>
						<div class="bd-example">
						    <div class="list-group">
						    <input type="hidden" id="appAdmin1" name="appAdmin1">
						    <input type="hidden" id="appAdmin2" name="appAdmin2">
						    <input type="hidden" id="appAdmin3" name="appAdmin3">
						    	<c:forEach items="${ulist }" var="u">
							        <label class="list-group-item">
							            <input class="form-check-input me-1" name="ckbox" type="checkbox" value="${u.empNo }">
							            ${u.empRank } ${u.empName }
							        </label>
						        </c:forEach>
						    </div>
						</div>

				      <div class="modal-footer">
				        <button type="button" id="btnClose" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				        <button type="button" id ="btnSave" class="btn btn-primary" onclick="javascript: form.action='submit'">결재 신청</button>
				      </div>
				    </div>
				  </div>
				</div>

	    	</form>
    	</div>
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
		$(document).on('click', '#btnEdit', function(e){
			
			e.preventDefault();
			if(newEditor.getData() == ''){
				alert('내용을 입력하세요');
			}
			else{
				$('#modal1').modal("show");
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
			
			$("#form").submit();
		});
		$(document).on('click', '#btnClose', function(e){
			$('#modal1').modal("hide");
		});
		$(document).ready(function(){
			$("input[type='checkbox']").on("click", function(){
				let count = $("input:checked[type='checkbox']").length;
				if(count == 0){
					$("#btnSave").attr("disabled", true)
				}
				else if(count > 0){
					$("#btnSave").attr("disabled", false)
				}
				else if(count > 3){
					this.checked=false;
					$("#btnSave").attr("disabled", false)
					alert("결재자는 3명까지만 선택할 수 있습니다.");
				}
			})
		})
</script>
</body>
</html>