<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>관리자용 달력</title>
    <!-- FullCalendar & Bootstrap -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom Style -->
    <style>
        .fc-daygrid-event {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            display: block;
        }

        
        .custom-modal-width {
            max-width: 600px;
            width: 90%;
        }

        .modal-body p {
            margin-bottom: 0.5rem;
        }

        .modal-body .row > div {
            padding-bottom: 0.5rem;
        }
        
        
        
        
        
    </style>
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-4">관리자용 달력</h2>
        <div id="calendar"></div>
    </div>

    <!-- 예약 상세 모달 -->
    <div class="modal fade" id="reservationModal" tabindex="-1" aria-labelledby="reservationModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered custom-modal-width">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="reservationModalLabel">예약 상세 정보</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-6"><strong>번호:</strong> <span id="modalNum"></span></div>
                        <div class="col-6"><strong>시간:</strong> <span id="modalDate"></span></div>
                        <div class="col-6"><strong>이름:</strong> <span id="modalName"></span></div>
                        <div class="col-6"><strong>전화번호:</strong> <span id="modalPhone"></span></div>
                        <div class="col-12"><strong>주소:</strong> <span id="modalAddress"></span></div>
                        <div class="col-6"><strong>기종:</strong> <span id="modalModel"></span></div>
                        <div class="col-6"><strong>실외기 위치:</strong> <span id="modalLoc"></span></div>
                        <div class="col-6"><strong>증상:</strong> <span id="modalType"></span></div>
                        <div class="col-12"><strong>상세증상:</strong> <span id="modalDetail"></span></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Script -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');

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
                    title: '${r["num"]} / ${r["type"]} / ${r["address"]}',
                    start: '${r["date"]}',
                    extendedProps: {
                        name: '${r["name"]}',
                        phone: '${r["phone"]}',
                        address: '${r["address"]}',
                        num: '${r["num"]}',
                        model: '${r["model"]}',
                        type: '${r["type"]}',
                        detail: '${r["detail"]}',
                        loc: '${r["loc"]}',
                        date: '${r["date"]}'
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

                    document.getElementById('modalNum').textContent = p.num;
                    document.getElementById('modalName').textContent = p.name;
                    document.getElementById('modalPhone').textContent = p.phone;
                    document.getElementById('modalAddress').textContent = p.address;
                    document.getElementById('modalModel').textContent = p.model;
                    document.getElementById('modalType').textContent = p.type;
                    document.getElementById('modalDetail').textContent = p.detail;
                    document.getElementById('modalLoc').textContent = locMap[p.loc] || p.loc;
                    document.getElementById('modalDate').textContent = p.date;

                    const modal = new bootstrap.Modal(document.getElementById('reservationModal'));
                    modal.show();
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