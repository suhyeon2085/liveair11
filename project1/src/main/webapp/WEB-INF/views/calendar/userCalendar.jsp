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
            <form class="modal-content" id="reservationForm">
                <div class="modal-header">
                    <h5 class="modal-title" id="reservationFormLabel">예약 정보 입력</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p><strong>선택된 시간:</strong> <span id="selectedDateTime"></span></p>
                    <input type="hidden" id="inputDate" name="date" />
                    <input type="hidden" id="inputTime" name="time" />

                    <div class="mb-3">
                        <label for="name" class="form-label">이름</label>
                        <input type="text" class="form-control" id="name" name="name" required />
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">연락처</label>
                        <input type="text" class="form-control" id="phone" name="phone" required />
                    </div>
                    <div class="mb-3">
                        <label for="note" class="form-label">메모</label>
                        <textarea class="form-control" id="note" name="note" rows="2"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">예약하기</button>
                </div>
            </form>
        </div>
    </div>

    <!-- ✅ 스크립트 -->
    <script>
        const times = [
            "09:00", "10:00", "11:00", "12:00",
            "13:00", "14:00", "15:00", "16:00", "17:00"
        ];

        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                dateClick: function (info) {
                    const selectedDate = info.dateStr;
                    document.getElementById("selectedDateText").innerText = selectedDate;

                    const container = document.getElementById("timeSlots");
                    container.innerHTML = "";

                    times.forEach(time => {
                        const btn = document.createElement("button");
                        btn.className = "btn btn-outline-primary m-1";
                        btn.innerText = time;
                        btn.onclick = () => {
                            // 선택 시간/날짜 표시 및 hidden input 세팅
                            document.getElementById("selectedDateTime").innerText = selectedDate + " " + time;
                            document.getElementById("inputDate").value = selectedDate;
                            document.getElementById("inputTime").value = time;

                            // 시간 선택 모달 닫고 예약 폼 열기
                            bootstrap.Modal.getInstance(document.getElementById("timeModal")).hide();
                            const resModal = new bootstrap.Modal(document.getElementById("reservationFormModal"));
                            resModal.show();
                        };
                        container.appendChild(btn);
                    });

                    // 시간 선택 모달 열기
                    const modal = new bootstrap.Modal(document.getElementById("timeModal"));
                    modal.show();
                }
            });
            calendar.render();
        });

        // 예약 폼 전송 처리
        document.getElementById("reservationForm").addEventListener("submit", function (e) {
            e.preventDefault();

            const data = {
                date: this.date.value,
                time: this.time.value,
                name: this.name.value,
                phone: this.phone.value,
                note: this.note.value
            };

            console.log("예약 요청 데이터:", data);

            alert("예약 정보 제출됨!\n\n" + JSON.stringify(data, null, 2));
            bootstrap.Modal.getInstance(document.getElementById("reservationFormModal")).hide();

            // TODO: Ajax로 서버에 예약 데이터 전송하기
        });
    </script>
</body>
</html>