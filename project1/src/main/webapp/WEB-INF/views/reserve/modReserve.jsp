<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>출장 서비스 예약 | 수정</title>
    <link rel="stylesheet" type="text/css" href="resources/css/reserve.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <div id="wrap">
        <h1>출장 서비스 예약</h1>
        <div id="notice">
            <span class="blue">!</span> 출장 서비스 예약은 <span class="blue">한 ID당 한 건씩</span>만 예약 가능합니다.
        </div>
        <!-- 제품/증상 정보 입력 -->
        <form action="/update" method="post">
            <div id="reserveWrap">
            <input type="number" name="num" value="${reserve.num}">
                <div class="title">
                    <h2>1. 제품/증상 선택</h2>
                </div>
                <!-- 제품 선택 -->
                <div class="row">
                    <span class="cate">제품 선택<span class="redStar">*</span></span>
                    <div class="content">
                        <input type="text" name="date" value="${date}">
                        <input type="hidden" id="sltModel" name="model" value="${reserve.model}">
                        <p id="showModel">제품을 선택해주세요.</p>
                        <ul id="modelWrap">
                            <li class="model" name="stand" data-value="stand">스탠드 에어컨</li>
                            <li class="model" name="wall" data-value="wall">벽걸이(창문) 에어컨</li>
                            <li class="model" name="hmulti" data-value="hmulti">홈멀티 에어컨</li>
                            <li class="model" name="system" data-value="system">시스템(천장형/스탠드/벽걸이) 에어컨</li>
                            <li class="model" name="aircon" data-value="aircon">냉난방기</li>
                            <li class="model" name="heater" data-value="heater">온풍기</li>
                        </ul>
                    </div>
                </div>
                <!-- 증상 선택 -->
                <div class="row">
                    <span class="cate">증상 분류<span class="redStar">*</span></span>
                    <select class="content" name="type" id="type">
                        <option value="frost">성에</option>
                        <option value="dew">이슬</option>
                        <option value="gas">가스 누설</option>
                        <option value="noise">소음</option>
                        <option value="smell">냄새</option>
                        <option value="leak">누수</option>
                        <option value="etc">기타</option>
                    </select>
                </div>
                <!-- 증상 상세 입력 -->
                <div class="row">
                    <span class="cate">상세 증상<span class="redStar">*</span></span>
                    <div class="content" id="detailWrap">
                        <textarea name="detail" id="detail" placeholder="고장 증상 상세내용만 입력해주세요.">"${reserve.detail}"</textarea>
                        <br>
                        <div id="bottomMsg">
                            <span id="errMsg"></span>
                            <div id="text">
                                <strong id="letters">0</strong>/300자
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 실외기 위치 선택 -->
                <div class="row">
                    <span class="cate">실외기 위치<span class="redStar">*</span></span>
                    <div class="content" id="locWrap">
                        <li><input type="radio" name="loc" value="A"> 베란다 밖 난간</li>
                        <li><input type="radio" name="loc" value="B"> 건물의 외벽 앵글</li>
                        <li><input type="radio" name="loc" value="C"> 건물 밖 실외기실</li>
                        <li><input type="radio" name="loc" value="D"> 옥상</li>
                        <li><input type="radio" name="loc" value="E"> 실내 실외기실</li>
                        <li><input type="radio" name="loc" value="F"> 베란다 내부</li>
                        <li><input type="radio" name="loc" value="G"> 1층 또는 지면</li>
                        <li><input type="radio" name="loc" value="H"> 2단 설치</li>
                    </div>
                </div>
            </div>

            <!-- 신청자 정보 확인 -->
            <div id="userinfo">
                <div class="title">
                    <h2>2. 신청자 정보 확인</h2>
                </div>
                <input type="text" id="id" name="id" value="${member.id}">
                <div class="row">
                    <span class="cate">이름<span class="redStar">*</span></span>
                    <input class="content" type="text" id="name" name="name" value="${member.name}" readonly>
                </div>
                <div class="row">
                    <span class="cate">휴대폰 번호<span class="redStar">*</span></span>
                    <input class="content" type="tel" id="phone" name="phone" value="${member.phone}" readonly>
                </div>
                <div class="row">
                    <span class="cate">주소<span class="redStar">*</span></span>
                    <input class="content" type="text" id="address" name="address" value="${member.address}" readonly>
                </div>
            </div>

            <!-- 예약 버튼 -->
            <div id="submitBtn">
                <input type="submit" value="예약하기">
            </div>
        </form>
    </div>

<script>
    $(document).ready(function(){
    	
    	// 수정 이전 값 받아오기
    	const beforeModelValue = $("#sltModel").val();
    	const $selectedLi = $(".model[data-value='"+ beforeModelValue + "']");
	    
	    $("#showModel").text($selectedLi.text());
	    $selectedLi.addClass("selected");
	    
	    const beforeTypeValue = "${reserve.type}";
	    $("#type").val(beforeTypeValue);
	    
	    const beforeLocValue = "${reserve.loc}";  // 예: "C"
	    $('input[name="loc"][value="' + beforeLocValue + '"]').prop("checked", true);

        // model 리스트 항목 클릭 시
        $("#modelWrap").on("click", ".model", function () {
            
            // 텍스트(한글) 가져오기
            let modelText = $(this).text();
            // value 속성 가져오기
            let modelValue = $(this).data("value");

            // 표시 및 값 설정
            $("#showModel").text(modelText);
            $("#sltModel").val(modelValue);

            // css용 class 추가/삭제
            $(".model").removeClass("selected");
            $(this).addClass("selected");
        });

        // 입력문자수에 따른 글자 개수 출력
        $("textarea").keyup(function(){
            let textLength = $(this).val().length;
            $("#letters").html(textLength);
            
            // 글자수에 따른 errMsg
            if(textLength < 11){
                $("#errMsg").html("상세 증상을 10자 이상 입력해주세요.")
            } else{
                $("#errMsg").html("");
            }
        })

    })
</script>
</body>
</html>