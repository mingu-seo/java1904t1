<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="util.*"%>
<%@ page import="board.member.*"%>
<%
MemberVO sessionMember = (MemberVO)session.getAttribute("memberInfo");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap"	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/default.css">
<link rel="stylesheet" href="../css/header-fixed.css">
<link rel="stylesheet" href="../css/personal_info.css">
<link rel="stylesheet" href="../css/footer.css">
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/gnb.js"></script>
<script>
$(function(){
    //left-section 높이값 알아내서 right-section 높이값을 동일하게
    var leftHei = $(".left-section").height();
    $(".right-section").height(leftHei+2);
    var secHei = $(".section-wrap").height();
    //스크롤 했을때 
    $(window).scroll(function(){
        //스크롤바 위치값 알아내기
        var scTop = $(this).scrollTop();
        //section-wrap 시작하는 위치값 알아내기
        var secWrap = $(".section-wrap").offset().top;
        //footer 시작하는 위치값 알아내기
        var ftStart = $("#footer").offset().top-800;
        
        if(scTop >= secWrap && scTop < secHei-390) {
            $(".confirmation-box").addClass("fix");
        }
        else if(scTop >= secHei-390) {
            $(".confirmation-box").removeClass("fix");
            $(".confirmation-box").addClass("fix2");
        }
        else {
            $(".confirmation-box").removeClass("fix2");
            $(".confirmation-box").removeClass("fix");
        }
    });
    
    $("#guest_tel1_select").change(function() {
    	$("#guest_tel1").val($("#guest_tel1_select option:selected").val());
    });
});        

var chknum = /[0-9]/g;
var chkat = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

function goCheck() {
	if($("#guest_lastname").val()==""){
		$("#guest_lastname").focus();
		return false;
	}
	if($("#guest_firstname").val()==""){
		$("#guest_firstname").focus();
		return false;
	}
	if($("#guest_tel2").val()=="" || !chknum.test($("#guest_tel2").val())){
		$("#tel_span").show();
		$("#tel_span").text("* 숫자만 입력하세요.");
		$("#guest_tel2").focus();
		return false;
	} else {
		$("#tel_span").remove();
	}
	if($("#guest_tel3").val()=="" || !chknum.test($("#guest_tel3").val())){
		$("#tel_span").show();
		$("#tel_span").text("* 숫자만 입력하세요.");
		$("#guest_tel3").focus();
		return false;
	} else {
		$("#tel_span").remove();
	}
	if($("#guest_email").val()=="" || !chkat.test($("#guest_email").val())){
		$("#email_span").show();
		$("#email_span").text("* 메일 주소를 정확하게 입력하세요.");
		$("#guest_email").focus();
		return false;
	} else {
		$("#email_span").remove();
	}
	
	return true;
}

function maxLengthCheck(object) {
	if(object.value.length > object.maxLength) {
		object.value = object.value.slice(0, object.maxLength);
	}
}
</script>
<title>정보입력</title>
</head>
<body>
	<jsp:include page="/header_menu" flush="true" />

	<div id="container">
		<div class="option_channel clear">
			<h1 class="head-title">객실예약</h1>

			<!-- 상단 제목 아래 객실예약 진행 순서 -->
			<ul class="cha_index clear">
				<li><a href="#">객실검색 <span>></span></a></li>
				<li><a href="/book/room/add_option">객실예약</a></li>
				<li class="current-page"><a href="#"><span>></span>정보입력</a></li>
				<li><a href="/book/room/confirm_room"><span>></span> 예약완료</a></li>
			</ul>

			<!-- 폼태그 / summit 입력버튼 311번 -->
			<form action="/room/res/submit" method="post" onsubmit="return goCheck();">
				<div class="section-wrap clear">
					<!-- 왼쪽 정보 입력 박스 구역 -->
					<div class="left-section">

						<div class="add01">
							<div class="sec01-title">
								<p>예약고객 정보 입력</p>
							</div>
							<%
							if(sessionMember != null) {
							%>
							<div class="guest_kname">
								<label for="guest_kname">성명＊</label> 
									<input type="text" name="guest_lastname" id="guest_lastname" value="<%=sessionMember.getF_name()%>"/> 
									<input type="text" name="guest_firstname" id="guest_firstname" value="<%=sessionMember.getL_name()%>"/> 
							</div>
							<div class="phoneNumber">
								<label for="phoneNumber">연락처＊</label> 
								<select id="guest_tel1_select">
									<option value="<%=sessionMember.getF_tel()%>"><%=sessionMember.getF_tel()%></option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
								</select> 
								<input type="hidden" name="member_pk" id="member_pk" value="<%=sessionMember.getNo()%>"/>
								<input type="hidden" name="guest_tel1" id="guest_tel1" value="<%=sessionMember.getF_tel()%>"/>
								<input type="text" name="guest_tel2" id="guest_tel2" maxlength="4" oninput="maxLengthCheck(this)" value="<%=sessionMember.getM_tel()%>">
								<input type="text" name="guest_tel3" id="guest_tel3" maxlength="4" oninput="maxLengthCheck(this)" value="<%=sessionMember.getL_tel()%>">
								<span id="tel_span" style="color:#ff0000; font-size:10px; padding:0; margin:0;"></span>
							</div>

							<div class="email">
								<ul class="email_adress clear">
									<li class="email-title">
										<label for="email">이메일＊</label>
									</li>
									<li>
										<input type="text" name="guest_email" id="guest_email" value="<%=sessionMember.getEmail()%>" maxlength="40"><br/>
										<span id="email_span" style="color:#ff0000; font-size:10px; padding:0; margin:0;"></span>
									</li>
								</ul>
							</div>
						</div>
						<%
							} else {
						%>
						<div class="guest_kname">
								<label for="guest_kname">성명＊</label> 
									<input type="text" name="guest_lastname" id="guest_lastname" placeholder="성"/> 
									<input type="text" name="guest_firstname" id="guest_firstname" placeholder="이름"/> 
							</div>
							<div class="phoneNumber">
								<label for="phoneNumber">연락처＊</label> 
								<select id="guest_tel1_select">
									<option>선택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
								</select> 
								<input type="hidden" name="guest_tel1" id="guest_tel1" value=""/>
								<input type="text" name="guest_tel2" id="guest_tel2" maxlength="4" oninput="maxLengthCheck(this)" placeholder="숫자만 입력가능">
								<input type="text" name="guest_tel3" id="guest_tel3" maxlength="4" oninput="maxLengthCheck(this)" placeholder="숫자만 입력가능">
								<span id="tel_span" style="color:#ff0000; font-size:10px; padding:0; margin:0;"></span>
							</div>

							<div class="email">
								<ul class="email_adress clear">
									<li class="email-title">
										<label for="email">이메일＊</label>
									</li>
									<li>
										<input type="text" name="guest_email" id="guest_email" placeholder="이메일" maxlength="40"><br/>
										<span id="email_span" style="color:#ff0000; font-size:10px; padding:0; margin:0;"></span>
									</li>
								</ul>
							</div>
						</div>
						<%		
							}
						%>
						<div class="add01">
							<div class="sec01-title">
								<p>상세 가격 정보</p>
							</div>
							
							<table>
								<tr>
									<th></th>
									<th>총 예약 금액<br /> [1박,1객실]
									</th>
								</tr>
								<tr>
									<th>객실/패키지 가격</th>
									<td>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("room_price"))) %></td>
								</tr>
								<tr>
									<th>추가 옵션 가격</th>
									<td>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("option_price"))) %></td>
								</tr>
								<tr>
									<th>봉사료(10%),<br /> 부가가치세(10%)<br /> 전 일정, 전 객실에 적용
									</th>
									<td>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("charge_price"))) %></td>
								</tr>
								<tr>
									<th>총 예약 금액</th>
									<td><p>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("total_price"))) %></p></td>
								</tr>
							</table>
						</div>

						<div class="add01 card">
							<div class="sec01-title">
								<p>결제 방식 선택</p>
							</div>

							<div class="cardType">
								<label for="name_ko">결제 방식<span>＊</span></label>
								<button>무통장입급</button>
								<button>카드결제</button>
							</div>
						</div>

					</div>

					<!-- 오른쪽 금액 추가 및 결제버튼 구역 -->
					<div class="right-section">
						<div class="confirmation-box">
							<div class="content-area01">
								<h2>온라인 확정 요금</h2>
								<p>- 온라인 확정 요금 (최소 및 변경 불가 요금)</p>

								<h3><%=request.getParameter("room_name") %> [1객실]</h3>
								<h3 class="point01"><%=request.getParameter("checkin") %> ~ <%=request.getParameter("checkout") %> [<%=request.getParameter("day_stay") %>박]</h3>
								<h3>어른 <%=request.getParameter("adult") %>명 / 어린이 <%=request.getParameter("kid") %>명</h3>
							</div>

							<div class="content-area02 area clear">
								<ul class="title01">
									<li><h3>객실 총 금액</h3></li>
									<li><h3>추가 인원 금액</h3></li>
									<li><h3>추가 옵션 금액</h3></li>
									<li><h3>세금 및 수수료</h3></li>
								</ul>

								<ul class="price01">
									<li><h3>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("room_price"))) %></h3></li>
									<li><h3>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("person_price"))) %></h3></li>
									<li><h3>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("option_price"))) %></h3></li>
									<li><h3>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("charge_price"))) %></h3></li>
								</ul>
							</div>

							<div class="content-area03 area clear">
								<ul class="title02 clear">
									<li class="total-price">총 예약 금액</li>
									<li>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("total_price"))) %></li>
								</ul>
								<p>(투숙기간. 객실 수. 옵션 포함, 세금 및 수수료 각 10%포함)</p>

								<div class="next-but">
									<input id="countsubmit" type="submit" value="예약 완료" href="/book/room/confirm_room">
								</div>

								<h4>
									<span></span>예약 안내
								</h4>
								<p>· 당일 예약에 대해서는 취소 및 변경이 불가능합니다.</p>
							</div>

							<div class="content-area04 area">
								<h4>
									<span></span>객실 예약문의 00-0000-0000
								</h4>
							</div>

						</div>
					</div>
				</div>
				
				<input type="hidden" name="room_pk" id="room_pk" value="<%=request.getParameter("room_pk")%>"/> 
                <input type="hidden" name="room_name" id="room_name" value="<%=request.getParameter("room_name")%>"/> 
                <input type="hidden" name="checkin" id="checkin" value="<%=request.getParameter("checkin")%>"/> 
                <input type="hidden" name="checkout" id="checkout" value="<%=request.getParameter("checkout")%>"/> 
                <input type="hidden" name="day_stay" id="day_stay" value="<%=request.getParameter("day_stay")%>"/> 
                <input type="hidden" name="adult" id="adult" value="<%=request.getParameter("adult")%>"/> 
                <input type="hidden" name="kid" id="kid" value="<%=request.getParameter("kid")%>"/> 
                <input type="hidden" name="room_price" id="room_price" value="<%=request.getParameter("room_price")%>"/> 
                <input type="hidden" name="person_price" id="person_price" value="<%=request.getParameter("person_price")%>"/> 
                <input type="hidden" name="option_price" id="option_price" value="<%=request.getParameter("option_price")%>"/> 
                <input type="hidden" name="charge_price" id="charge_price" value="<%=request.getParameter("charge_price")%>"/> 
                <input type="hidden" name="total_price" id="total_price" value="<%=request.getParameter("total_price")%>"/>
				<% 
				String[] option_pk = request.getParameterValues("option_pk");
				String[] name = request.getParameterValues("name");
				String[] price = request.getParameterValues("price");
				String[] count = request.getParameterValues("count"); 
				
				for(int i=0; i<option_pk.length; i++) {
				%> 
				<input type="hidden" name="option_pk" id="option_pk" value="<%=option_pk[i]%>"/>
				<input type="hidden" name="name" id="name" value="<%=name[i]%>"/>
				<input type="hidden" name="price" id="price" value="<%=price[i]%>"/>
				<input type="hidden" name="count" id="count" value="<%=count[i]%>"/>  
				<%
				}
				%>
				
				<input type="hidden" name="pay_method" id="pay_method" value="0"/>
				<input type="hidden" name="pay_state" id="pay_state" value="0"/>
				<input type="hidden" name="paydate" id="paydate" value="-"/>
			</form>
		</div>
	</div>

	<div id="footer">
		<!-- <div class="footer-logo"><img src="img/footer_logo.png"></div> -->

		<div class="footer-center">
			<div class="footer-top">
				<ul class="company-info clear">
					<li><a href="#">호텔소개</a></li>
					<li><a href="#">오시는 길</a></li>
					<li><a href="#">문의</a></li>
					<li><a href="#">인재채용</a></li>
					<li><a href="#">이용약관</a></li>
					<li><a href="#">개인정보처리방침</a></li>
				</ul>
				<ul class="sns clear">
					<li><a href="#"><img src="/img/sns1.png"></a></li>
					<li><a href="#"><img src="/img/sns2.png"></a></li>
					<li><a href="#"><img src="/img/sns3.png"></a></li>
					<li><a href="#"><img src="/img/sns4.png"></a></li>
				</ul>
			</div>
			<div class="footer-bottom">
				<h5>
					에이블현대호텔앤리조트주식회사 대표이사 JANG PAUL HYUK (장혁),최종윤 사업자 등록번호 104-81-21344
					통신판매업신고번호 2012-서울중구-1214<br /> 서울시 중구 장충단로60(장충동2가), 04605 / TEL
					02.2250.8000
				</h5>
				<h6>Copyright 2018 Banyan Tree Club & Spa. All Rights Reserved</h6>
				<ul class="support-logo clear">
					<li><img src="/img/footericon1.png"></li>
					<li><img src="/img/footericon2.png"></li>
					<li><img src="/img/footericon3.png"></li>
					<li><img src="/img/footericon4.png"></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>