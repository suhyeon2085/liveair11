<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>관리자용 달력</title>
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <style>
        .fc-daygrid-event {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            display: block;
        }
    </style>
</head>
<body>

    <h2 class="m-3">관리자용 달력</h2>
    <div id="calendar" class="m-3"></div>
  
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');

            var events = [];
            <c:forEach var="r" items="${reservations}">
                events.push({
                    title: '예약번호: ${r.num}',
                    start: '${r.date}',
                    extendedProps: {
                        loc: '${r.loc}',
                        type: '${r.type}',
                        
                    }
                });
            </c:forEach>

            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                events: events,

                eventDidMount: function (info) {
                    adjustFontSize(info.el);
                },

                eventClick: function (info) {
                    info.jsEvent.preventDefault();

                    // 예약 상세 정보 알림창
                    alert(
                        '예약번호: ' + info.event.title.replace('예약번호: ', '') + '\n' +
                        '고장증상: ' + info.event.extendedProps.type + '\n' +
                        '장소: ' + info.event.extendedProps.loc
                    );
                }
            });

            calendar.render();

            function adjustFontSize(eventEl) {
                const containerWidth = eventEl.offsetWidth;
                const titleEl = eventEl.querySelector('.fc-event-title');
                if (!titleEl) return;

                let fontSize = 14;
                titleEl.style.fontSize = fontSize + 'px';
                titleEl.style.whiteSpace = 'nowrap';

                while (titleEl.scrollWidth > containerWidth && fontSize > 8) {
                    fontSize--;
                    titleEl.style.fontSize = fontSize + 'px';
                }

                while (titleEl.scrollWidth < containerWidth && fontSize < 14) {
                    fontSize++;
                    titleEl.style.fontSize = fontSize + 'px';
                    if (titleEl.scrollWidth > containerWidth) {
                        fontSize--;
                        titleEl.style.fontSize = fontSize + 'px';
                        break;
                    }
                }
            }

            window.addEventListener('resize', function () {
                const eventEls = calendarEl.querySelectorAll('.fc-event');
                eventEls.forEach(el => {
                    adjustFontSize(el);
                });
            });
        });
    </script>
</body>
</html>