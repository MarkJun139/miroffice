<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="/ckeditor/ckeditor.js"></script>
<script src="../../../ckeditor/translations/ko.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>



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
            
    <button type="button" id="btnSave">서브밋</button>
    <button type="button" id="btnList">취소</button>
    </form>
    
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
</body>
</html>