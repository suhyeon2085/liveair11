<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 달력</title>
<style>
    table { border-collapse: collapse; width: 100%; }
    td { width: 14%; height: 80px; text-align: center; vertical-align: top; border: 1px solid #ccc; cursor: pointer; position: relative; }
    .time-btn {
        margin: 4px;
        padding: 6px 12px;
        font-size: 14px;
        cursor: pointer;
        border: 1px solid #666;
        background-color: #eee;
    }
    .time-btn:hover {
        background-color: #ccc;
    }

    #timeModal {
        display:none;
        position: fixed;
        top: 50%; left: 50%;
        transform: translate(-50%, -50%);
        background: white;
        border: 1px solid #ccc;
        box-shadow: 0 0 10px rgba(0,0,0,0.5);
        padding: 20px;
        z-index: 1000;
        min-width: 320px;
        border-radius: 8px;
    }
    #modalOverlay {
        display:none;
        position: fixed;
        top:0; left:0; right:0; bottom:0;
        background: rgba(0,0,0,0.5);
        z-index: 999;
    }
    #timeModal button.close-btn {
        float: right;
        background: transparent;
        border: none;
        font-size: 20px;
        cursor: pointer;
    }
</style>
<script>
    function pad(n) {
        return n < 10 ? '0' + n : n;
    }

    function showTimeButtons(year, month, day) {
        const modal = document.getElementById("timeModal");
        const overlay = document.getElementById("modalOverlay");
        const modalContent = document.getElementById("modalContent");

        const displayDate = year + '-' + pad(month) + '-' + pad(day);
        let html = `<h3>${displayDate} 시간 선택</h3><div class='time-buttons'>`;

        for (let h = 9; h <= 17; h++) {
            const hourStr = pad(h) + ":00";
            html += `
            
            // /reserveForm.jsp (시간 선택하면 넘어갈 페이지 만들어야함)
                <form action='/reserveForm.jsp' method='get' style='display:inline-block; margin:5px;'>
                    <input type='hidden' name='year' value='${year}'/>
                    <input type='hidden' name='month' value='${month}'/>
                    <input type='hidden' name='day' value='${day}'/>
                    <input type='hidden' name='hour' value='${hourStr}'/>
                    <button class='time-btn' type='submit'>${hourStr}</button>
                </form>
            `;
        }

        html += "</div>";
        modalContent.innerHTML = html;
        modal.style.display = "block";
        overlay.style.display = "block";
    }

    function closeModal() {
        document.getElementById("timeModal").style.display = "none";
        document.getElementById("modalOverlay").style.display = "none";
    }
</script>
</head>
<body>
<h2>${year}년 ${month}월 예약 달력</h2>

<table border="1">
    <tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>
    <c:forEach var="i" begin="0" end="${days.size()-1}" varStatus="loop">
        <c:if test="${loop.index % 7 == 0}"><tr></c:if>
        <c:set var="d" value="${days[i]}" />
        <td>
            <c:if test="${d != ''}">
                <div onclick="showTimeButtons(${year}, ${month}, ${d})" style="cursor:pointer;">${d}</div>
            </c:if>
        </td>
        <c:if test="${loop.index % 7 == 6}"></tr></c:if>
    </c:forEach>
</table>

<!-- 모달 팝업 -->
<div id="timeModal">
    <button class="close-btn" onclick="closeModal()">✖</button>
    <div id="modalContent"></div>
</div>

<!-- 모달 배경 -->
<div id="modalOverlay" onclick="closeModal()"></div>

</body>
</html>