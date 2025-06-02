<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>���� Ȯ�� �� ����</title>

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
    width: 1000px;              /* ��ü ȭ���� 70% �ʺ� */
    height: 650px;
    max-width: 1000px;        /* �ִ� �ʺ� ���� */
    padding: 50px;           /* ���� ���� */
    background-color: #ffffff;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
    border-radius: 10px;
  }

    </style>
</head>
<body>

<div id="a">

    <p>���� ���� ����</p>

    <table>
    <tr>
        <td>������</td>
        <td>�����ڸ�</td>
    </tr>
    <tr>
        <td>��ǰ</td>
        <td>��ǰ ��</td>
    </tr>
    <tr>
        <td>����</td>
        <td>���� ��</td>
    </tr>
    <tr>
        <td>��¥</td>
        <td>��¥�� ��¥ �޷¿� �Է��ϱ�</td>
    </tr>
    </table>
    
    <a href="calender.jsp">
    <div class="button-container">
    <button type="button">�����ϱ�</button>
    </a>

    <a href="http://127.0.0.1:5500/2%EB%A9%94%EC%9D%B8%ED%99%88.html">
    <button type="button">�������� ���ư���</button></a>
    </div>

</div>

</body>
</html>