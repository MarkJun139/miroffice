<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>개인 일정</title>
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
<link rel="stylesheet" href="/css/dark.min.css" />

<!-- Customizer Css -->
<link rel="stylesheet" href="/css/customizer.min.css" />

<!-- RTL Css -->
<link rel="stylesheet" href="/css/rtl.min.css" />
<!-- fullcalendar CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 부트 스트랩 CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
	crossorigin="anonymous"></script>
<!-- 캘린더 스타일 시트-->
<link rel="stylesheet" href="/css/calendar.css">

</head>

<body class="  ">
	<%@include file="../sidebar.jsp"%>

	<main class="main-content">

		<div class="position-relative iq-banner">
			<!--Nav Start-->

			<%@include file="../header.jsp"%>
			<!--Nav End -->
		</div>

		<div class="conatiner-fluid content-inner mt-n5 py-0">

			<div class="overflow-hidden card" data-aos="fade-up"
				data-aos-delay="100" style="overflow-x: auto">
				<div class="flex-wrap card-header d-flex justify-content-between">
					<div class="header-title col-12">
						<div class="col-12 row text-center align-items-center">
							<div class="col-3 text-start">
								<h1 class="card-title">개인 일정</h1>
							</div>
							<div class="col-3 text-start">
								<h2>
									<span class="badge badge-secondary badge-pill"
										style="background-color: var(--bs-info)">${deptName}</span>
								</h2>
							</div>
						</div>
					</div>
				</div>
				<!--  메인 여기부터!!! -->
				<!-- 캘린더 영역 -->
				<div id="calendar"></div>
			</div>
		</div>
		<!-- Footer Section Start -->
		<%@include file="../footer.jsp"%>
		<!-- Footer Section End -->
	</main>
	<%@include file="../setting.jsp"%>


	<!-- Library Bundle Script -->
	<script src="/js/core/libs.min.js"></script>

	<!-- External Library Bundle Script -->
	<script src="/js/core/external.min.js"></script>

	<!-- Widgetchart Script -->
	<script src="/js/charts/widgetcharts.js"></script>

	<!-- mapchart Script -->
	<script src="/js/charts/vectore-chart.js"></script>
	<script src="/js/charts/dashboard.js"></script>

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
	<!-- 일정 추가 modal -->
	<div class="modal fade" id="scheduleInsert" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정 입력</h5>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="taskId" class="col-form-label">일정 제목</label> <input
							type="text" class="form-control" id="schedule_title"
							name="schedule_title"> <label for="taskId"
							class="col-form-label">시작 날짜</label> <input type="date"
							class="form-control" id="schedule_start" name="schedule_start">
						<label for="taskId" class="col-form-label">종료 날짜</label> <input
							type="date" class="form-control" id="schedule_end"
							name="schedule_end"> <label for="taskId"
							class="col-form-label">일정 종류</label> <select class="form-control"
							id="schedule_type" name="schedule_type">
							<option value="red">출장</option>
							<option value="green">휴가</option>
							<option value="blue">기타</option>
						</select> <label for="taskId" class="col-form-label">종일</label> <input
							type="checkbox" id="schedule_allDay" name="schedule_allDay" checked>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="insertSchedule">추가</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 일정 수정, 삭제 modal -->
	<div class="modal fade" id="updateAndDeleteModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정 수정, 삭제</h5>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="taskId" class="col-form-label">일정 제목</label> <input
							type="text" class="form-control" id="update_schedule_title"
							name="update_schedule_title"> <label for="taskId"
							class="col-form-label">시작 날짜</label> <input type="date"
							class="form-control" id="update_schedule_start"
							name="update_schedule_start"> <label for="taskId"
							class="col-form-label">종료 날짜</label> <input type="date"
							class="form-control" id="update_schedule_end"
							name="update_schedule_end"> <label for="taskId"
							class="col-form-label">일정 종류</label> <select class="form-control"
							id="update_schedule_type" name="update_schedule_type">
							<option value="red">출장</option>
							<option value="green">휴가</option>
							<option value="blue">기타</option>
						</select> <label for="taskId" class="col-form-label">종일</label> <input
							type="checkbox" id="update_schedule_allDay"
							name="update_schedule_allDay">
					</div>
				</div>
				<div class="modal-footer d-flex bd-highlight mb-3">
					<button type="button" class="btn btn-danger me-auto"
						id="deleteSchedule">삭제</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="updateSchedule">수정</button>
				</div>
			</div>
		</div>
	</div>
	<!-- sidebar 버튼 클릭 시 sidebar 활성화 -->
	<script>
	var url= window.location.href;
	$(".nav-item").find('a').each(function() {
		var burl = $(this).prop('href')
		var burl2 = burl+"#"
		if(url == burl || url == burl2){
    		// console.log($(this).prop('pathname'))
			// console.log($(this).prop('href'))
    		$(this).toggleClass('active', $(this).attr('href'));
		}

	})
	
    </script>
</body>
<script>
	document.addEventListener('DOMContentLoaded', function() {

		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth', // 기본 캘린더 화면 설정
			googleCalendarApiKey : "AIzaSyBpMyNtSvjNNfYRuohKu6TU7K_dUMJuPuc", // googleAPIKEY
			eventSources : [ {
				googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com', // GoogleCalendarID
				color : '#F15F5F',
				className : "kor-holiday"
			} ],
			fixedWeekCount: false, // 마지막 날이 포함된 주 까지만 나타남
			dayCellContent : function(e) { // OO'일' 제거
				e.dayNumberText = e.dayNumberText.replace("일", "");
			},
			height : '700px', // calendar 높이 설정
			expandRows : true, // 화면에 맞게 높이 재설정
			slotMinTime : '08:00', // Day 캘린더에서 시작 시간
			slotMaxTime : '20:00', // Day 캘린더에서 종료 시간
			locale: "ko", // 언어 설정
			navLinks : true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
			selectable : true, // 달력 일자 드래그 설정가능
			nowIndicator : true, // 현재 시간 마크
			dayMaxEvents : true, // 이벤트가 오버되면 + 몇 개식으로 표현
			droppable: true, // 일정 드래그 앤 드롭
			editable: true, // droppable 작동 하기 위해 필요
			customButtons: {
				dept: {
			      text: '부서',
			      click: function() {
			        location.href='/main/schedule/dept';
			      }
				}
			},
			headerToolbar : { // 헤더에 표시할 툴바
				left : 'today dept',
				center : 'prev title next',
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
             select: function (data) { // 일정 추가
            	 $('#scheduleInsert').on('shown.bs.modal', function (e) {
            		// 기본값 설정
             		$(this).find('.form-control')[0].value = '';
             		$(this).find('.form-control')[1].value = data.startStr;
             		$(this).find('.form-control')[2].value = data.endStr;
             		$(this).find('.form-control')[3].value = 'red';
                 })
                 insert = 0;
            	 
                 $("#scheduleInsert").modal("show"); // modal 나타내기      
                
                 $("#insertSchedule").on("click",function(){  // modal의 추가 버튼 클릭 시
                	 var tf = $("input:checkbox[id='schedule_allDay']").is(":checked");
                     // console.log(tf);
                	 insert++;
                 
                	 if(insert == 1){	 
                	 var day = $('#update_schedule_allDay').is(":checked");
                     var title = $("#schedule_title").val();
                     var start_date = $("#schedule_start").val();
                     var end_date = $("#schedule_end").val();
                     var all_day = tf;
                     var color = $("#schedule_type").val();
                     calendar.addEvent({ // fullcalendar에 이벤트 추가
                    	 title : title,
                    	 start : start_date,
                    	 end : end_date,
                    	 allDay : all_day,
                    	 color : color,
                     })

                 $(function saveData(sdata) { // DB에 이벤트 저장
                     $.ajax({
                		 cache:"false",
                         url: "/main/schedule/insert", 
                         method: "post",
                         dataType: "text",
                         data: {
                        	 "title": title,
                        	 "start": start_date,
                        	 "end": end_date,
                        	 "allDay": all_day,
                        	 "color" : color
                        	 }
                     })
                         .done(function (result) {
                             alert("일정을 등록하였습니다.");
                             $("#scheduleInsert").modal("hide");
                             location.reload();
                         })
                         .fail(function (request, status, error) {
                              alert("일정 등록에 실패하였습니다." + error);
                              $("#scheduleInsert").modal("hide");
                              location.reload();
                         })
                	 
                     calendar.unselect()
               	  })
                	 }
                 })
             },
             eventClick : function (info) { // 일정 클릭 시
            	 // console.log(info.event._def.extendedProps);
            	 $('#updateAndDeleteModal').on('shown.bs.modal', function (e) {           		
              		$(this).find('.form-control')[0].value = info.event._def.title;
               		$(this).find('.form-control')[1].value = info.event.startStr;
               		$(this).find('.form-control')[2].value = info.event.endStr;
               		$(this).find('.form-control')[3].value = info.event.backgroundColor;
                		if(info.event.allDay == true){
               			$('#update_schedule_allDay').prop("checked", true)
                   } else {
                	   $('#update_schedule_allDay').prop("checked", false)
                   }
             	 })
                 $("#updateAndDeleteModal").modal("show"); // modal 나타내기
				
                 $("#updateSchedule").on("click",function(){  // modal의 수정 버튼 클릭 시
                     if(confirm("일정을 변경하시겠습니까?")){
                     }
                     
                     var title = $("#update_schedule_title").val();
                     var start_date = $("#update_schedule_start").val();
                     var end_date = $("#update_schedule_end").val();
                     var all_day = info.event.allDay;
                     var sche_no = info.event._def.extendedProps.sche_no;
                     var color = $("#update_schedule_type").val();

                     console.log(info);
                     $(function updateData() {
                         $.ajax({
                        	 cache:"false",
                             url: "/main/schedule/update",
                             method: "PATCH",
                             dataType: "text",
                             data: {"title": title,
                         	 	"start": start_date,
                        	 	"end": end_date,
                        	 	"allDay" : all_day,
                        	 	"scheNo" : sche_no,
                        	 	"color" : color},
                         })
                             .done(function (result) {
                             alert("일정을 수정하였습니다.");
                             $("#updateAndDeleteModal").modal("hide");
                             location.reload();
                     })
                              .fail(function (result, status, error) {
                              alert("일정을 수정하지 못했습니다." + error);
                              $("#updateAndDeleteModal").modal("hide");
                              location.reload();
                         })
                    })
                 });
                 
                  $("#deleteSchedule").on("click",function(){  // modal의 삭제 버튼 클릭 시
                	 console.log(info.event._def.extendedProps);
                     if(confirm("일정을 삭제하시겠습니까?")){
                     }
                  	  let sche_no = info.event._def.extendedProps.sche_no;

                  	 $(function deleteData(){
                  		 $.ajax({
                  			 cache:"false",
                  			 url: "/main/schedule/delete",
                  			 method: "delete",
                  			 dataType: "text",
                  			 data : {"scheNo" : sche_no}
                         })
                     
                             .done(function (result) {
                             alert("일정을 삭제하였습니다.");
                             $("#updateAndDeleteModal").modal("hide");
                             location.reload();
                         })
                              .fail(function (result, status, error) {
                              alert("일정을 수정하지 못했습니다." + error);
                              $("#updateAndDeleteModal").modal("hide");
                              location.reload();
                         	})
                  	})
                 })
             },
			events : ${schedule}, // DB에 저장되어 있는 일정 불러오기
		});
		calendar.render();
	});
</script>
</html>
