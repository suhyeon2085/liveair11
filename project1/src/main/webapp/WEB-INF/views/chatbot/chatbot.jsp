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
	
					$("#model").change(function() {
						createUserDiv(modelDic[$("#model").val()]);
						viewTypeSelect();
						$("#type").change(function() {
							createUserDiv(typeDic[$("#type").val()]);
							expectPriceResult();
							classRemover();
							chatDisplay(chatPlayer);							
							chatFlow();						
						})	
					})				
				})
				$(".question2").on("click", function() {
					createUserDiv(questionDic['Q2']);
					viewModelSelect();
					$("#model").change(function() {
						createUserDiv(modelDic[$("#model").val()]);
						viewTypeSelect();
						$("#type").change(function() {
							createUserDiv(typeDic[$("#type").val()]);
							insertDetail();
							$("#detail").change(function() {
								viewLocSelect();
								$("#loc").change(function() {
									createUserDiv(locDic[$("#loc").val()]);
									viewDateSelect();
									/* classRemover();
									chatDisplay(chatPlayer);							
									chatFlow();		 */		

								})
							})
						})
					})
				})
				
				$(".question3").on("click", function() {
					createUserDiv(questionDic['Q3']);
					classRemover();
					chatDisplay(chatPlayer);							
					chatFlow();
				})
				
				/* 미완 */
				$(".question4").on("click", function() {
					createUserDiv(questionDic['Q4']);
					classRemover();
					chatDisplay(chatPlayer);							
					chatFlow();
				})
				$(".question5").on("click", function() {
					createUserDiv(questionDic['Q5']);
					createClientDiv("상담이 종료되었습니다.");
					chatFlow = false;
				})				
			}
		})
	})
	/* 이건 테스트만 하고 안씀 일단 참고용으로 놔둠 */
	function loopChatbot()
	{
		var div1 = document.createElement("div");
		var comment1 = document.createTextNode("A/S 가격을 예상하고 싶어");
		div1.appendChild(comment1);
		
		div1.className = 'choice';
		document.getElementById("chat").appendChild(div1);
	}
	
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
	
	/* AS예약 시 상세 증상을 입력함 */
	function insertDetail() {
		
		createClientDiv("고장 증상 상세내용만 입력해주세요.");
		
		var div1 = document.createElement("div");
		div1.className = 'user';
		var detail = document.createElement("input");
		detail.setAttribute("type", "text");
		detail.id = "detail";
		div1.appendChild(detail);
		document.getElementById("chat").appendChild(div1);	
	}
	
	function viewLocSelect() {
		createClientDiv("실외기 설치 위치를 선택해주세요");
		
		var div2 = document.createElement("div");
		div2.className = 'choice';
		
		var locSelect = document.createElement("select");
		locSelect.id = 'loc';
		
		var loc = document.createElement("option");
		loc.value = "";
		loc.text = "[실외기 위치 선택]";
		loc.option = 'default';
		locSelect.appendChild(loc);
		
		for (var key in locDic)
		{
			var loc1 = document.createElement("option");
			loc1.value = key;
			loc1.text = locDic[key];
			locSelect.appendChild(loc1);
		}

		div2.appendChild(locSelect);
		document.getElementById("chat").appendChild(div2);
	}
	
	function viewDateSelect() {
		createClientDiv("예약 시간을 선택해주세요");
		
		var timeTable = ['09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00'];
		
		var date = new Date();
		var month = date.getMonth() + 1;
		var day = date.getDate() + 1;

		//< 버튼: if day == 어ㅏ고
		
		
		var div = document.createElement("div");
		div.className = 'client';
		div.appendChild(document.createTextNode(month + '월 ' + day + '일'));
		document.getElementById("chat").appendChild(div);	
		
		for (var i in timeTable)
		{
			var div1 = document.createElement("div");
			div1.className = 'choice';
			div1.appendChild(document.createTextNode(timeTable[i]));
			document.getElementById("chat").appendChild(div1);
			
		}
		
	}
	
	/* 입력받은 내용(기종, 고장증상, 상세증상)을 보여줌(차후form으로 입력해서 db로 보낼 예정) */
	function confirmReserveForm() {
		
		var labelDic =
		{
			'기종 : '	:modelDic[$("#model").val()],
			'증상 : ':typeDic[$("#type").val()],
			'상세 증상 : ':$("#detail").val(),
			'실외기 위치 : ':locDic[$("#loc").val()]
		}

		var div = document.createElement("div");
		div.className = 'client';
		var comment = document.createTextNode("예약 내용을 확인해주세요");
		div.appendChild(comment);
		document.getElementById("chat").appendChild(div);
		
		var div1 = document.createElement("div");
		div1.className = 'client';
		var table = document.createElement("table");
		
		for (var key in labelDic)
		{
			var row = document.createElement("tr");
			var label = document.createElement("td");
			label.appendChild(document.createTextNode(key));
			row.appendChild(label);
			
			var item = document.createElement("td");
			item.appendChild(document.createTextNode(labelDic[key]));
			row.appendChild(item);
			
			table.appendChild(row);
		}

		div1.appendChild(table);
		document.getElementById("chat").appendChild(div1);
			
	}
	
	/* 채팅 반복 시 class와 id가 중복되지 않도록 상담이 끝난 내용의 클래스와 아이디를 삭제함 */
	function classRemover() {
		var temp = document.getElementsByClassName("choice");
		for (var i = 0; i < temp.length; i++)
		{
			temp[i].classList.remove('question1', 'question2', 'question3', 'question4', 'question5');
		}
		var model = document.getElementById("model");
		model.removeAttribute("id");
		
		var type = document.getElementById("type");
		type.removeAttribute("id");
		
		var answer = document.getElementById("answer");
		answer.removeAttribute("id");
	}
	
	/* 자동 스크롤을 하고 싶은데 고민중... */
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
<div id="chat">

	<div class="client">챗봇 상담 페이지입니다</div>
	<div class="client">상담을 시작할게요</div>
	<div class="choice" id="chatStart">시작하자!</div>

</div>
</body>
</html>