<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>������ȸ ������</title>
  <style>
    body {
      margin: 0;
      font-family: 'Noto Sans', sans-serif;
    }

    #main {
      font-size: 70px;
      font-weight: bold;
      text-align: center;
      margin: 30px 0;
      line-height: 1;
      cursor: pointer;
    }

    #main:hover {
      border-bottom: 3px solid #1d1d1d;
      padding-bottom: 10px;
    }

    #phone-box {
      position: relative;
      width: 900px;
      padding: 20px 20px;
      text-align: left;
      font-size: 60px;
      font-weight: bold;
      color: #000;
      border: none;
      border-radius: 20px;
      overflow: hidden;
      cursor: pointer;
      box-sizing: border-box;
      line-height: normal;
      margin-left: 10px;
    }

    #phone-box::before {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      height: 0%;
      width: 100%;
      background-color: #e6e6e6;
      z-index: 0;
      transition: height 0.4s ease;
    }

    #phone-box:hover::before {
      height: 100%;
    }

    #phone {
      position: relative;
      z-index: 1;
    }

    #fl {
      font-size: 20px;
      margin: 0 auto 10px 20px;
      text-align: left;
      display: block;
    }

    /* �̸�, ��ȭ��ȣ �Է� */
    .form-group {
      display: flex;
      align-items: center;
      margin: 10px 30px;
      max-width: 1200px; /* �˳��ϰ� �ø� */
      position: relative;
    }

    .form-group label {
      flex: 0 0 150px;
      font-size: 30px;
      margin-left: 10px;
      padding-right: 20px;
      margin-top: 20px;
    }

    /* �⺻ input ��Ÿ�� */
    .form-group input[type="text"] {
      width: 100%;
      padding: 10px;
      font-size: 27px;
      box-sizing: border-box;
      border-radius: 5px;
      border: 1px solid black;
    }

    /* �޴���ȭ input + ��ư �����̳� */
    .input-with-btn {
      display: flex;
      flex-grow: 1; /* ������� �ִ��� ���� */
      margin-top: 20px;
    }

    .input-with-btn input {
      flex-grow: 1;
      font-size: 27px;
      padding: 10px;
      border-radius: 5px;
      border: 1px solid black;
      box-sizing: border-box;
    }

    .input-with-btn button {
      margin-left: 10px;
      padding: 8px 12px;
      font-size: 22px;
      border: 1px solid black;
      border-radius: 5px;
      background-color: white;
      color: black;
      height: 57px;
      white-space: nowrap;
      cursor: pointer;
      flex: none;
      margin-top: 0;
    }

    #z {
      padding: 25px;
    }

    input:hover::placeholder {
      color: black;
    }

    input::placeholder {
      color: black;
    }

    .button-container {
      text-align: center;
      margin-top: 30px;
    }

    .search-btn {
      font-size: 18px;
      padding: 12px 30px;
      background-color: #1d1d1d;
      color: white;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .search-btn:hover {
      background-color: #ffffff;
      color: black;
      border: 1px solid black;
    }

    .error-message {
      position: absolute;
      left: 100%;
      margin-left: 20px;
      top: 50%;
      transform: translateY(-50%);
      color: red;
      font-size: 23px;
      white-space: nowrap;
      z-index: 10;
    }

  </style>
</head>
<body>
  <div>
    <a href="http://127.0.0.1:5500/2%EB%A9%94%EC%9D%B8%ED%99%88.html">
      <img src="logo.png" style="width: 100px;" />
    </a>
    <hr />

    <p style="font-size: 25px; margin-left: 30px;">Ȩ &gt; ������ȸ �� ����</p>

    <p id="main">���� ��ȸ&nbsp;/&nbsp;����</p>

    <span id="fl"><span style="color: red">*</span>�ʼ� �Է� �׸�</span>
    <div id="phone-box">
      <div id="phone">�޴��� �������� �ѹ��� ��ȸ</div>
    </div>
    <hr />

    <div id="z">
      <div class="form-group">
        <label><span style="color: red">*</span> �̸�</label>
        <input type="text" placeholder="�̸� �Է�" />
      </div>

      <div class="form-group">
        <label><span style="color: red">*</span> �޴���ȭ</label>
        <div class="input-with-btn">
          <input
            type="text"
            placeholder="�޴���ȭ ��ȣ �Է� '-'���� �Է��ϼ���"
          />
          <button type="button">������ȣ �߼�</button>
        </div>
      </div>

      <div class="form-group">
        <label>&nbsp;</label>
        <input
          type="text"
          placeholder="������ȣ �Է�"
          id="dw"
          style="background-color: rgb(170, 169, 169)"
        />
      </div>
    </div>

    <div class="button-container">
      <button type="button" class="search-btn">��ȸ</button>
    </div>
  </div>

  <script>
    document.addEventListener('DOMContentLoaded', () => {
      const searchBtn = document.querySelector('.search-btn');

      searchBtn.addEventListener('click', () => {
        const nameInput = document.querySelector('input[placeholder="�̸� �Է�"]');
        const phoneInput = document.querySelector(
          "input[placeholder=\"�޴���ȭ ��ȣ �Է� '-'���� �Է��ϼ���\"]"
        );
        const codeInput = document.querySelector('input[placeholder="������ȣ �Է�"]');

        const existingErrors = document.querySelectorAll('.error-message');
        existingErrors.forEach((err) => err.remove());

        let isValid = true;

        function showError(inputElem, message) {
          const error = document.createElement('div');
          error.className = 'error-message';
          error.textContent = message;

          const parent = inputElem.closest('.form-group');
          parent.appendChild(error);

          isValid = false;
        }

        if (!nameInput.value.trim()) {
          showError(nameInput, '�̸��� �Է��ϼ���');
        }

        if (!phoneInput.value.trim()) {
          showError(phoneInput, '��ȭ��ȣ�� �Է��ϼ���');
        }

        if (!codeInput.value.trim()) {
          showError(codeInput, '������ȣ�� �Է��ϼ���');
        }

        if (isValid) {
          alert(
            `�̸�: ${nameInput.value}\n��ȭ��ȣ: ${phoneInput.value}\n������ȣ: ${codeInput.value}\n��ȸ �����մϴ�!`
          );
        }
      });
    });
  </script>
</body>
</html>
