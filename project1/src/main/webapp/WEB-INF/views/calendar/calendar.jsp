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
            
            
            
            //  loc 코드 → 설명 매핑
            const locMap = {
                A: '베란다 밖 난간',
                B: '건물의 외벽 앵글',
                C: '건물 밖 실외기실',
                D: '옥상',
                E: '실내 실외기실',
                F: '베란다 내부',
                G: '1층 또는 지면',
                H: '2단 설치'
            };
            
            

            var events = [];
            
            
            
            <c:forEach var="r" items="${reservations}">
            events.push({
                title: '${r.num} / ${r.type} / ${r.address}',
                start: '${r.date}',
                extendedProps: {
                    name: '${r.name}',
                    phone: '${r.phone}',
                    address: '${r.address}',
                    num: '${r.num}',
                    model: '${r.model}',
                    type: '${r.type}',
                    detail: '${r.detail}',
                    loc: '${r.loc}',
                    date: '${r.date}'
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

                    const p = info.event.extendedProps;

                    alert(
                        '이름: ' + p.name + '\n' +
                        '전화번호: ' + p.phone + '\n' +
                        '주소: ' + p.address + '\n\n' +
                        '번호: ' + p.num + '\n' +
                        '기종: ' + p.model + '\n' +
                        '증상: ' + p.type + '\n' +
                        '상세증상: ' + p.detail + '\n' +
                        '실외기 위치: ' + (locMap[p.loc] || p.loc) + '\n' +   // loc 코드 받아오기
                        '시간: ' + p.date
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