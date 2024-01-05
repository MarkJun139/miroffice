<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
<script
	src='https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js'></script>
<script
	src='https://cdn.jsdelivr.net/npm/@fullcalendar/moment@5.5.0/main.global.min.js'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<link rel="stylesheet" href="/css/style.css" />
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			headerToolbar : {
				left : 'today',
				center : 'prev title next',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			views : {
				dayGridMonth : { // name of view
					titleFormat : function(date) { // title 설정
						return date.date.year + "년 " + (date.date.month + 1)
								+ "월";
					}
				},
				/* 				week : { // name of view
				 titleFormat : function(date) { // title 설정
				 return (date.date.month + 1) + "월 " + date.date.day
				 + "일 ~ " + (date.date.month + 1) + "월 "
				 + (date.date.day + 7) + "일";
				 }
				 }, */
				day : { // name of view
					titleFormat : function(date) { // title 설정
						return date.date.year + "년 " + (date.date.month + 1)
								+ "월 " + date.date.day + "일";
					}
				}
			},
			selectable : true,
			dragScroll : true,
			dayMaxEvents : true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
			dropable : true,
			editable : true,
			eventAdd : function(obj) { // 이벤트가 추가되면 발생하는 이벤트
				console.log(obj);
			},
			eventChange : function(obj) { // 이벤트가 수정되면 발생하는 이벤트
				console.log(obj);
			},
			eventRemove : function(obj) { // 이벤트가 삭제되면 발생하는 이벤트
				console.log(obj);
			},
			select : function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
				var title = prompt('Event Title:');
				if (title) {
					calendar.addEvent({
						title : title,
						start : arg.start,
						end : arg.end,
						allDay : arg.allDay
					})
				}
				calendar.unselect()
			},
			locale : 'ko',
			customButtons:{
				insertButton:{
					text: "일정 추가"
				}
			},
			events : [ {
				title : 'TEST',
				start : '2024-01-05'
			}, {
				title : 'Click for Google',
				url : 'http://google.com/', // 클릭시 해당 url로 이동
				start : '2024-01-05'
			} ]
		});
		calendar.render();
	});
</script>
<title>캘린더</title>
</head>
<body>
	<div id='calendar'></div>
</body>
</html>