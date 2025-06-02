/**
 * 
 */
 	$("document").ready(function() {
		var chat = $("#chat");
		let str = "";
		$("#question1").on("click", function() {
			str = "<div class='user'>A/S 가격을 예상하고 싶어</div>";
			chat.append(str);
			question1();
			
		})
		$(".question2").on("click", function() {
			str = "<div class='user'>예약하고 싶어</div>";
			str += "<div class='client'>temp</div>";
			chat.append(str);		
		})
		$(".question3").on("click", function() {
			str = "<div class='user'>예약을 조회하고 싶어</div>";
			str += "<div class='client'>temp</div>";
			chat.append(str);		
		})
		$(".question4").on("click", function() {
			str = "<div class='user'>상담사 연결해줘</div>";
			str += "<div class='client'>temp</div>";
			chat.append(str);		
		})
		$(".question5").on("click", function() {
			str = "<div class='user'>상담을 종료할래</div>";
			str += "<div class='client'>temp</div>";
			chatFlow = false;
			chat.append(str);		
		})
		
		let chatPlay = true;
		$("#chatStart").on("click", function() {
			div1 = document.createElement("div");
			var comment1 = document.createTextNode("상담을 시작해줘");
			div1.appendChild(comment1);
			div1.className = 'user';
			document.getElementById("chat").appendChild(div1);

			chatDisplay();
			
			$("#question1").on("click", function() {
				str = "<div class='user'>A/S 가격을 예상하고 싶어</div>";
				chat.append(str);
				question1();				
			})
			$(".question2").on("click", function() {
				str = "<div class='user'>예약하고 싶어</div>";
				str += "<div class='client'>temp</div>";
				chat.append(str);		
			})
			$(".question3").on("click", function() {
				str = "<div class='user'>예약을 조회하고 싶어</div>";
				str += "<div class='client'>temp</div>";
				chat.append(str);		
			})
			$(".question4").on("click", function() {
				str = "<div class='user'>상담사 연결해줘</div>";
				str += "<div class='client'>temp</div>";
				chat.append(str);		
			})
			$(".question5").on("click", function() {
				str = "<div class='user'>상담을 종료할래</div>";
				str += "<div class='client'>temp</div>";
				chatFlow = false;
				chat.append(str);		
			})		
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
	
	function chatDisplay() {
		var div1 = document.createElement("div");
		div1.className = 'choice';
		div1.id = "question1";
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

	}
	
	function question1()
	{
		var div1 = document.createElement("div");
		var comment1 = document.createTextNode("에어컨 기종을 선택해주세요");
		div1.appendChild(comment1);

		div1.className = 'client';
		document.getElementById("chat").appendChild(div1);
		
		var div2 = document.createElement("div");
		div2.className = 'choice';
		div2.id = 'answer';
		
		var expectPrice = document.createElement("form");
		var modelSelect = document.createElement("select");
		modelSelect.id = 'model';
		
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
		model5.value = "system";
		model5.text = "시스템(천장형/스탠드/벽걸이) 에어컨";
		modelSelect.appendChild(model5);
		
		var model6 = document.createElement("option");
		model6.value = "system";
		model6.text = "시스템(천장형/스탠드/벽걸이) 에어컨";
		modelSelect.appendChild(model6);
		
		document.getElementById("chat").appendChild(div2);
		expectPrice.appendChild(modelSelect);
		document.getElementById("answer").appendChild(expectPrice);

	}