<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	<div id='calendar'></div>
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
			} ],
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
             select: function (arg) { // 일정 추가 
                 var title = prompt('일정을 입력해주세요.');
                 if (title) {
                     calendar.addEvent({
                         title: title,
                         start: arg.start,
                         end: arg.end,
                         allDay: arg.allDay,
                     })
                 }
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
                         })
                         .fail(function (request, status, error) {
                              alert("실패" + error);
                         });
                	 
                     calendar.unselect()
                 });
             },
             eventDrop: function (info){ // 일정 수정
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
             },
             eventClick : function (info) { // 일정 삭제
            	 // console.log(info);
            	 if(confirm("'" + info.event.title + "' 일정을 삭제하시겠습니까?")){
            		 info.event.remove();
            	 }
             	
             	 console.log(info.event);
             	 
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
             
             },
			events :${schedule}, // DB에 저장되어 있는 일정 불러오기
		});
		calendar.render();
	});
</script>
</html>
