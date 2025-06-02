<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>달력</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        td { width: 14%; height: 80px; text-align: center; vertical-align: top; border: 1px solid #ccc; cursor: pointer; }
        .today { background-color: #ffecb3; font-weight: bold; }
    </style>
</head>
<body>
<<<<<<< HEAD
    <h2 class="m-3">관리자용 달력</h2>
    <div id="calendar" class="m-3"></div>
  
    <h2>
        <a href="calendar?year=${prevYear}&month=${prevMonth}">◀</a>
        ${year}년 ${month}월
        <a href="calendar?year=${nextYear}&month=${nextMonth}">▶</a>
    </h2>

    <table> 
        <tr>
            <th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
        </tr>
        <c:forEach var="i" begin="0" end="${days.size() - 1}" varStatus="loop">
            <c:if test="${loop.index % 7 == 0}"><tr></c:if>

            <c:set var="day" value="${days[i]}" />
            <c:choose>
                <c:when test="${day != ''}">
                    <c:choose>
                        <c:when test="${day == todayDay}">
                            <td class="today" onclick="openMemoModal(${day})">
                                ${day}<br/>
                                <span style="font-size:small;">${memoMap[day]}</span>
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td onclick="openMemoModal(${day})">
                                ${day}<br/>
                                <span style="font-size:small;">${memoMap[day]}</span>
                            </td>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <td></td>
                </c:otherwise>
            </c:choose>

            <c:if test="${loop.index % 7 == 6}"></tr></c:if>
        </c:forEach>
    </table>

    <!-- 메모 입력 모달 -->
    <div id="memoModal" style="display:none; position:fixed; top:30%; left:40%; background:white; border:1px solid gray; padding:20px;">
        <form action="addMemo" method="post">
            <input type="hidden" name="year" value="${year}" />
            <input type="hidden" name="month" value="${month}" />
            <input type="hidden" name="day" id="memoDay" />
            <textarea name="memo" placeholder="메모 입력" rows="4" cols="30"></textarea><br/>
            <button type="submit">저장</button>
            <button type="button" onclick="document.getElementById('memoModal').style.display='none';">취소</button>
        </form>
    </div>
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

        function openMemoModal(day) {
            document.getElementById('memoDay').value = day;
            document.getElementById('memoModal').style.display = 'block';
        }

    </script>
</body>
</html>