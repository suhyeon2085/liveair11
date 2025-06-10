<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>슬라이더 이미지 관리</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        img.preview {
            width: 300px;
            height: auto;
            margin-bottom: 10px;
            border-radius: 8px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">메인 슬라이더 이미지 관리</h2>

    <!-- 이미지 업로드 -->
    <form action="${pageContext.request.contextPath}/uploadSliderImage" method="post" enctype="multipart/form-data" class="mb-4">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <div class="input-group">
            <input type="file" name="file" class="form-control" required />
            <button type="submit" class="btn btn-success">이미지 추가</button>
        </div>
    </form>

    <div class="row">
        <c:forEach var="img" items="${imageList}">
            <div class="col-md-4 mb-4">
                <img src="${pageContext.request.contextPath}/slider/image?id=${img.id}" alt="슬라이드 이미지" class="img-fluid preview"/>

                <!-- 이미지 삭제 -->
                <form action="${pageContext.request.contextPath}/deleteSliderImage" method="post" class="mt-2">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input type="hidden" name="id" value="${img.id}" />
                    <button type="submit" class="btn btn-danger btn-sm">삭제</button>
                </form>

                <!-- 이미지 교체 -->
                <form action="${pageContext.request.contextPath}/updateImage" method="post" enctype="multipart/form-data" class="mt-2">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input type="hidden" name="id" value="${img.id}" />
                    <div class="input-group">
                        <input type="file" name="newFile" class="form-control" required />
                        <button type="submit" class="btn btn-primary btn-sm">교체</button>
                    </div>
                </form>
            </div>
        </c:forEach>
    </div>

    <a href="${pageContext.request.contextPath}/calendar" class="btn btn-secondary mt-4">← 관리자 일정으로 돌아가기</a>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>