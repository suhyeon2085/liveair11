<%@page import="org.zerock.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 안녕 -->
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
        <td>이름</td>
        <td>${member.name}</td>
    </tr>
      <tr>
        <td>전화번호</td>
        <td>${member.phone}</td>
    </tr>
    <tr>
        <td>제품명</td>
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
        <tr>
        <td>주소</td>
        <td>${member.address}</td>
    </tr>
    </table>

   <!-- <form action="/delete" method="post" style="display: inline;">
    <button type="submit">취소하기</button>
</form>

   <form action="/modReserve" method="post" style="display: inline;">
    <button type="submit">예약 변경</button>
</form> -->

<a href="/delete"">
  <button type="button">예약 취소</button>
</a>

<a href="/userCalendar">
  <button type="button" onclick="remove()">예약 변경</button>
</a>

<a href="/">
<button type="button">메인으로 돌아가기</button></a>
</div>

</div>

<script>
function remove(){
	if{
		
	}
	else{
		
	}
	
}
</script>
</body>
</html>