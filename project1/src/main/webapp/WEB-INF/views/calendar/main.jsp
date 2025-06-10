<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>메인 페이지</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Slick Slider CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

    <style>
        body {
            padding: 20px;
        }
        .slick-slider img {
            width: 100%;
            height: auto;
            max-height: 400px; /* 너무 커지지 않도록 제한 */
            object-fit: contain; /* 이미지 전체를 보이게 */
        }
        .slick-slider {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="mb-4">메인 슬라이더</h2>

    <!-- 슬라이더 영역 -->
    <div class="slick-slider">
        <c:forEach var="img" items="${sliderImages}">
            <div>
                <img src="${pageContext.request.contextPath}/upload/${img.fileName}" alt="슬라이드 이미지" class="img-fluid" />
            </div>
        </c:forEach>
    </div>

    <p>슬라이더 아래에 다른 콘텐츠를 추가할 수 있어요.</p>
</div>

<!-- jQuery (Slick 필수) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Slick JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- 슬라이더 초기화 -->
<script>
    $(document).ready(function(){
        $('.slick-slider').slick({
            autoplay: true,
            autoplaySpeed: 3000,
            dots: true,
            arrows: false,
            infinite: true,
            slidesToShow: 1,
            slidesToScroll: 1
        });
    });
</script>

</body>
</html>