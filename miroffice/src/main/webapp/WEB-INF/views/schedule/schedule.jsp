<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>미르오피스</title>

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
<meta charset='utf-8' />
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
<body>
	<script type="text/javascript">
    function inputValueChange(){
        var inputValue = document.getElementById('inputValue').value;
        console.log(inputValue)
    }
    </script>
	<div id="calendarBox">
		<div id="calendar"></div>
	</div>
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
							type="text" class="form-control" id="calendar_content"
							name="calendar_content"> <label for="taskId"
							class="col-form-label">시작 날짜</label> <input type="date"
							class="form-control" id="calendar_start_date"
							name="calendar_start_date" value="$('#startStr')"> <label
							for="taskId" class="col-form-label">종료 날짜</label> <input
							type="date" class="form-control" id="calendar_end_date"
							name="calendar_end_date"> <label for="taskId"
							class="col-form-label">하루 종일</label> <input type="checkbox"
							id="calendar_allDay" name="calendar_allDay">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="addCalendar">추가</button>
				</div>
			</div>
		</div>
	</div>
		<!-- 일정 수정, 삭제 modal -->
	<div class="modal fade" id="updateAndDeleteModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정 수정 & 삭제</h5>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="taskId" class="col-form-label">일정 제목</label> <input
							type="text" class="form-control" id="calendar_content"
							name="calendar_content"> <label for="taskId"
							class="col-form-label">시작 날짜</label> <input type="date"
							class="form-control" id="calendar_start_date"
							name="calendar_start_date" value="$('#startStr')"> <label
							for="taskId" class="col-form-label">종료 날짜</label> <input
							type="date" class="form-control" id="calendar_end_date"
							name="calendar_end_date"> <label for="taskId"
							class="col-form-label">하루 종일</label> <input type="checkbox"
							id="calendar_allDay" name="calendar_allDay">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="updateSchedule">추가</button>
					<button type="button" class="btn btn-primary" id="deleteSchedule">삭제</button>
				</div>
			</div>
		</div>
	</div>
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
			headerToolbar : { // 헤더에 표시할 툴바
				left : 'today',
				center : 'prev title next',
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
             select: function () { // 일정 추가
                 $("#scheduleInsert").modal("show"); // modal 나타내기

                 $("#insertSchedule").on("click",function(){  // modal의 추가 버튼 클릭 시
                     var content = $("#calendar_content").val();
                     var start_date = $("#calendar_start_date").val();
                     var end_date = $("#calendar_end_date").val();
                     var all_day = $("#calendar_allDay").val();
                     
                     calendar.addEvent({
                    	 title : content,
                    	 start : start_date,
                    	 end : end_date,
                    	 allDay : all_day
                     })
                     
                 var events = calendar.getEvents(); // 모든 일정을 가져옴
                 
                 $(function saveData(sdata) {
                     let s = events[events.length - 1]; // 새로 추가된 일정을 가져옴
                	  let title = s['title'];
                	  let start = s['start'];
                	  let end = s['end'];
                	  
                     $.ajax({
                		 cache:"false",
                         url: "/schedule/insert", 
                         method: "post",
                         dataType: "text",
                         data: {"title": title ,"start": start , "end": end},
                     })
                         .done(function (result) {
                             alert("성공");
                             $("#calendarModal").modal("hide");
                         })
                         .fail(function (request, status, error) {
                              alert("실패" + error);
                         })
                	 
                     calendar.unselect()
               	  })
                 })
             },
/*              eventDrop: function (info){ // 일정 수정
                 console.log(info);
                 if(confirm("'"+ info.event.title +"'일정을 변경하시겠습니까?")){
                 }
                 var events = new Array();
                 var obj = new Object();

                 obj.title = info.event._def.title;
                 obj.start = info.event._instance.range.start;
                 obj.end = info.event._instance.range.end;
                 events.push(obj);

                 console.log(events);
                 $(function deleteData() {
                     $.ajax({
                         url: "/schedule/update",
                         method: "PATCH",
                         dataType: "text",
                         data: {"title": obj.title ,"start": obj.start , "end": obj.end},
                         // contentType: 'application/json',
                     })
                 })
             }, */
             eventClick : function (info) { // 일정 클릭 시
                 $("#updateAndDeleteModal").modal("show"); // modal 나타내기

                 $("#updateSchedule").on("click",function(){  // modal의 수정 버튼 클릭 시
                     var content = $("#calendar_content").val();
                     var start_date = $("#calendar_start_date").val();
                     var end_date = $("#calendar_end_date").val();
                     var all_day = $("#calendar_allDay").val();
                     
                     calendar.addEvent({
                    	 title : content,
                    	 start : start_date,
                    	 end : end_date,
                    	 allDay : all_day
                     })

                 var events = calendar.getEvents(); // 모든 일정을 가져옴
                 
                 $(function saveData(sdata) {
                     let s = events[events.length - 1]; // 새로 추가된 일정을 가져옴
                	  let title = s['title'];
                	  let start = s['start'];
                	  let end = s['end'];
                	  
                     $.ajax({
                		 cache:"false",
                         url: "/schedule/insert", 
                         method: "post",
                         dataType: "text",
                         data: {"title": title ,"start": start , "end": end},
                     })
                         .done(function (result) {
                             alert("성공");
                             $("#calendarModal").modal("hide");
                         })
                         .fail(function (request, status, error) {
                              alert("실패" + error);
                         })
                	 
                     calendar.unselect()
                	 })
                 })
             },
/*             	 // console.log(info);
            	 if(confirm("'" + info.event.title + "' 일정을 삭제하시겠습니까?")){
            		 info.event.remove();
            	 }
             	
             	 // console.log(info.event);
             	 
             	 var events = new Array();
             	 var obj = new Object();
             	 obj.title = info.event._def.title;
              	 obj.start = info.event._instance.range.start;
              	 events.push(obj);
              	 
              	 // console.log(obj.title);
              	 $(function deleteData(){
              		 $.ajax({
              			 url: "schedule/delete",
              			 method: "delete",
              			 dataType: "text",
              			 data : {"title" : obj.title, "start" : obj.start}
              		 })
              	 })
             
             }, */
			events :${schedule}, // DB에 저장되어 있는 일정 불러오기
		});
		calendar.render();
	});
</script>
</html>
