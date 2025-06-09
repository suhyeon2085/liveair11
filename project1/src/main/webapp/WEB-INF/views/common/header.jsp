<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#header {
		padding: 0 15%;
		box-shadow: 0 10px 10px lightgrey;
		margin-bottom: 50px;
	}
    #logo img {
        width: 80px;
        height: auto;
        float: left;
    }
   #a {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px;
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
	
	#c {
        padding: 3%;
        background-color: #e4e4e4;
        font-size: 15px;
    }

    #c ul {
        list-style: none;
        padding-left: 0;
    }
</style>
</head>
<body>
<header id="header">
	<div id="a">
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
	            <p style="display:inline; font-weight:bold;">${sessionScope.user.id}님 환영합니다!</p>
	            <img src="${pageContext.request.contextPath}/resources/img/logout.png" style="width: 40px; vertical-align: middle;">
	            <form action="${pageContext.request.contextPath}/logout" method="get" style="display:inline;">
	                <button type="submit">로그아웃</button>
	            </form>
	        </c:otherwise>
	    </c:choose>
	
		</div>
	</div>
</header>