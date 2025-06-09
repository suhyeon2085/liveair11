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
    
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<div class="container mt-4">

    <h2 style="font-weight: bold;" class="m-3">예약 달력</h2>
    <p id="notice" style="margin-left: 18px;">
     예약 시간 선택을 위해서 날짜를 클릭해 주세요!
    </p>
    <!-- 
    <p>
    	<c:if test="${reserve != null && reserve.num != null}">
        현재 예약된 시간은 "${reserve.date}"입니다.<br>
    	</c:if>
    </p>
     -->
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
            	<c:if test="${reserve != null && reserve.num != null}">
            		<input type="text" id="num" name="num" value="${reserve.num}">
            	</c:if>
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
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<c:if test="${not empty error}">
    	<script>alert('${error}');</script>
	</c:if>
	
<script>
	//선택 가능한 시간대 목록
	const times = [
	    "09:00", "10:00", "11:00", "12:00",
	    "13:00", "14:00", "15:00", "16:00", "17:00"
	];
	
	// 서버에서 불러올 예약된 날짜/시간 목록 (ISO 포맷)
	let reservedDateTimes = [];
	
	// 수정 모드 여부 (JSP에서 전달된 값 문자열을 boolean으로 변환)
	const isModify = "${isModify}" === "true";
	
	// JSP에서 전달된 기존 예약 시간. 초 단위를 제거하고 "yyyy-MM-dd HH:mm" 형식으로 정리
	const rawDateTime = "${reserve.date != null ? reserve.date : ''}";
	const dtoDateTime = rawDateTime.length >= 16 ? rawDateTime.substring(0, 16) : rawDateTime;
	
	// 수정 모드일 때 예약 번호를 세팅 (새 예약이면 빈 문자열)
	const reserveNum = "${isModify && not empty reserve ? reserve.num : ''}";
	
	// 페이지 로드가 완료되면 실행
	document.addEventListener('DOMContentLoaded', function () {
	    // 서버에서 예약된 날짜/시간 목록을 불러온 후 캘린더를 초기화
	    fetch("/reserved-datetimes")
	        .then(response => response.json())
	        .then(data => {
	            reservedDateTimes = data; // 예: ["2025-06-05T09:00", ...]
	            initCalendar(); // 예약 정보를 기반으로 캘린더 렌더링
	        });
	
	    // 날짜를 클릭했을 때 호출되는 함수
	    function onDateClick(dateStr) {
	        // 선택된 날짜를 텍스트로 표시
	        document.getElementById("selectedDateText").innerText = dateStr;
	
	        const container = document.getElementById("timeSlots");
	        container.innerHTML = ""; // 기존 버튼 초기화
	
	        // 모든 시간대에 대해 버튼 생성
	        times.forEach(time => {
	            const dateTimeISO = dateStr + "T" + time; // 예약과 비교할 ISO 형식
	            const btn = document.createElement("button");
	
	            // 기본 버튼 스타일 설정
	            btn.className = "btn btn-outline-primary m-1";
	            btn.innerText = time;
	
	            const targetDateTime = dateStr + " " + time; // 비교용 문자열 ("yyyy-MM-dd HH:mm")
	
	            // 수정 모드이고, 현재 버튼 시간이 기존 예약 시간과 같으면 강조
	            if (isModify && dtoDateTime === targetDateTime) {
	                btn.classList.remove("btn-outline-primary");
	                btn.classList.add("btn-primary");
	            }
	
	            // 예약된 시간이면서 본인 예약은 제외하고 비활성화 처리
	            if (reservedDateTimes.includes(dateTimeISO) && !(isModify && dtoDateTime === targetDateTime)) {
	                btn.className = "btn btn-outline-secondary m-1";
	                btn.disabled = true;
	            } else {
	                // 선택 가능한 시간대일 경우 버튼 클릭 시 동작 정의
	                btn.onclick = () => {
	                    const fullDateTime = dateStr + "T" + time; // form input에 저장할 값
	                    const fullDateTimeShow = dateStr + " " + time; // 사용자에게 보여줄 값
	                    document.getElementById("selectedDateTime").innerText = fullDateTimeShow;
	                    document.getElementById("inputDate").value = fullDateTime;
	
	                    // 예약 폼의 action 경로 설정
	                    const form = document.getElementById("reservationForm");
	                    if (isModify && reserveNum) {
	                        form.action = '/modReserve';
	                    } else {
	                        form.action = "/reserve";
	                    }
	
	                    // 시간 선택 모달 닫고 예약 폼 모달 열기
	                    bootstrap.Modal.getInstance(document.getElementById("timeModal")).hide();
	                    const resModal = new bootstrap.Modal(document.getElementById("reservationFormModal"));
	                    resModal.show();
	                };
	            }
	
	            // 버튼을 시간 선택 영역에 추가
	            container.appendChild(btn);
	        });
	
	        // 시간 선택 모달 표시
	        const modal = new bootstrap.Modal(document.getElementById("timeModal"));
	        modal.show();
	    }
	
	    // FullCalendar 초기화 함수
	    function initCalendar() {
	        const calendarEl = document.getElementById('calendar');
	        const calendar = new FullCalendar.Calendar(calendarEl, {
	            initialView: 'dayGridMonth', // 월간 달력 보기
	            validRange: {
	                // 오늘 다음 날부터 예약 가능
	                start: new Date(new Date().setDate(new Date().getDate() + 1)).toISOString().split("T")[0]
	            },
	            // 날짜 클릭 시 onDateClick 호출
	            dateClick: function (info) {
	                onDateClick(info.dateStr);
	            }
	        });
	
	        calendar.render();
	
	        // 수정 모드일 경우: 기존 예약 날짜로 이동하고 자동으로 클릭
	        if (isModify && dtoDateTime) {
	            const autoDate = dtoDateTime.split(" ")[0]; // 날짜만 추출
	            calendar.gotoDate(autoDate); // 해당 날짜로 이동
	            onDateClick(autoDate); // 해당 날짜의 시간대 표시
	        }
	    }
	});

</script>


</body>
</html>