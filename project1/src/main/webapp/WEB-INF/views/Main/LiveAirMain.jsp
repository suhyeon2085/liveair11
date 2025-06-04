<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html><!--  안녕하ㅣ세요  -->
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
header {
    height: 1000px;
    background-size: cover;       /* 이미지가 영역에 꽉 차게 */
    background-position: center;  /* 가운데 정렬 */
    background-repeat: no-repeat; /* 반복 금지 */
    transition: background-image 0.5s ease-in-out;
}
    #logo img {
        width: 80px;
        height: auto;
        float: left;
    }

    #back button {
        font-size: 20px;
        font-weight: bold;
        padding: 10px 20px;
        color: rgb(0, 0, 0);
        border: none;
        border-radius: 10px;
        cursor: pointer;
        font-family: 'pretendard', sans-serif;
        margin: 0 auto;
        transition: background-color 0.3s ease;
    }
    #back :hover {
        text-decoration: underline;
    }

    #a {
        display: flex;
        justify-content: space-between;
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
        margin: 0%;
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
        background-color: #000000;
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
        margin: 0%;
        background-color: #e4e4e4;
        font-size: 25px;
    }
</style>
</head>
<body>

<!-- 메인 배경 이미지 및 상단 로고, 버튼 -->
<header id="header">

    <div id="a">
        <div id="logo">
            <a href="<%= request.getContextPath() %>/LiveAirMain.jsp">
                <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="로고">
            </a>
        </div>
        <div id="back"> 
        <a href="<%= request.getContextPath() %>/user.jsp" style="text-decoration:none;">
 		 <button type="button">일반</button>
		</a>
        <a href="<%= request.getContextPath() %>/user.jsp" style="text-decoration:none;">
          <button type="button">관리자</button>
        </a>
        <a href="<%= request.getContextPath() %>/login.jsp" style="text-decoration:none;">
        <button type="button">회원가입</button>
        </a>
        </div>
    </div>

    <!-- 좌우 버튼 -->
    <div id="dlwjs" style="background-image: url('${pageContext.request.contextPath}/resources/img/left.png');"></div>
    <div id="ekdma" style="background-image: url('${pageContext.request.contextPath}/resources/img/right.png');"></div>
</header>

<!-- 로그인 안내 및 서비스 버튼 -->
<section>

    <div class="pad">
        <p id="fh">로그인하시고 바로 예약해보세요</p>
        <button type="button" id="qj">로그인</button>
    </div>

    <div id="ehd">
        <div class="item">
            <a href="calendar.jsp" style="text-decoration:none; color:inherit;">
                <div class="e">
                    <img src="${pageContext.request.contextPath}/resources/img/출장서비스예약.png" alt="출장 예약">
                </div>
                <p>출장 서비스 예약</p>
            </a>
        </div>
        <div class="item">
            <a href="check.jsp" style="text-decoration:none; color:inherit;">
                <div class="e">
                    <img src="${pageContext.request.contextPath}/resources/img/조회및변경.png" alt="예약 조회">
                </div>
                <p>예약 조회 및 변경</p>
            </a>
        </div>
        <div class="item">
            <a href="chatboot.jsp" style="text-decoration:none; color:inherit;">
                <div class="e">
                    <img src="${pageContext.request.contextPath}/resources/img/챗봇.png" alt="챗봇">
                </div>
                <p>챗봇 연결하기</p>
            </a>
        </div>
    </div>
</section>

<!-- 하단 푸터 -->
<footer id="c">
    <ul style="list-style: none;">
        <li>대표 번호 : 010-1111-1111 | 대표 이메일 : LiveAir@naver.com</li>
        <li>구매 문의 : 010-1111-1112 | 전화 상담 시간 : 9:00-6:00</li>
        <li>휴무 안내 : 공휴일 9:00-12:00 / 주말 휴무</li>
    </ul>
    <hr>
    <ul style="list-style: none;">
        <li>Live Air | 사업자 등록번호 : 123-45-67891 | 주소 : 울산광역시 남구 삼산중로100번길 26 케이엠빌딩</li>
    </ul>
</footer>





<script>

document.addEventListener('DOMContentLoaded', () => {
	const contextPath = '<%=request.getContextPath()%>';
    const header = document.getElementById('header');
    const leftBtn = document.getElementById('dlwjs');
    const rightBtn = document.getElementById('ekdma');

    // 이미지 경로 배열 직접 선언
    const images = [
        contextPath + '/resources/img/air.jpg',
        contextPath + '/resources/img/air2.jpg',
        contextPath + '/resources/img/air3.jpg'
    ];

    let currentIndex = 0;

    // 배경 이미지 업데이트 함수
    function updateSlide(index) {
        header.style.backgroundImage = `url("${images[index]}")`;
    }

    // 초기 배경 이미지 세팅
    updateSlide(currentIndex);

    // 왼쪽 버튼 클릭: 이전 이미지로 이동
    leftBtn.addEventListener('click', () => {
        currentIndex = (currentIndex - 1 + images.length) % images.length;
        updateSlide(currentIndex);
    });

    // 오른쪽 버튼 클릭: 다음 이미지로 이동
    rightBtn.addEventListener('click', () => {
        currentIndex = (currentIndex + 1) % images.length;
        updateSlide(currentIndex);
    });
});
</script>
</body>
</html>
