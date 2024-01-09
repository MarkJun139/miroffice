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
			headerToolbar : { // 헤더에 표시할 툴바
				left : 'today',
				center : 'prev title next',
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			 eventAdd: function () { // 이벤트가 추가되면 발생하는 이벤트
                 console.log()
             },
             select: function (arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
            	 
            	 
                 var title = prompt('일정을 입력해주세요.');
                 if (title) {
                     calendar.addEvent({
                         title: title,
                         start: arg.start,
                         end: arg.end,
                         allDay: arg.allDay,
                     })
                 }
                 var allEvent = calendar.getEvents(); // .getEvents() 함수로 모든 이벤트를 Array 형식으로 가져온다. (FullCalendar 기능 참조)

                 var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                 for (var i = allEvent.length; i < allEvent.length + 2; i++) {
                     var obj = new Object();     // Json 을 담기 위해 Object 선언
                     // alert(allEvent[i]._def.title); // 이벤트 명칭 알람
                     obj.title = allEvent[i]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
                     obj.start = allEvent[i]._instance.range.start; // 시작
                     obj.end = allEvent[i]._instance.range.end; // 끝

                     events.push(obj);
                 }
                 var jsondata = JSON.stringify(events);
                 console.log(jsondata);
                 // saveData(jsondata);

                 $(function saveData(jsondata) {
                     $.ajax({
                         url: "/schedule",
                         method: "post",
                         dataType: "json",
                         data: JSON.stringify(events),
                         contentType: 'application/json'
                     })
                         .done(function (result) {
                             // alert(result);
                         })
                         .fail(function (request, status, error) {
                              alert("실패" + error);
                         });
                     calendar.unselect()
                 });
             },
			events :${schedule}, // DB에 저장되어 있는 일정 불러오기
		});
		calendar.render();
	});
</script>
</html>