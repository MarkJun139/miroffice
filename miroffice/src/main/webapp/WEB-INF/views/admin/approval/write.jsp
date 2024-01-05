<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="../../../ckeditor/translations/ko.js"></script>



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
    <script src="/ckeditor/ckeditor.js"></script>
</head>
<body>
	<form action="submit" method="post">
    <h1>Document editor</h1>

    <!-- The toolbar will be rendered in this container. -->
    <div id="toolbar-container"></div>

    <!-- This container will become the editable. -->
    <div id="editor">
        <p>글을 입력하세요!</p>
    </div>

	
    <script>
    	
    	DecoupledEditor
            .create( document.querySelector( '#editor' ), {
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
    <button type="submit" formmethod="post">서브밋</button>
    </form>
</body>
</html>