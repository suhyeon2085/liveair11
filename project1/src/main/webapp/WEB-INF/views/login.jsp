<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<style>
    body{
        margin: 0%;
        padding: 0%;
        width: 100%;
    }
        /*�ڽ� ������ ����*/
    #tkd{
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background-color: #f5f5f5;
      background-color: rgb(229, 229, 229);
    }

    /*�ڽ� �ȿ� div�� ����*/
    #log {
      background-color: rgb(255, 254, 252);
      padding: 30px;
      width: 800px;
      height: 1100px;
      border-radius: 30px;
      box-shadow: 0 0 10px 2px rgba(0, 0, 0, 0.1); 
    }

    input {
    width: 300px;
    height: 40px;
    font-size: 16px;
    border: none;
    border-bottom: 2px solid #999; /* ���ٸ� *//*�׵θ� ���ٸ�*/
    margin: 20px 0;
    padding: 10px;
    outline: none; /* ��Ŀ�� �� �Ķ� �׵θ� ���� */
    }   

    input:focus {
    border-bottom: 2px solid #000; /* ��Ŀ�� �� ������ */
    }
    
    #p{
    font-size: 32px;
    font-family: 'Noto Sans', sans-serif;
    font-weight: bold;
    text-align: left;
    margin-bottom: 7px;
    }

    .log-content {
    text-align: center;
    padding: 50px;
    }

    #lo{
    margin-bottom: 30px;
    }

    #btn{
    background-color: rgb(210, 210, 210);
    color: rgb(0, 0, 0);
    border: none;
    padding: 12px 24px;
    margin: 18px;
    border-radius: 8px;
    font-size: 20px;
    font-weight: bold;
    font-family: 'Noto Sans' sans-serif;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
    }

.input-container input {
  padding-right: 10px; /* ������ �� ������ ���� Ȯ�� */
}
.input-container {
  position: relative;
  width: 330px;
  margin: 20px auto;
}
.toggle-eye {
  position: absolute;
  top: 50%;
  right: 20px;
  transform: translateY(-50%);
  cursor: pointer;
  font-size: 18px;
  color: #555;
}

label {
  display: block;
  font-size: 21px;
  font-family: 'Noto Sans', sans-serif;
  font-weight: bold;
  color: rgb(105, 104, 104);
}



.form-group {
  text-align: left;
  margin-bottom: 20px;
}

.form-group label {
  display: block;
  margin-bottom: 0.5em;; /* label�� input ���� ���� */
  font-size: 18px;
  font-family: 'Noto Sans', sans-serif;
   margin-left: calc(50% - 150px); 
  font-weight: bold;
  color: rgb(105, 104, 104);
}

.form-group input {
  width: 300px;
  height: 40px;
  font-size: 16px;
  border: none;
  border-bottom: 2px solid #999;
  margin-left: calc(50% - 150px); 
  padding: 10px;
  outline: none;
}
.form-group input:focus {
  border-bottom: 2px solid #000;
}

</style>
</head>
<body>

</body>
</html>