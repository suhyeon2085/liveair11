<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>회원가입</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      width: 100%;
      background-color:antiquewhite;
      font-family: 'Noto Sans', sans-serif;
    }

    #tkd {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    #log {
      background-color: white;
      padding: 30px;
      width: 700px;
      height: 1000px;
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


    .log-content {
      text-align: center;
      padding: 30px;
    }

    .form-group {
      margin-bottom: 20px;
      text-align: left;
      margin-left: calc(50% - 150px);
    }

    .form-group label {
      display: block;
      margin-bottom: 6px;
      font-size: 18px;
      font-weight: bold;
      color: rgb(105, 104, 104);
    }

    .form-group input {
      width: 300px;
      height: 40px;
      font-size: 16px;
      border: none;
      border-bottom: 2px solid #999;
      padding: 10px;
      outline: none;
    }

    .form-group input:focus {
      border-bottom: 3px solid #1d1d1d;
    }

    .input-container {
      position: relative;
      width: 300px;
    }

    .input-container input {
      width: 100%;
    }

    .toggle-eye {
      position: absolute;
      top: 50%;
      right: 10px;
      transform: translateY(-50%);
      cursor: pointer;
      font-size: 18px;
      color: #555;
    }

    #btn {
      background-color: antiquewhite;
      color: black;
      border: none;
      padding: 12px 24px;
      margin-top: 20px;
      border-radius: 8px;
      font-size: 20px;
      font-weight: bold;
      cursor: pointer;
      transition: background-color 0.3s ease, transform 0.2s ease;
    }

    #lo {
      width: 150px;
      margin-bottom: 30px;
    }

    /*유효성 검사 에러 글자 css*/
    .error-msg {
    color: red;
    font-size: 14px;
    margin-top: 4px;
    height: 18px; /* 공간을 항상 유지 */
    }

  </style>
</head>
<body>
  <div id="tkd">
    <div id="log">
      <p id="p">◀ 회원가입</p>
      <div class="log-content">
        <img src="pass.png" id="lo" />

        <div class="form-group">
          <label for="username">아이디를 입력해주세요</label>
          <input type="text" id="username" placeholder="아이디 입력" />
           <div id="usernameError" class="error-msg"></div>
        </div>

        <div class="form-group">
          <label for="passwordInput">비밀번호</label>
          <div class="input-container">
            <input type="password" id="passwordInput" placeholder="비밀번호 입력" />
            <span class="toggle-eye" onclick="togglePassword()">👁️</span>
             <div id="passwordError" class="error-msg"></div>
          </div>
        </div>

        <div class="form-group">
          <label for="name">이름</label>
          <input type="text" id="name" placeholder="이름 입력" />
         <div id="nameError" class="error-msg"></div>
        </div>

        <div class="form-group">
          <label for="birth">생년월일</label>
          <input type="text" id="birth" placeholder="예: 20010509" />
           <div id="birthError" class="error-msg"></div>
        </div>

        <button type="button" id="btn" onclick="validateForm()">확인</button>
      </div>
    </div>
  </div>

  <script>
    function togglePassword() {
      const input = document.getElementById("passwordInput");
      const icon = document.querySelector(".toggle-eye");
      if (input.type === "password") {
        input.type = "text";
        icon.textContent = "🔒";
      } else {
        input.type = "password";
        icon.textContent = "👁️";
      }
    }


function validateForm() {
  const username = document.getElementById("username").value.trim();
  const password = document.getElementById("passwordInput").value.trim();
  const name = document.getElementById("name").value.trim();
  const birth = document.getElementById("birth").value.trim();

  // 오류 메시지 초기화
  document.getElementById("usernameError").innerText = "";
  document.getElementById("passwordError").innerText = "";
  document.getElementById("nameError").innerText = "";
  document.getElementById("birthError").innerText = "";

  let isValid = true;

  const idRegex = /^[A-Za-z0-9]{7,}$/;
  if (!idRegex.test(username)) {
    document.getElementById("usernameError").innerText = "영문+숫자 포함 7자 이상 입력해주세요.";
    isValid = false;
  }

  const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{7,}$/;
  if (!pwRegex.test(password)) {
    document.getElementById("passwordError").innerText = "영문+숫자+특수문자 포함 7자 이상 입력해주세요.";
    isValid = false;
  }

  if (name === "") {
    document.getElementById("nameError").innerText = "이름을 입력해주세요.";
    isValid = false;
  }

  const birthRegex = /^\d{8}$/;
  if (!birthRegex.test(birth)) {
    document.getElementById("birthError").innerText = "8자리 숫자 (예: 20010509)로 입력해주세요.";
    isValid = false;
  }

  if (isValid) {
    alert("회원가입 입력이 완료되었습니다!");
    window.location.href = 'http://127.0.0.1:5500/home.html';
  }

 
}

</script>
</body>
</html>
