<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>예약 달력</title>

    <!-- FullCalendar -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>

    <!-- Bootstrap 5 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <h2 class="m-3">예약 달력</h2>
    <div id="calendar" class="m-3"></div>

    <!-- ✅ 시간 선택 모달 -->
    <div class="modal fade" id="timeModal" tabindex="-1" aria-labelledby="timeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">예약 시간 선택 - <span id="selectedDateText"></span></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body" id="timeSlots">
                    <!-- 시간대 버튼이 여기에 동적으로 추가됨 -->
                </div>
            </div>
        </div>
    </div>

    <!-- ✅ 예약 입력 폼 모달 -->
    <div class="modal fade" id="reservationFormModal" tabindex="-1" aria-labelledby="reservationFormLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form action="reserve" method="get" class="modal-content" id="reservationForm">
                <div class="modal-header">
                    <h5 class="modal-title" id="reservationFormLabel">예약 정보 입력</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p><strong>선택된 시간:</strong> <span id="selectedDateTime"></span></p>
                    <input type="text" id="inputDate" name="date" value=""/>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">예약하기</button>
                </div>
            </form>
        </div>
    </div>

<script>
    const times = [
        "09:00", "10:00", "11:00", "12:00",
        "13:00", "14:00", "15:00", "16:00", "17:00"
    ];

    let reservedDateTimes = [];

    document.addEventListener('DOMContentLoaded', function () {
        // 서버에서 예약된 시간 목록을 먼저 불러오기
        fetch("/reserved-datetimes")
            .then(response => response.json())
            .then(data => {
                reservedDateTimes = data; // ex: ["2025-06-05T09:00", ...]
                initCalendar(); // 예약 정보가 준비된 후 달력 렌더링
            });

        function initCalendar() {
            const calendarEl = document.getElementById('calendar');
            const calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                
                // 오늘 포함 이전 날짜 모두 선택 불가 → 내일부터만 예약 가능
                validRange: {
                    start: new Date(new Date().setDate(new Date().getDate() + 1)).toISOString().split("T")[0]
                },

                dateClick: function (info) {
                    const selectedDate = info.dateStr;
                    document.getElementById("selectedDateText").innerText = selectedDate;

                    const container = document.getElementById("timeSlots");
                    container.innerHTML = "";

                    times.forEach(time => {
                        const dateTimeISO = selectedDate + "T" + time;
                        const btn = document.createElement("button");
                        
                     	// 예약 가능 시간 → 파란색 활성화
                        btn.className = "btn btn-outline-primary m-1";
	                    btn.innerText = time;

                        if (reservedDateTimes.includes(dateTimeISO)) {
                            // 예약된 시간 → 회색 비활성화
                            btn.className = "btn btn-outline-secondary m-1";
                            btn.disabled = true;
                            btn.innerText = time; // 표시용
                        } else {
                            // 클릭 시 동작
                            btn.onclick = () => {
                            	const fullDateTime = selectedDate + "T" + time; // ISO 8601 형식
    	                    	const fullDateTimeShow = selectedDate + " " + time;
                                document.getElementById("selectedDateTime").innerText = fullDateTimeShow;
                                document.getElementById("inputDate").value = fullDateTime;

                                bootstrap.Modal.getInstance(document.getElementById("timeModal")).hide();
                                const resModal = new bootstrap.Modal(document.getElementById("reservationFormModal"));
                                resModal.show();
                            };
                        }

                        container.appendChild(btn);
                    });

                    // 시간 선택 모달 열기
                    const modal = new bootstrap.Modal(document.getElementById("timeModal"));
                    modal.show();
                }
            });

            calendar.render();
        }
    });
</script>


</body>
</html>