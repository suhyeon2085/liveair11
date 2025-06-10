<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>chatbot 문의</title>
<link rel="stylesheet" type="text/css" href="resources/css/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/footer.css">
<style type="text/css">

	* { text-align: center; margin-bottom: 1%; height : 100%; font-family: 'Pretendard', sans-serif; }

	* { font-family: 'Pretendard', sans-serif; }

	body {
		margin: 0;
		padding: 0;
		font-family: 'Pretendard', sans-serif;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		background-color: #f9f9f9;
		height : 90%;


		overflow-x: hidden;

	}
	#chat { padding : 30px;
		background-color: #ffffff;
	    box-shadow: 0 0 15px rgba(0,0,0,0.1);
	    border-radius: 10px;
	    height : 100%;

	    overflow: auto;

	    width: 40%;
	    overflow: auto;
	    text-align: center;
	    margin: 50px auto;
	    min-height: 50vh;
	    max-height: 70vh;
	    

	}

	div { border-radius: 20px; width: 40%; margin-left: auto; margin-right: auto; height: 20px;}
	.choice { border-color: #53a3d9; border-style: solid; border-width: 1px; margin-left: 0; width: 50%; padding: 3%; animation-name : moveLeft; animation-duration : 1s; }
	.client { border: 1px solid black; margin-left: 0; width: 60%; padding: 3%; animation-name : moveLeft; animation-duration : 1s; }
	.user { background-color: #53a3d9; margin-right: 0; width: 50%; padding: 3%; animation-name : moveRight; animation-duration : 1s; }
	select { border-style: none; }

	.choice, .client, .user { border-radius: 20px;  margin-left: auto; margin-right: auto; height: 20px; margin-bottom: 1%;}
	.choice { border-color: #53a3d9; border-style: solid; border-width: 1px; margin-left: 0; width: 50%; padding: 3%; animation-name : moveLeft; animation-duration : 1s; }
	.client { border: 1px solid black; margin-left: 0; width: 60%; padding: 3%; animation-name : moveLeft; animation-duration : 1s; }
	.user { background-color: #53a3d9; margin-right: 0; width: 50%; padding: 3%; animation-name : moveRight; animation-duration : 1s; }
	select { border-style: none; }
	a { color: rgb(65, 172, 215); text-decoration: none; }

	
	@keyframes moveLeft {
		0% {
			-webkit-transform: translateX(-20px);
			transform: translateX(-20px);
			opacity: 0;
		}
		100% {
			-webkit-transform: translateX(0);
			transform: translateX(0);
			opacity: 1;
		}
	}	
	@keyframes moveLeft {
		0% {
			-webkit-transform: translateX(-20px);
			transform: translateX(-20px);
			opacity: 0;
		}
		100% {
			-webkit-transform: translateX(0);
			transform: translateX(0);
			opacity: 1;
		}
	}
	
	@keyframes moveRight {
		0% {
			-webkit-transform: translateX(20px);
			transform: translateX(20px);
			opacity: 0;
		}
		100% {
			-webkit-transform: translateX(0);
			transform: translateX(0);
			opacity: 1;
		}

	}
	@media screen and (max-width: 1080px){
		#chat{
			width: 75%;
			height: 60vh;
		}
	}
	@media screen and (max-width: 480px){
		#chat{
			width: 100%;
			height: 60vh;
			margin:0;
			border-radius: 0px;
			padding : 15px;
			font-size: 15px;
			word-break: keep-all; /* 단어 단위로 줄바꿈 */
		    white-space: normal; /* 기본 줄바꿈 허용 */
		    overflow-wrap: break-word; /* 긴 단어가 있으면 자동 줄바꿈 */
    		box-sizing: border-box;
		}
		.choice, .user{
			width: 50%;
			height: auto;
		}
		.client{
			width: 50%;
			height: auto;
		}
		select{
			word-break: keep-all; /* 단어 단위로 줄바꿈 */
		    white-space: normal; /* 기본 줄바꿈 허용 */
		    overflow-wrap: break-word; /* 긴 단어가 있으면 자동 줄바꿈 */
		    width: 50%
		}

	}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script>
	var modelDic = 
	{ 
		'stand':'스탠드형 에어컨', 
		'wall':'벽걸이(창문) 에어컨', 
		'hmulti':'홈멀티 에어컨', 
		'system':'시스템(천장형/스탠드/벽걸이) 에어컨', 
		'aircon':'냉난방기', 
		'heater':'온풍기' 
	};
	var typeDic = 
	{ 
		'frost':'성에', 
		'dew':'이슬', 
		'gas':'가스 누설', 
		'noise':'소음', 
		'smell':'냄새', 
		'leak':'누수', 
		'etc':'기타' 
	};
	var locDic = 
	{ 
		'A':'베란다 밖 난간', 
		'B':'건물의 외벽 앵글', 
		'C':'건물 밖 실외기실', 
		'D':'옥상', 
		'E':'실내 실외기실', 
		'F':'베란다 내부', 
		'G':'1층 또는 지면', 
		'H':'2단 설치' 
	};
	var modelCostDic = 
	{ 
		'stand':'10000', 
		'wall':'20000', 
		'hmulti':'30000', 
		'system':'40000', 
		'aircon':'50000', 
		'heater':'60000' 
	};
	var typeCostDic = 
	{ 
		'frost':'1', 
		'dew':'2', 
		'gas':'3', 
		'noise':'4', 
		'smell':'5', 
		'leak':'6', 
		'etc':'7' 
	};
	var questionDic = 
	{ 
		'Q1':'A/S 가격을 예상하고 싶어', 
		'Q2':'예약하고 싶어', 
		'Q3':'예약을 조회하고 싶어', 
		'Q4':'상담사 연결해줘', 
		'Q5':'상담을 종료할래' 
	};
	
	$("document").ready(function() {
		var chat = $("#chat");
		let str = "";
		
		$("#chatStart").on("click", function() {
			createUserDiv("상담을 시작해줘");
			var chatPlayer = 0;

			chatDisplay(chatPlayer);
			chatPlayer++;
			chatFlow();
			scrollDown();
			
			function chatFlow()
			{
				$(".question1").on("click", function() {
					createUserDiv(questionDic['Q1']);
					viewModelSelect();
					scrollDown();

					$("#model").change(function() {
						createUserDiv(modelDic[$("#model").val()]);
						viewTypeSelect();						
						scrollDown();

						$("#type").change(function() {
							createUserDiv(typeDic[$("#type").val()]);
							expectPriceResult();
							classRemover();
							chatDisplay(chatPlayer);							
							chatFlow();		
							scrollDown();

						})	
					})				
				})
				$(".question2").on("click", function() {
					createUserDiv(questionDic['Q2']);
					createClientDiv("해당 서비스는 로그인이 필요합니다");
					movePage("예약페이지로 이동", "/toReserve");
					classRemover();
					chatDisplay(chatPlayer);							
					chatFlow();
					scrollDown();

				})
				
				$(".question3").on("click", function() {
					createUserDiv(questionDic['Q3']);
					createClientDiv("해당 서비스는 로그인이 필요합니다");
					movePage("조회페이지로 이동", "/check");
					scrollDown();
				
					classRemover();
					chatDisplay(chatPlayer);							
					chatFlow();
				})
				
				/* 미완 */
				$(".question4").on("click", function() {
					createUserDiv(questionDic['Q4']);
					CSConnect();
					scrollDown();

				})
				$(".question5").on("click", function() {
					createUserDiv(questionDic['Q5']);
					createClientDiv("상담이 종료되었습니다.");
					chatFlow = false;
					scrollDown();

				})				
			}
		})

	})
	
	/* 채팅 선택창을 만들어줌 */
	function chatDisplay(chatPlayer) {

		if (chatPlayer == 0)
		{
			createClientDiv("어떤 상담을 도와드릴까요?");	
		} else {
			createClientDiv("다른 상담이 필요하신가요?");
		}
		
		var temp = 1;
		
		for (var key in questionDic)
		{
			var div = document.createElement("div");
			div.className = 'choice question' + temp;
			var comment = document.createTextNode(questionDic[key]);
			div.appendChild(comment);
			document.getElementById("chat").appendChild(div);
			temp++;
		}
		scrollDown();
	}
	
	/* 기종 선택 셀렉트 박스 생선 */
	function viewModelSelect()
	{	
		createClientDiv("에어컨 기종을 선택해주세요");
		
		var div2 = document.createElement("div");
		div2.className = 'choice';
		div2.id = 'answer';
		
		var modelSelect = document.createElement("select");
		modelSelect.id = 'model';
		
		var model = document.createElement("option");
		model.value = "";
		model.text = "[기종 선택]";
		model.option = 'default';
		modelSelect.appendChild(model);
				
		for (var key in modelDic)
		{
			var model1 = document.createElement("option");
			model1.value = key;
			model1.text = modelDic[key];
			modelSelect.appendChild(model1);
		}
		
		document.getElementById("chat").appendChild(div2);
		document.getElementById("answer").appendChild(modelSelect);
		scrollDown();

	}
	
	/* 고장증상(타입)을 선택하는 셀렉트박스 생성 */
	function viewTypeSelect() {

		createClientDiv("증상을 선택해주세요");
		
		var div2 = document.createElement("div");
		div2.className = 'choice';
		
		var typeSelect = document.createElement("select");
		typeSelect.id = 'type';
		
		var type = document.createElement("option");
		type.value = "";
		type.text = "[증상 선택]";
		type.option = 'default';
		typeSelect.appendChild(type);
		
		for (var key in typeDic)
		{
			var type1 = document.createElement("option");
			type1.value = key;
			type1.text = typeDic[key];
			typeSelect.appendChild(type1);
		}

		div2.appendChild(typeSelect);
		document.getElementById("chat").appendChild(div2);
		scrollDown();

	}
	
	/* 선택한 기종과 고장증상에 따라 임의의 수리견적을 보여줌 */
	function expectPriceResult() {
		var model = 0;
		var type = 0;
	
		var result = modelCostDic[$("#model").val()] * typeCostDic[$("#type").val()];
		var div1 = document.createElement("div");
		div1.className = "client";
		var comment1 = document.createTextNode("예상 가격은" + result + "입니다");
		div1.appendChild(comment1);
		document.getElementById("chat").appendChild(div1);
		scrollDown();

	}
	
	function movePage(comment, url) {

		var link = document.createElement("a");
		link.setAttribute("href", url);
		var div = document.createElement("div");
		div.className = 'choice';
		var text = document.createTextNode(comment);
		div.appendChild(text);
		link.appendChild(div);
		document.getElementById("chat").appendChild(link);

	}
	
	/* 채팅 반복 시 class와 id가 중복되지 않도록 상담이 끝난 내용의 클래스와 아이디를 삭제함 */
	function classRemover() {
		var temp = document.getElementsByClassName("choice");
		for (var i = 0; i < temp.length; i++)
		{
			temp[i].classList.remove('question1', 'question2', 'question3', 'question4', 'question5');
		}
	}
	
	function CSConnect() {
		//상담원이 어디있다고 연결을 하죠 황당
		createClientDiv("상담원과 연결중입니다.");
		createClientDiv("잠시만 기다려주세요.");		
	}
	
	/* 자동 스크롤을 하고 싶은데 고민중... */
	function scrollDown() {
		chat.scrollTop = chat.scrollHeight;

	}
	
	function createClientDiv(comment) {
			var div = document.createElement("div");
			div.className = 'client';
			var temp = document.createTextNode(comment);
			div.appendChild(temp);
			document.getElementById("chat").appendChild(div);
	}
	
	function createUserDiv(comment) {
		var div = document.createElement("div");
		div.className = 'user';
		var temp = document.createTextNode(comment);
		div.appendChild(temp);
		document.getElementById("chat").appendChild(div);
	}
	
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div id="chat">

	<div class="client">챗봇 상담 페이지입니다</div>
	<div class="client">상담을 시작할게요</div>
	<div class="choice" id="chatStart">상담을 시작해줘</div>

</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>