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
	<script>
	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();
		$("#form").submit();
	});
	$(document).on('click', '#btnList', function(e){
		e.preventDefault();	
		location.href="./board/getBoardList";
	});
	</script>
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
		<label for="content">내용</label>	
		<textarea id="appText" name="appText" placeholder="내용을 입력해 주세요"></textarea>
		</div>
    	<script>
    	ClassicEditor
            .create( document.querySelector( '#appText' ), {
            	language: "ko",
            	fontFamily: {
            		options: [
            			'default',
            			'Arial',
            			'궁서',
            			'바탕',
            			'돋움',
            			'굴림'
            		],
            		supportAllValues: true
            	},
        		ckfinder: {
        	        uploadUrl: '/main/file/upload' // 내가 지정한 업로드 url (post로 요청감)
        		},
        		alignment: {
                    options: [ 'left', 'center', 'right' ]
                },
                mediaEmbed:{
                	previewsInData: true
                }
                
        	} )
            .then( editor => {
                const toolbarContainer = document.querySelector( '#toolbar-container' );

                toolbarContainer.appendChild( editor.ui.view.toolbar.element );
            } )
            .catch( error => {
                console.error( error );
            } );

    	</script>
		<div class="bd-example">
	        <div class="mb-3">
                <label class="form-label" for="customFile">Upload</label>
                <input type="file" class="form-control" id="customFile">
            </div>
        </div>
            
    <button type="button" id="btnSave">서브밋</button>
    </form>
</body>
</html>