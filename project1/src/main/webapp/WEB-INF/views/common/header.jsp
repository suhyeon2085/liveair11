<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<header id="header">
	<div id="LogoWrap">
	        <div id="logo">
	            <a href="<%= request.getContextPath() %>/">
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
	                <button class="logoutBTN" type="submit">로그아웃</button>
	            </form>
	        </c:when>
	
	        <c:otherwise>
	            <p style="display:inline; font-weight:bold;">${sessionScope.user.id}님 환영합니다!</p>
	            <img src="${pageContext.request.contextPath}/resources/img/logout.png" style="width: 40px; vertical-align: middle;">
	            <form action="${pageContext.request.contextPath}/logout" method="get" style="display:inline;">
	                <button class="logoutBTN" type="submit">로그아웃</button>
	            </form>
	        </c:otherwise>
	    </c:choose>
	
		</div>
	</div>
</header>