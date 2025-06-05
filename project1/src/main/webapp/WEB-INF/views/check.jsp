<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 눌렀을때 로그인 여부 확인  -->
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
%>
    <script type="text/javascript">
        alert("로그인하고 이용해주십시오");
        location.href = "/LiveAirMain"; 
    </script>
<%
        return;
    }
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>에약조회 및 삭제</title>

  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Pretendard', sans-serif;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      background-color: #f9f9f9;
    }

    p {
      color: rgb(0, 156, 217);
      font-size: 40px;
      margin-bottom: 40px;
      font-weight: bold;
    }

    table {
      border-collapse: collapse;
      margin-bottom: 50px;
      background-color: white;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    table td {
      border: 1px solid rgb(255, 255, 255);
      padding: 30px 50px;
      font-size: 25px;
      text-align: left;
      min-width: 250px;
      position: relative;
    }

    table td:first-child {
      border-left: 4px solid rgb(65, 172, 215); 
      font-weight: bold;
      background-color: #f0f0f0;
    }

    button {
      padding: 20px 25px;
      margin: 0 5px;
      font-size: 20px;
      background-color: rgb(65, 172, 215);
      color: rgb(255, 255, 255);
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-weight: bold;
    }

    button:hover {
      background-color: white;
      color: rgb(65, 172, 215);
      border: 1px solid rgb(65, 172, 215);

    }
    .button-container{
      display: flex;
      justify-content: center;
      gap: 10px; 
    }

  #a {
    width: 1000px;   
    height: 650px;
    max-width: 1000px;  
    padding: 50px;           
    background-color: #ffffff;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
    border-radius: 10px;
  }

    </style>
</head>
<body>

<div id="a">

    <p>예약 조회 하기</p>

 
    <table>
    <tr>
        <td>id</td>
        <td>${reserve.name}</td>
    </tr>
    <tr>
        <td>제품명ǰ</td>
        <td>${reserve.model}</td>
    </tr>
    <tr>
        <td>증상</td>
        <td>${reserve.type}</td>
    </tr>
    <tr>
        <td>날짜</td>
        <td>${reserve.date}</td>
    </tr>
    </table>

   <form action="/reserve/delete" method="post" style="display: inline;">
    <input type="hidden" name="num" value="${reserve.num}" />
    <button type="submit">취소하기</button>
</form>

    <a href="http://127.0.0.1:5500/2%EB%A9%94%EC%9D%B8%ED%99%88.html">
    <button type="button">메인으로 돌아가기</button></a>
    </div>

</div>

</body>
</html>