<%@page import="org.zerock.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 안녕 -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>에약조회 및 삭제</title>
<link rel="stylesheet" type="text/css" href="resources/css/check.css">

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div id="chkWrap">
<div id="chkContainer">

    <p id="chkTitle">| 예약 조회하기</p>

	<h3>사용자 정보</h3>
	
	
    <table>
    <tr>
        <th>예약자명</th>
        <td>${user.name}</td>
    </tr>
      <tr>
        <th>전화번호</th>
        <td id="phone">${user.phone}</td>
    </tr>
    <tr>
        <th>주소</th>
        <td>${user.address}</td>
    </tr>
    </table>
    
    <h3>출장 서비스 예약 정보</h3>
    <table id=infoTable>
	<tr>
        <th>예약 날짜</th>
        <td id="datetime">${reserve.date}</td>
    </tr>
    <tr>
        <th>제품명</th>
        <td id="model">${reserve.model}</td>
    </tr>
    <tr>
        <th>증상</th>
        <td id="type">${reserve.type}</td>
    </tr>
    <tr>
        <th>상세증상</th>
        <td id="detail">${reserve.detail}</td>
    </tr>
    <tr>
        <th>실외기 위치</th>
        <td id="loc">${reserve.loc}</td>
    </tr>
    
    </table>

	<div class="button-container">
		<a href="/userCalendar">
		  <button class="chkBtn" type="button">예약 변경</button>
		</a>
		
		<form action="/delete" method="post" onsubmit="return confirm('정말 취소하시겠습니까?')">
		    <input type="hidden" name="num" value="${reserve.num}" />
		    <button class="chkBtn" type="submit">예약 취소</button>
		</form>
		
		<a href="/">
		<button class="chkBtn" type="button">메인으로 돌아가기</button></a>
	</div>

</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
	document.addEventListener("DOMContentLoaded", function () {
		// 전화번호 형식
	    const phoneElement = document.getElementById("phone");
	    const phoneRaw = phoneElement.textContent.trim();
	    if (phoneRaw.length === 11) {
	        phoneElement.textContent = phoneRaw.slice(0, 3) + '-' + phoneRaw.slice(3, 7) + '-' + phoneRaw.slice(7);
	    }

	    // 날짜 형식
	    const datetimeElement = document.getElementById("datetime");
	    const datetimeRaw = datetimeElement.textContent.trim().substring(0, 19); // "2025-06-11 17:00:00"
	    const [date, time] = datetimeRaw.split(" ");
	    const [year, month, day] = date.split("-");
	    let [hour, minute] = time.split(":");

	    hour = parseInt(hour);
	    const ampm = hour < 12 ? "오전" : "오후";
	    const hour12 = hour % 12 === 0 ? 12 : hour % 12;

	    const formatted = year + '년 ' + month + '월 ' + day + '일 ' + ampm + ' ' + hour12 + '시';
	    datetimeElement.textContent = formatted;
	    
	    // 제품명 한글 변환
	    const modelMap = {
	    		stand: "스탠드 에어컨",
	    		wall: "벽걸이(창문) 에어컨",
	    		hmulti: "홈멀티 에어컨",
	    		system: "시스템(천장형/스탠드/벽걸이) 에어컨",
	    		aircon: "냉난방기",
	    		heater: "온풍기"
	    }
	    
	    const modelElement = document.getElementById("model");
	    const modelCode = modelElement.textContent.trim();
	    const modelName = modelMap[modelCode] || "알 수 없음";

	    modelElement.textContent = modelName;
	    
	    // 증상 한글 변환
	    const typeMap = {
	    		frost: "성에",
	    		dew: "이슬",
	    		gas: "가스 누설",
	    		noise: "소음",
	    		smell: "냄새",
	    		leak: "누수",
	    		etc: "기타"
	    }
	    
	    const typeElement = document.getElementById("type");
	    const typeCode = typeElement.textContent.trim();
	    const typeName = typeMap[typeCode] || "알 수 없음";

	    typeElement.textContent = typeName;
	    
	    // 실외기 위치 한글 변환
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
	    
	    const locElement = document.getElementById("loc");
	    const locCode = locElement.textContent.trim(); // 예: "A"
	    const locName = locMap[locCode] || "알 수 없음";

	    locElement.textContent = locName;
	    
	});
	
</script>
</body>
</html>