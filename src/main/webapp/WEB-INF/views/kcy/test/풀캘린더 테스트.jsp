<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.fp.smartDoctor.messenger.model.vo.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div id='calendar'></div>
	<script>
	
	$(function(){
		
		$.ajax({
			url:"list.ca",
			//data : {no:${c.calendarNo}},
			success:function(list){
				
				//console.log(list);
				
				let data = [];/* 내가 넘겨주고자 하는 값을 리스트로 다시 담아줘야함! */
				for(let i=0; i<list.length;i++){
					let obj = {
						title : list[i].calendarTitle,
						start : list[i].calendarStart,
						end : list[i].calenderEnd, 
						color : '#' + Math.round(Math.random() * 0xffffff).toString(16)	
					};
					data.push(obj);
				}
				
				// -------------------- 캘린더 렌더링 --------------------
				var calendarEl = document.getElementById('calendar');
				var calendar = new FullCalendar.Calendar(calendarEl, {
					initialView : 'dayGridMonth',
					locale : 'ko', // 한국어 설정
					headerToolbar : {
					        	start : "",
					            center : "prev title next",
					            end : 'dayGridMonth,dayGridWeek,dayGridDay'
				            },
					selectable : true,
					droppable : true,
					editable : true,
					events : data
					});
				
				calendar.render();
				// ------------------------------------------------------------
				
			},
			error:function(){
				console.log("통신 실패")
			}
			
		})
		

		
		
	});
	</script>
</body>
</html>