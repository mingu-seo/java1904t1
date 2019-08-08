<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="room.*"%>

<%
ArrayList<RoomVO> list_rp = (ArrayList<RoomVO>) request.getAttribute("list_rp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/default.css">
<link rel="stylesheet" href="/css/jquery-ui.css">
<link rel="stylesheet" href="/css/header-fixed.css">
<link rel="stylesheet" href="/css/price_room.css">
<link rel="stylesheet" href="/css/footer.css">
<script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/js/jquery-ui.js"></script>
<script type="text/javascript" src="/js/datepicker.js"></script>
<script type="text/javascript" src="/js/gnb.js"></script>
<title>객실검색</title>
<script type="text/javascript">
	$(function() {
		$(".toggle-btn").click(function(event) {
			$(this).children("h3").toggle();
			$(this).siblings(".rate-info").toggle();
		});
	});
</script>
</head>
<body>
	<jsp:include page="/header_menu" flush="true" />

	<div id="container">
		<div class="chk-section">
			<h2>객실검색</h2>

			<!-- 상단 예약진행 순서 -->
			<ul class="cha_index clear">
				<li><a href="/book/check_room">객실검색 <span>></span>
				</a></li>
				<li class="current-page"><a href="#">객실예약</a></li>
				<li><a href="/book/personal_info"><span>></span>정보입력</a></li>
				<li><a href="/book/confirm_room"><span>></span> 예약완료</a></li>
			</ul>

			<!-- 객실 검색 박스 -->
			<div class="select-info-box">
				<form class="room-search">

					<!-- 검색창 구역 -->
					<div class="period after">
						<label for="period">숙박기간</label>
					</div>

					<!-- 체크인/체크아웃 구역 -->
					<div class="checkInOut">
						<input type="text" name="checkin_select" id="checkin_select" class="InDate" maxlength="10" placeholder="체크인"
							value="<%=request.getParameter("scheckin")%>" readonly>~
						<input type="text" name="checkout_select" id="checkout_select" class="OutDate" maxlength="10" placeholder="체크아웃"
							value="<%=request.getParameter("scheckout")%>" readonly>
					</div>

					<!-- 기간 -->
					<div class="days"><%=request.getParameter("sday_stay")%> 박
					</div>


					<div class="room after">
						<label for="roomCount">객실</label>
					</div>
					<!-- 객실 수 -->
					<div class="roomCount select-option">
						<select name="roomCount" id="roomCount" class="option01" aria-hidden="true">
							<option value="1" selected>1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
						</select>
					</div>

					<div class="adult after">
						<label for="adult">어른</label>
					</div>

					<div class="adultCount select-option">
						<select name="adult_select" id="adult_select" class="option1" aria-hidden="true">
							<option value="1" <%=Integer.parseInt(request.getParameter("sadult")) == 1 ? "selected" : ""%>>1명</option>
							<option value="2" <%=Integer.parseInt(request.getParameter("sadult")) == 2 ? "selected" : ""%>>2명</option>
							<option value="3" <%=Integer.parseInt(request.getParameter("sadult")) == 3 ? "selected" : ""%>>3명</option>
							<option value="4" <%=Integer.parseInt(request.getParameter("sadult")) == 4 ? "selected" : ""%>>4명</option>
							<option value="5" <%=Integer.parseInt(request.getParameter("sadult")) == 5 ? "selected" : ""%>>5명</option>
						</select>
					</div>

					<div class="child after">
						<label for="child">어린이</label>
					</div>

					<div class="childCount select-option">
						<select name="kid_select" id="kid_select" class="option1"
							aria-hidden="true">
							<option value="0" <%=Integer.parseInt(request.getParameter("skid")) == 0 ? "selected" : ""%>>0명</option>
							<option value="1" <%=Integer.parseInt(request.getParameter("skid")) == 1 ? "selected" : ""%>>1명</option>
							<option value="2" <%=Integer.parseInt(request.getParameter("skid")) == 2 ? "selected" : ""%>>2명</option>
							<option value="3" <%=Integer.parseInt(request.getParameter("skid")) == 3 ? "selected" : ""%>>3명</option>
							<option value="4" <%=Integer.parseInt(request.getParameter("skid")) == 4 ? "selected" : ""%>>4명</option>
							<option value="5" <%=Integer.parseInt(request.getParameter("skid")) == 5 ? "selected" : ""%>>5명</option>
						</select>
					</div>
				</form>

				<!-- 재검색 버튼 -->
				<div class="re-try">
					<button class="re-check-btn">재검색</button>
				</div>
			</div>
		</div>
		
		<!-- 탭메뉴 객실/요금으로 보기 -->
		<div class="room-info">
			<ul class="tabMenu clear">
				<li><a href="/book/room/check_room">객실로 보기</a></li>
				<li class="on"><a href="#">요금으로 보기</a></li>
			</ul>

			<%
			for(int i=0; i<list_rp.size(); i++) {
			%>
			<div class="priceResult-area clear">
				<div class="resultSection">
					<div class="thePrice">
						<h3>객실요금</h3>
					</div>
					<div class="priceResult clear">
						<ul class="etc clear">
							<li><h1>
									<%=Function.toPriceComma(list_rp.get(i).getPrice()) %> 원 <span>~</span>
								</h1>
							</li>
							<li>
								<h3>KRW/1박, 1객실</h3>
								<p>(세금 및 수수료 별도)</p>
							</li>
						</ul>
					</div>
				</div>
				<ul class="rate-info clear">
					<li class="photo01">
						<h1 class="camera">
							<a href="../room/room-detail-subpage.html" target="_blank"><img	src="/img/ico_photo.png"></a>
						</h1>
					</li>
					<li>
						<ul class="roomResult-info clear">
							<li><h2><%=list_rp.get(i).getName() %></h2></li>
							<li class="specific-notice clear">
								<ul class="specific-notice01">
									<li>객실크기 : <%=list_rp.get(i).getSize() %></li>
									<li>객실위치 : <%=list_rp.get(i).getLocation() %></li>
									<li>수용인원 : <%=list_rp.get(i).getAdult() + list_rp.get(i).getKid() %> 명</li>
								</ul>
								<ul class="specific-notice02">
									<li>객실타입 : <%=list_rp.get(i).getType() %></li>
									<li>배드타입 : 킹 사이즈</li>
								</ul>
							</li>
							<li>
								<p>
									<%=list_rp.get(i).getInstruction() %>
								</p>
							</li>
						</ul>
					</li>
					<div class="submit">
						<a href="add_option.html">예약하기</a>
					</div>
				</ul>
				<button class="toggle-btn">
					<h3 class="btn-show">예약 가능한 객실 보기</h3>
					<h3 class="btn-close">예약 가능한 객실 닫기</h3>
				</button>
			</div>
			<%
			}
			%>
			
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