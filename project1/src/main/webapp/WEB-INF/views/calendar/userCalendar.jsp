<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	<div class="container mt-4">

    <h2 class="m-3">예약 달력</h2>
    <p>
    	<c:if test="${reserve != null && reserve.num != null}">
        현재 예약된 시간은 "${reserve.date}"입니다.<br>
    	</c:if>
    </p>
    <div id="calendar" class="m-3"></div>

	</div>
	
    <!-- 시간 선택 모달 -->
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

    <!-- 예약 입력 폼 모달 -->
    <div class="modal fade" id="reservationFormModal" tabindex="-1" aria-labelledby="reservationFormLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form method="get" class="modal-content" id="reservationForm">
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
	// 예약 가능 시간대
	const times = [
	    "09:00", "10:00", "11:00", "12:00",
	    "13:00", "14:00", "15:00", "16:00", "17:00"
	];
	
	// 서버에서 예약된 시간들을 저장할 배열
	let reservedDateTimes = [];
	
	// 컨트롤러에서 전달된 값들을 JSP에서 문자열로 받음
	const isModify = "${isModify}" === "true"; // 수정 상태 여부
	const dtoDateTime = "${reserve.date != null ? reserve.date : ''}"; // 예: "2025-06-05 14:00:00"
	const reserveNum = "${isModify && not empty reserve ? reserve.num : ''}"; // 예약 번호
	
	document.addEventListener('DOMContentLoaded', function () {
	    // 서버에서 예약된 datetime 리스트 불러옴 (예: ["2025-06-05T09:00", ...])
	    fetch("/reserved-datetimes")
	        .then(response => response.json())
	        .then(data => {
	            reservedDateTimes = data;
	            initCalendar(); // 달력 초기화 함수 호출
	        });
	
	    function initCalendar() {
	        const calendarEl = document.getElementById('calendar');
	        const calendar = new FullCalendar.Calendar(calendarEl, {
	            initialView: 'dayGridMonth',
	
	            // 오늘 포함 이전 날짜는 선택 불가 → 내일부터만 선택 가능
	            validRange: {
	                start: new Date(new Date().setDate(new Date().getDate() + 1)).toISOString().split("T")[0]
	            },
	
	            // 날짜 클릭 시
	            dateClick: function (info) {
	                const dateStr = info.dateStr; // 예: "2025-06-05"
	                document.getElementById("selectedDateText").innerText = dateStr;
	
	                const container = document.getElementById("timeSlots");
	                container.innerHTML = ""; // 시간 버튼 초기화
	
	                // 시간대마다 버튼 생성
	                times.forEach(time => {
	                    const dateTimeISO = dateStr + "T" + time; // 예: 2025-06-05T14:00
	                    const targetDateTime = dateStr + " " + time; // 예: 2025-06-05 14:00
	
	                    const btn = document.createElement("button");
	                    btn.className = "btn btn-outline-primary m-1";
	                    btn.innerText = time;
	
	                    // 예약된 시간이면서 본인의 기존 예약이 아닌 경우 → 비활성화
	                    if (reservedDateTimes.includes(dateTimeISO) &&
	                        !(isModify && dtoDateTime.startsWith(targetDateTime))) {
	                        btn.className = "btn btn-outline-secondary m-1";
	                        btn.disabled = true;
	                    } else {
	                        // 본인의 예약 시간이면 파란색 강조
	                        if (isModify && dtoDateTime.startsWith(targetDateTime)) {
	                            btn.classList.remove("btn-outline-primary");
	                            btn.classList.add("btn-primary");
	                        }
	
	                        // 클릭 이벤트 설정
	                        btn.onclick = () => {
	                            const fullDateTime = dateStr + "T" + time;
	                            const fullDateTimeShow = dateStr + " " + time;
	                            document.getElementById("selectedDateTime").innerText = fullDateTimeShow;
	                            document.getElementById("inputDate").value = fullDateTime;
	
	                            // 폼 액션 설정: 수정/신규
	                            const form = document.getElementById("reservationForm");
	                            if (isModify && reserveNum) {
	                                form.action = '/modReserve?num=' + reserveNum;
	                            } else {
	                                form.action = "/reserve";
	                            }
	
	                            // 시간 선택 모달 닫고 예약 입력 모달 열기
	                            bootstrap.Modal.getInstance(document.getElementById("timeModal")).hide();
	                            const resModal = new bootstrap.Modal(document.getElementById("reservationFormModal"));
	                            resModal.show();
	                        };
	                    }
	
	                    container.appendChild(btn); // 버튼 추가
	                });
	
	                // 시간 선택 모달 열기
	                const modal = new bootstrap.Modal(document.getElementById("timeModal"));
	                modal.show();
	            }
	        });
	
	        calendar.render();
	
	        // 수정일 경우: 예약된 날짜로 자동 이동
	        if (isModify && dtoDateTime) {
	            const autoDate = dtoDateTime.split(" ")[0]; // 예: "2025-06-05"
	            calendar.gotoDate(autoDate);
	        }
	    }
	});

</script>


</body>
</html>