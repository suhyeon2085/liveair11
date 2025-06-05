<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LiveAirMain</title>
<style>
    body {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
    }

    #header1 {
        height: 1000px;
        width: 100%;
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        transition: background-image 0.5s ease-in-out;
        background-image: url('<%= request.getContextPath() %>/resources/img/air.jpg');
    }

    #logo img {
        width: 80px;
        height: auto;
        float: right;
    }

    #a {
        display: flex;
        justify-content: space-between;
        align-items: right;
        text-decoration: none;
    }
    
    #back a {
    text-decoration: none;  /* a 태그 밑줄 제거 */
	}

    #back a button {
        font-size: 17px;
        font-weight: bold;
        padding: 10px 10px;
        margin: 0 5px;
        color: black;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        font-family: 'Pretendard', sans-serif;
        background-color: #f0f0f0;
        transition: background-color 0.3s ease;
    }

    #back a button:hover {
        background-color: #dcdcdc;
    }

    #dlwjs, #ekdma {
        position: absolute;
        top: 32%;
        width: 60px;
        height: 60px;
        background-size: cover;
        background-repeat: no-repeat;
        cursor: pointer;
        background-color: rgb(255, 238, 224);
        border-radius: 50%;
    }

    #dlwjs { left: 20px; }
    #ekdma { right: 20px; }

    section {
        height: 650px;
        margin: 0;
    }

    .pad {
        padding-bottom: 70px;
    }

    #fh {
        font-size: 45px;
        font-weight: bold;
        text-align: center;
        color: #333;
        margin-bottom: 20px;
        padding: 40px;
        font-family: 'Arial', sans-serif;
    }

    #qj {
        font-size: 27px;
        font-weight: bold;
        padding: 10px 20px;
        background-color: #000;
        color: white;
        border: none;
        border-radius: 20px;
        cursor: pointer;
        font-family: 'Arial', sans-serif;
        display: block;
        margin: 0 auto;
        transition: background-color 0.3s ease;
    }

    .e {
        width: 150px;
        height: 150px;
        border-radius: 50%;
        background-color: rgb(250, 250, 247);
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .item {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 0 15px;
    }

    .e img {
        width: 70px;
        height: 70px;
        object-fit: contain;
    }

    #ehd {
        display: flex;
        justify-content: center;
        gap: 30px;
        margin-top: 40px;
    }

    .item p {
        margin-top: 8px;
        font-size: 30px;
        color: #333;
        text-align: center;
        font-weight: bold;
        font-family: 'Arial', sans-serif;
    }

    #c {
        padding: 3%;
        background-color: #e4e4e4;
        font-size: 25px;
    }

    #c ul {
        list-style: none;
        padding-left: 0;
    }

</style>
</head>
<body>
<%
    String user = (String) session.getAttribute("user");
%>

<!-- 예약 조회 페이지에서 취소버튼 누르면 메인으로 넘어와서 alret창 뜨게 해주는 코드 -->
<c:if test="${param.cancel eq 'success'}">
    <script>
        alert("예약이 성공적으로 취소되었습니다.");
    </script>
</c:if>



<header>

<div id="a">

    <div id="header1">
    
    <div class="single-item">
	    <div><img src="${pageContext.request.contextPath}/resources/img/air.jpg" style="width:100%; height:1000px;"></div>
	    <div><img src="${pageContext.request.contextPath}/resources/img/air2.jpg" style="width:100%; height:1000px;"></div>
	    <div><img src="${pageContext.request.contextPath}/resources/img/air3.jpg" style="width:100%; height:1000px;"></div>
	</div>
		
	
            <div id="logo">
            <a href="<%= request.getContextPath() %>/LiveAirMain">
                <img src="<%= request.getContextPath() %>/resources/img/logo.png" alt="로고">
            </a>
        </div>

  		 <!-- 아래 차레대로 문단마다의 의미 -->
            <!-- 로그인 안 한 경우 -->
            <!-- 관리자 로그인 -->
    		<!-- 일반 사용자 로그인 -->
<div id="back">
    <c:choose>

        <c:when test="${empty sessionScope.user and empty sessionScope.admin}">
            <a href="${pageContext.request.contextPath}/user"><button type="button">일반</button></a>
            <a href="${pageContext.request.contextPath}/user"><button type="button">관리자</button></a>
            <a href="${pageContext.request.contextPath}/login"><button type="button">회원가입</button></a>
        </c:when>

	</div>
        <c:when test="${sessionScope.admin eq true}">
            <p style="display:inline; font-weight:bold; color: red;">관리자님, 환영합니다!</p>
            <img src="${pageContext.request.contextPath}/resources/img/logout.png" style="width: 40px; vertical-align: middle;">
            <form action="${pageContext.request.contextPath}/logout" method="get" style="display:inline;">
                <button type="submit">로그아웃</button>
            </form>
        </c:when>

        <c:otherwise>
            <p style="display:inline; font-weight:bold;">${sessionScope.user.id}님 환영합니다!</p>
            <img src="${pageContext.request.contextPath}/resources/img/logout.png" style="width: 40px; vertical-align: middle;">
            <form action="${pageContext.request.contextPath}/logout" method="get" style="display:inline;">
                <button type="submit">로그아웃</button>
            </form>
        </c:otherwise>
    </c:choose>
</div>


    <!-- 슬라이드 화살표 -->
    <div id="dlwjs" style="background-image: url('<%= request.getContextPath() %>/resources/img/left.png');"></div>
    <div id="ekdma" style="background-image: url('<%= request.getContextPath() %>/resources/img/right.png');"></div>
</div>

</header>

<c:if test="${sessionScope.admin == true}">
    <div style="text-align:center; margin-top: 20px;">
        <button onclick="changeHeaderImage()" style="font-size:18px; padding:10px 20px;">
            배경 이미지 바꾸기
        </button>
    </div>
</c:if>


<section>
    <div class="pad">
        <p id="fh">로그인하시고 바로 예약해보세요</p>
        <button type="button" id="qj" onclick="location.href='<%= request.getContextPath() %>/login.jsp'">로그인</button>
    </div>
	<div id="ehd">
    <div class="item">
        <a href="${pageContext.request.contextPath}/calendar" style="text-decoration:none; color:inherit;">
            <div class="e">
                <img src="${pageContext.request.contextPath}/img/출장서비스예약.png" alt="출장 예약">
            </div>
            <p>출장 서비스 예약</p>
        </a>
    </div>
    
    <div class="item">
        <a href="${pageContext.request.contextPath}/check" style="text-decoration:none; color:inherit;">
            <div class="e">
                <img src="${pageContext.request.contextPath}/img/조회및변경.png" alt="예약 조회">
            </div>
            <p>예약 조회 및 변경</p>
        </a>
    </div>
    
    <div class="item">
        <a href="${pageContext.request.contextPath}/chatboot" style="text-decoration:none; color:inherit;">
            <div class="e">
                <img src="${pageContext.request.contextPath}/img/챗봇.png" alt="챗봇">
            </div>
            <p>챗봇 연결하기</p>
        </a>
    </div>
</div>

</section>

<footer id="c">
    <ul>
        <li>대표 번호 : 010-1111-1111 | 대표 이메일 : LiveAir@naver.com</li>
        <li>구매 문의 : 010-1111-1112 | 전화 상담 시간 : 9:00-6:00</li>
        <li>휴무 안내 : 공휴일 9:00-12:00 / 주말 휴무</li>
    </ul>
    <hr>
    <ul>
        <li>Live Air | 사업자 등록번호 : 123-45-67891 | 주소 : 울산광역시 남구 삼산중로100번길 26 케이엠빌딩</li>
    </ul>
</footer>

<script> 
//화살표 버튼 누르면 사진 슬라이드 넘어가게 하는 법

    
  $(document).ready(function(){
  $('.single-item').slick({
    autoplay: true,
    autoplaySpeed: 1000,
    prevArrow: '#dlwjs',
    nextArrow: '#ekdma'
  });
});
    
    
</script>



</body>
</html>