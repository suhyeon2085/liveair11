<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LiveAirMain</title>

    <!-- Slick Carousel CSS & jQuery -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css">
</head>
<style>
#dlwjs { left: 12%; background-image: url('<%= request.getContextPath() %>/resources/img/left.png'); }
#ekdma { right: 12%; background-image: url('<%= request.getContextPath() %>/resources/img/right.png'); }
@media screen and (max-width: 1080px){
	#dlwjs { left: 7%; background-image: url('<%= request.getContextPath() %>/resources/img/left.png'); }
	#ekdma { right: 7%; background-image: url('<%= request.getContextPath() %>/resources/img/right.png'); }
}
</style>
<body>

<c:if test="${param.cancel eq 'success'}">
    <script>alert("예약이 성공적으로 취소되었습니다.");</script>
</c:if>


<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div id="banner">
        <div class="single-item">
	        
	        
	          <!-- 추가 업로드된 슬라이드 이미지 반복 출력 -->
    <c:forEach var="img" items="${sliderImages}">
        <div>
            <img src="${pageContext.request.contextPath}/slider/image?id=${img.id}&t=${img.timestamp}" alt="추가 슬라이드 이미지" />
        </div>
    </c:forEach>
	        
	    </div>
        <!-- 화살표 버튼 위치는 여기로 옮기기 -->
        <div id="dlwjs"></div>
        <div id="ekdma"></div> 
        
        
        
    </div>


<section>

<!-- 로그인이 완료됐다면 div pad는 없어지기  -->
<c:if test="${empty sessionScope.user}">
    <div class="pad">
        <p id="fh">로그인하시고 바로 예약해보세요</p>
        <button type="button" id="qj" onclick="location.href='<%= request.getContextPath() %>/login'">로그인</button>
    </div>
</c:if>


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
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

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