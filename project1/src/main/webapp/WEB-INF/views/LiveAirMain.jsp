<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LiveAirMain</title>

    <!-- Slick Carousel CSS & jQuery -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <style>
        body {
            margin: 0;
            padding: 0;
            width: 100%;
        }

        #header {
            position: relative;
        }
        
        
        

     .single-item img {
    width: 100%;
    height: 600px;
    object-fit: contain;
    object-position: center;
    background-color: #FFFFFF;
}

        #a {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            z-index: 20;
        }

        #logo img {
            width: 80px;
            height: auto;
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
            top: 50%;
            width: 50px;
            height: 50px;
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 50%;
            z-index: 10;
            transform: translateY(-50%);
            cursor: pointer;
        }

        #dlwjs { left: 20px; background-image: url('<%= request.getContextPath() %>/resources/img/left.png'); }
        #ekdma { right: 20px; background-image: url('<%= request.getContextPath() %>/resources/img/right.png'); }

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

        #qj:hover {
            background-color: #333;
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

<c:if test="${param.cancel eq 'success'}">
    <script>alert("예약이 성공적으로 취소되었습니다.");</script>
</c:if>

<header id="header">
    <div class="single-item">
        <div><img src="<%= request.getContextPath() %>/resources/img/air1.jpg" alt="슬라이드1"></div>
        <div><img src="<%= request.getContextPath() %>/resources/img/air2.jpg" alt="슬라이드2"></div>
        <div><img src="<%= request.getContextPath() %>/resources/img/air3.jpg" alt="슬라이드3"></div>
    </div>

    <div id="a">
        <div id="logo">
            <a href="<%= request.getContextPath() %>/">
                <img src="<%= request.getContextPath() %>/resources/img/logo.png" alt="로고">
            </a>
        </div>

        <div id="back">
            <c:choose>
                <c:when test="${empty sessionScope.user and empty sessionScope.admin}">
                    <a href="${pageContext.request.contextPath}/login"><button type="button">일반</button></a>
                    <a href="${pageContext.request.contextPath}/login"><button type="button">관리자</button></a>
                    <a href="${pageContext.request.contextPath}/join"><button type="button">회원가입</button></a>
                </c:when>
                <c:when test="${sessionScope.admin eq true}">
                    <p style="display:inline; font-weight:bold; color: red;">관리자님, 환영합니다!</p>
                    <img src="${pageContext.request.contextPath}/resources/img/logout.png" style="width: 40px; vertical-align: middle;">
                    <form action="${pageContext.request.contextPath}/logout" method="get" style="display:inline;">
                        <button type="submit">로그아웃</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <p style="display:inline; font-weight:bold;">${sessionScope.user.name}님 환영합니다!</p>
                    <img src="${pageContext.request.contextPath}/resources/img/logout.png" style="width: 40px; vertical-align: middle;">
                    <form action="${pageContext.request.contextPath}/logout" method="get" style="display:inline;">
                        <button type="submit">로그아웃</button>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- 화살표 버튼 위치는 여기로 옮기기 -->
    <div id="dlwjs"></div>
    <div id="ekdma"></div>
</header>

<section>
    <div class="pad">
        <p id="fh">로그인하시고 바로 예약해보세요</p>
        <button type="button" id="qj" onclick="location.href='<%= request.getContextPath() %>/login'">로그인</button>
    </div>

    <div id="ehd">
        <div class="item">
            <a href="${pageContext.request.contextPath}/userCalendar" style="text-decoration:none; color:inherit;">
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
            <a href="${pageContext.request.contextPath}/chatbot" style="text-decoration:none; color:inherit;">
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
    $(document).ready(function(){
        $('.single-item').slick({
            autoplay: true,
            autoplaySpeed: 3000,  // 3초마다 자동 넘김
            arrows: true,
            prevArrow: $('#dlwjs'),
            nextArrow: $('#ekdma')
        });
    });
</script>

</body>
</html>