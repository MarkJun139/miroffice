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
		image: {
			toolbar: [ 'imageStyle:alignBlockLeft', 'imageStyle:alignCenter', 'imageStyle:alignBlockRight', '|', 'linkImage' , 'imageTextAlternative' ]
		},
	
        mediaEmbed:{
        	previewsInData: true
        }
        
	} )
    .then( editor => {
        const toolbarContainer = document.querySelector( '#toolbar-container' );

        toolbarContainer.appendChild( editor.ui.view.toolbar.element );
        
        newEditor = editor;
    } )
    .catch( error => {
        console.error( error );
    } );
