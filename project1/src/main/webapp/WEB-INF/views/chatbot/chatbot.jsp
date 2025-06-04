<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>chatbot 문의</title>
<style type="text/css">
	* { text-align: center; margin-bottom: 1%}
	#chat {margin-bottom: 30%; }
	div { border-radius: 20px; width: 40%; margin-left: auto; margin-right: auto;}
	.choice { border-color: #53a3d9; border-style: solid; border-width: 1px; margin-left: 0; height: 50%; width: 50%; padding: 3%; }
	.client { border: 1px solid black; margin-left: 0; height: 50%; width: 60%; padding: 3%;}
	.user { background-color: #53a3d9; margin-right: 0; height: 50%; width: 50%; padding: 3%;}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script>
	
	$("document").ready(function() {
		var chat = $("#chat");
		let str = "";

		$("#chatStart").on("click", function() {
			div1 = document.createElement("div");
			var comment1 = document.createTextNode("상담을 시작해줘");
			div1.appendChild(comment1);
			div1.className = 'user';
			document.getElementById("chat").appendChild(div1);
			var chatPlayer = 0;

			chatDisplay(chatPlayer);
			chatPlayer++;
			chatFlow();
			scrollDown();
			function chatFlow()
			{
				$(".question1").on("click", function() {
					str = "<div class='user'>A/S 가격을 예상하고 싶어</div>";
					chat.append(str);
					viewModelSelect();
	
					$("#model").change(function() {
						selectModel();
						viewTypeSelect();
						$("#type").change(function() {
							selectType();
							expectPriceResult();
							classRemover();
							chatDisplay(chatPlayer);
							chatFlow();
						})
					})				
				})
				$(".question2").on("click", function() {
					str = "<div class='user'>예약하고 싶어</div>";
					chat.append(str);	
					insertReserveForm();
					classRemover();
					chatDisplay(chatPlayer);
					chatFlow();
				})
				$(".question3").on("click", function() {
					str = "<div class='user'>예약을 조회하고 싶어</div>";
					str += "<div class='client'>temp</div>";
					chat.append(str);		
					classRemover();
					chatDisplay(chatPlayer);
					chatFlow();
				})
				$(".question4").on("click", function() {
					str = "<div class='user'>상담사 연결해줘</div>";
					str += "<div class='client'>temp</div>";
					chat.append(str);	
					classRemover();
					chatDisplay(chatPlayer);
					chatFlow();
				})
				$(".question5").on("click", function() {
					str = "<div class='user'>상담을 종료할래</div>";
					str += "<div class='client'>상담이 종료되었습니다. 감사합니다.</div>";
					chatFlow = false;
					chat.append(str);		
				})
				
			}
		})
				
	})
	
	function loopChatbot()
	{
		var div1 = document.createElement("div");
		var comment1 = document.createTextNode("A/S 가격을 예상하고 싶어");
		div1.appendChild(comment1);
		
		div1.className = 'choice';
		document.getElementById("chat").appendChild(div1);
	}
	
	function chatDisplay(chatPlayer) {
		var div = document.createElement("div");
		div.className = 'client';
		if (chatPlayer == 0)
		{
			var comment = document.createTextNode("어떤 상담을 도와드릴까요?");	
		} else {
			var comment = document.createTextNode("다른 상담이 필요하신가요?");
		}
		div.appendChild(comment);
		document.getElementById("chat").appendChild(div);	
		
		var div1 = document.createElement("div");
		div1.className = 'choice question1';
		var comment1 = document.createTextNode("A/S 가격을 예상하고 싶어");
		div1.appendChild(comment1);
		
		document.getElementById("chat").appendChild(div1);
		
		var div2 = document.createElement("div");
		div2.className = 'choice question2';
		var comment2 = document.createTextNode("예약하고 싶어");
		div2.appendChild(comment2);
		
		document.getElementById("chat").appendChild(div2);
		
		var div3 = document.createElement("div");
		div3.className = 'choice question3';
		var comment3 = document.createTextNode("예약을 조회하고 싶어");
		div3.appendChild(comment3);
		
		document.getElementById("chat").appendChild(div3);
		
		var div4 = document.createElement("div");
		div4.className = 'choice question4';
		var comment4 = document.createTextNode("상담사 연결해줘");
		div4.appendChild(comment4);
		
		document.getElementById("chat").appendChild(div4);
		
		var div5 = document.createElement("div");
		div5.className = 'choice question5';
		var comment5 = document.createTextNode("상담을 종료할래");
		div5.appendChild(comment5);
		
		document.getElementById("chat").appendChild(div5);
		scrollDown();
	}
	
	function viewModelSelect()
	{
		var div1 = document.createElement("div");
		var comment1 = document.createTextNode("에어컨 기종을 선택해주세요");
		div1.appendChild(comment1);

		div1.className = 'client';
		document.getElementById("chat").appendChild(div1);
		
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
		
		var model1 = document.createElement("option");
		model1.value = "stand";
		model1.text = "스탠드형 에어컨";
		modelSelect.appendChild(model1);
		
		var model2 = document.createElement("option");
		model2.value = "wall";
		model2.text = "벽걸이(창문) 에어컨";
		modelSelect.appendChild(model2);
		
		var model3 = document.createElement("option");
		model3.value = "hmulti";
		model3.text = "홈멀티 에어컨";
		modelSelect.appendChild(model3);
		
		var model4 = document.createElement("option");
		model4.value = "system";
		model4.text = "시스템(천장형/스탠드/벽걸이) 에어컨";
		modelSelect.appendChild(model4);
		
		var model5 = document.createElement("option");
		model5.value = "aircon";
		model5.text = "냉난방기";
		modelSelect.appendChild(model5);
		
		var model6 = document.createElement("option");
		model6.value = "heater";
		model6.text = "온풍기";
		modelSelect.appendChild(model6);
		
		document.getElementById("chat").appendChild(div2);
		document.getElementById("answer").appendChild(modelSelect);
		scrollDown();

	}
	
	function selectModel() {
		var div1 = document.createElement("div");
		div1.className = 'user';
		var model = $("#model").val();
		var modelText = "";
		switch (model) {
		case "stand":
			modelText = "스탠드형 에어컨";
			break;
		case "wall":
			modelText = "벽걸이(창문) 에어컨";
			break;
		case "hmulti":
			modelText = "홈멀티 에어컨";
			break;
		case "system":
			modelText = "시스템(천장형/스탠드/벽걸이) 에어컨";
			break;
		case "aircon":
			modelText = "냉난방기";
			break;
		case "heater":
			modelText = "온풍기";
			break;

		default:
			break;
		}
		div1.appendChild(document.createTextNode(modelText));
		document.getElementById("chat").appendChild(div1);
		scrollDown();

	}
	
	function viewTypeSelect() {
		var div1 = document.createElement("div");
		div1.className = 'client';
		var comment1 = document.createTextNode("증상을 선택해주세요");
		div1.appendChild(comment1);
		document.getElementById("chat").appendChild(div1);
		
		var div2 = document.createElement("div");
		div2.className = 'choice';
		
		var typeSelect = document.createElement("select");
		typeSelect.id = 'type';
		
		var type = document.createElement("option");
		type.value = "";
		type.text = "[증상 선택]";
		type.option = 'default';
		typeSelect.appendChild(type);
		
		var type1 = document.createElement("option");
		type1.value = "frost";
		type1.text = "성에";
		typeSelect.appendChild(type1);
		
		var type2 = document.createElement("option");
		type2.value = "dew";
		type2.text = "이슬";
		typeSelect.appendChild(type2);
		
		var type3 = document.createElement("option");
		type3.value = "gas";
		type3.text = "가스 누설";
		typeSelect.appendChild(type3);
		
		var type4 = document.createElement("option");
		type4.value = "noise";
		type4.text = "소음";
		typeSelect.appendChild(type4);
		
		var type5 = document.createElement("option");
		type5.value = "smell";
		type5.text = "냄새";
		typeSelect.appendChild(type5);
		
		var type6 = document.createElement("option");
		type6.value = "leak";
		type6.text = "누수";
		typeSelect.appendChild(type6);
		
		var type7 = document.createElement("option");
		type7.value = "etc";
		type7.text = "기타";
		typeSelect.appendChild(type7);

		div2.appendChild(typeSelect);
		document.getElementById("chat").appendChild(div2);
		scrollDown();

	}
	
	function selectType() {
		var div1 = document.createElement("div");
		div1.className = 'user';
		var type = $("#type").val();
		var typeText = "";
		switch (type) {
		case "frost":
			typeText = "성에";
			break;
		case "dew":
			typeText = "이슬";
			break;
		case "gas":
			typeText = "가스 누설";
			break;
		case "noise":
			typeText = "소음";
			break;
		case "smell":
			typeText = "냄새";
			break;
		case "leak":
			typeText = "누수";
			break;
		case "etc":
			typeText = "기타";
			break;

		default:
			break;
		}
		div1.appendChild(document.createTextNode(typeText));
		document.getElementById("chat").appendChild(div1);
		scrollDown();

	}
	
	function expectPriceResult() {
		var model = 0;
		var type = 0;
		
		var selectedModel = $("#model").val();
		var selectedType = $("#type").val();
		switch (selectedModel) {
		case "stand":
			model = 10000;
			break;
		case "wall":
			model = 15000;
			break;
		case "hmulti":
			model = 20000;
			break;
		case "system":
			model = 25000;
			break;
		case "aircon":
			model = 30000;
			break;
		case "heater":
			model = 35000;
			break;
		default:
			break;
		}
		switch (selectedType) {
		case "frost":
			type = 1;
			break;
		case "dew":
			type = 2;
			break;
		case "gas":
			type = 3;
			break;
		case "noise":
			type = 4;
			break;
		case "smell":
			type = 5;
			break;
		case "leak":
			type = 6;
			break;
		case "etc":
			type = 7;
			break;
		default:
			break;
		}
		var result = model * type;
		var div1 = document.createElement("div");
		div1.className = "client";
		var comment1 = document.createTextNode("예상 가격은" + result + "입니다");
		div1.appendChild(comment1);
		document.getElementById("chat").appendChild(div1);
		scrollDown();

	}
	
	function insertReserveForm() {
		var div = document.createElement("div");
		div.className = 'choice';
		
		var reserveForm = document.createElement("form");
		reserveForm.action = "*";
		reserveForm.method = "post";
		
		var modelSelect = document.createElement("select");
		modelSelect.id = 'model';
		
		var model = document.createElement("option");
		model.value = "";
		model.text = "[기종 선택]";
		model.option = 'default';
		modelSelect.appendChild(model);
		
		var model1 = document.createElement("option");
		model1.value = "stand";
		model1.text = "스탠드형 에어컨";
		modelSelect.appendChild(model1);
		
		var model2 = document.createElement("option");
		model2.value = "wall";
		model2.text = "벽걸이(창문) 에어컨";
		modelSelect.appendChild(model2);
		
		var model3 = document.createElement("option");
		model3.value = "hmulti";
		model3.text = "홈멀티 에어컨";
		modelSelect.appendChild(model3);
		
		var model4 = document.createElement("option");
		model4.value = "system";
		model4.text = "시스템(천장형/스탠드/벽걸이) 에어컨";
		modelSelect.appendChild(model4);
		
		var model5 = document.createElement("option");
		model5.value = "aircon";
		model5.text = "냉난방기";
		modelSelect.appendChild(model5);
		
		var model6 = document.createElement("option");
		model6.value = "heater";
		model6.text = "온풍기";
		modelSelect.appendChild(model6);
		
		reserveForm.appendChild(modelSelect);
		div.appendChild(reserveForm);
		document.getElementById("chat").appendChild(div);

	}
	
	function classRemover() {
		var temp = document.getElementsByClassName("choice");
		for (var i = 0; i < temp.length; i++)
		{
			temp[i].classList.remove('question1', 'question2', 'question3', 'question4', 'question5');
		}
	}
	
	function scrollDown() {
		const scrollByAmount = 500;
		const interval = 10;
		
		function scrollStep() {
			window.scrollBy(0, scrollByAmount);
			if (window.pageYOffset < document.body.scrollHeight - window.innerHeight) {
		
		    setTimeout(scrollStep, interval);
			}
		}
		scrollStep();
	}
</script>
</head>
<body>
<div id="chat">

<<<<<<< HEAD
<!-- 	<div class="client">어떤 도움이 필요하신가요?</div>
	<div class="choice" id="question1">A/S 가격을 예상하고 싶어</div>
	<div class="choice" id="question2">예약하고 싶어</div>
	<div class="choice" id="question3">예약을 조회하고 싶어</div>
	<div class="choice" id="question4">상담사 연결해줘</div>
	<div class="choice" id="question5">상담을 종료할래</div> -->
	
=======
>>>>>>> refs/remotes/origin/master
	<div class="client">챗봇 상담 페이지입니다</div>
	<div class="client">상담을 시작할게요</div>
	<div class="choice" id="chatStart">시작하자!</div>
	
</div>
</body>
</html>