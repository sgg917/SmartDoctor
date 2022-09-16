<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SMART DOCTOR</title>
<!-- 캘린더를 위해 필요한 참조 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
  <div id='calendar-container'>
    <div id='calendar'></div>
  </div>      
  
  <script>
  const calendarEl = document.getElementById("calendar"); //캘린더를 넣어줄 html div

  let calendar;

  calendar_rendering();

  function calendar_rendering() {
    calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: "dayGridMonth",
    });
    calendar.render();
  }
  </script>
</body>
</html>