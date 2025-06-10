<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <style>  
        body, form {
            margin: 0;
            padding: 0;
            width: 100%;
            background-color: antiquewhite;
        }
        #main {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        #log {
            background-color: rgb(255, 254, 252);
            padding: 30px;
            width: 700px;
            border-radius: 30px;
            box-shadow: 0 0 10px 2px rgba(0, 0, 0, 0.1);
        }
        #p {
            font-size: 35px;
            font-family: 'Noto Sans', sans-serif;
            font-weight: bold;
            text-align: left;
            margin-bottom: 50px;
        }
        #lo {
            padding-bottom: 40px;
        }
        input {
            width: 300px;
            height: 40px;
            font-size: 16px;
            border-radius: 10px;
            border: none;
            margin: 20px 0;
            padding: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: rgb(253, 242, 228);
        }
        .input-container {
            position: relative;
            width: 330px;
            margin: 20px auto;
        }
        .input-container input {
            padding-right: 30px;
        }
        .toggle-eye {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 20px;
            color: #555;
        }
        label {
            font-size: 21px;
            font-family: 'Noto Sans', sans-serif;
            font-weight: bold;
            color: rgb(105, 104, 104);
        }
        #btn {
            background-color: rgb(253, 242, 228);
            color: rgb(0, 0, 0);
            border: none;
            padding: 12px 30px;
            margin: 20px;
            margin-bottom: 30px;
            border-radius: 8px;
            font-size: 20px;
            font-weight: bold;
            font-family: 'Noto Sans', sans-serif;
            cursor: pointer;
            box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.15);
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .log-content {
            text-align: center;
            margin-top: 0;
        }
         .social-login a {
            text-decoration: none;
            color: black;
            
        }
        .social-login {
            text-align: center;
            margin-top: 10px;
        }
    </style>
    <script>
        function togglePassword() {
            const input = document.getElementById("passwordInput");
            const icon = document.querySelector(".toggle-eye");
            if (input.type === "password") {
                input.type = "text";
                icon.textContent = "🔒";
            } else {
                input.type = "password";
                icon.textContent = "👀";
            }
        }
    </script>
</head>
<body>
    <form action="/main" method="post">
        <div id="main">
            <div id="log">
                <p id="p">◀ 로그인</p>
                <div class="log-content">
                    <img src="<c:url value='/resources/img/lg.png' />" style="width: 150px;" id="lo" alt="로고 이미지" /><br>
                    <label>아이디를 입력해주세요</label><br>
                    <input type="text" name="id" placeholder="아이디 입력"><br>
                    <label>비밀번호</label><br>
                    <div class="input-container">
                        <input type="password" name="password" id="passwordInput" placeholder="비밀번호 입력">
                        <span class="toggle-eye" onclick="togglePassword()">👀</span>
                    </div>
                    <button type="submit" id="btn">로그인</button>
                    <c:if test="${param.error == 'true' }">
                        <p style="color: red;">아이디 또는 비밀번호가 올바르지 않습니다.</p>
                    </c:if>
                    <p style="font-size: 20px;">|&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/join" style="text-decoration: none; color: black;">회원가입 하러가기</a>&nbsp;&nbsp;|</p>
                </div>

                <div class="social-login">
                    <button type="button" id="btn">🔽 간편 로그인 하기 🔽</button><br>
                    <a href="https://accounts.kakao.com/login/?continue=https%3A%2F%2Fcs.kakao.com%2Fhelps%3Fcategory%3D25#login">
                        <img src="<c:url value='/resources/img/kakao.png' />" style="width: 50px;" alt="카카오톡 로그인" />
                    </a>
                    <a href="https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fwww.naver.com/">
                        <img src="<c:url value='/resources/img/naver.png' />" style="width: 57px;" alt="네이버 로그인" />
                    </a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
