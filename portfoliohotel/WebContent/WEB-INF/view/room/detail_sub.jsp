<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="room.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*"%>
<%
RoomVO read = (RoomVO)request.getAttribute("read");
ArrayList<HashMap> list_s = (ArrayList<HashMap>)request.getAttribute("list_service");
ArrayList<HashMap> list_i = (ArrayList<HashMap>)request.getAttribute("list_image");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/jquery-ui.css">
    <link rel="stylesheet" href="/css/slick.css">
    <link rel="stylesheet" href="/css/slick-theme.css">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/header-fixed.css">
    <link rel="stylesheet" href="/css/room-detail-subpage.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.js"></script>
    <script type="text/javascript" src="/js/slick.js"></script>
    <script type="text/javascript" src="/js/slick-slide.js"></script>
    <script type="text/javascript">
    
        $(function(){
        	$(".book").click(function(event){
                event.preventDefault();
                $(".book-wrap").show();
            });
            $(".book-close > a").click(function(){
                $(".book-wrap").hide();
            });
            $("#checkin").datepicker({
                monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                dateFormat: "yy-mm-dd",
                yearRange: "2019:2019",
                minDate: "0D"
                
            });
            $("#checkout").datepicker({
                monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                dateFormat: "yy-mm-dd",
                yearRange: "2019:2019",
                minDate: "1D"
            });  
            
            checkDate(<%=read.getNo()%>, $("#checkin").val(), $("#checkout").val());
            
            $("#adult_select, #kid_select").change(function() {
            	$("#adult").val($("#adult_select option:selected").val());
            	$("#kid").val($("#kid_select option:selected").val());
            	
            	var adult_add = 0;
        		var kid_add = 0;
        		if($("#adult_select option:selected").val() > <%=read.getAdult()%>){
        			adult_add = ($("#adult_select option:selected").val() - <%=read.getAdult()%>)*100000;
        		} else { 
        			adult_add = 0;
        		}
        		if($("#kid_select option:selected").val() > <%=read.getKid()%>){
        			kid_add = ($("#kid_select option:selected").val() - <%=read.getKid()%>)*(100000*0.7);
        		} else {
        			kid_add = 0;
        		}
        		
        		var person_price = adult_add + kid_add;
        		$("#person_price").val(person_price);
        		
        		var aac = $("#adult_select option:selected").val() - <%=read.getAdult()%>;
        		if(aac < 0) {
        			aac = 0;
        		} 
        		$("#adult_add").val(aac);
        		var kac = $("#kid_select option:selected").val() - <%=read.getKid()%>;
        		if(kac < 0) {
        			kac = 0;
        		} 
        		$("#kid_add").val(kac);
            });
            
            $("#checkin, #checkout").change(function() {
            	var arr_in = $("#checkin").val().split("-");
        		var arr_out = $("#checkout").val().split("-");
        		var time_in = new Date(arr_in[0], arr_in[1], arr_in[2]);
        		var time_out = new Date(arr_out[0], arr_out[1], arr_out[2]);
        		var day_stay = (time_out.getTime() - time_in.getTime())/(1000*60*60*24);
        		$("#day_stay").val(day_stay);
        		$("#room_price").val(<%=read.getPrice()%> * day_stay);
        		
        		checkDate(<%=read.getNo()%>, $("#checkin").val(), $("#checkout").val());
            });
            
        });
        
        function checkDate(no, checkin, checkout) {
        	$.ajax({
        		type : "GET",
        		url : "/book/room/check_ds?no="+no+"&checkin="+checkin+"&checkout="+checkout, 
        		async : false,
        		success : function(data){
        			$("#submit_btn_area").html(data);
        		}
        	});
        }
        
        
    </script>
    <title>객실 상세</title>
</head>
<body>
<jsp:include page="/header_menu" flush="true"/>
    
    <!-- 컨테이너 영역 시작 -->
    <div id="container">
        <div class="container">
            <!-- 서브페이지 상단 타이틀 -->
            <h1><%=read.getName()%></h1>

            <!-- 객실 사진 슬라이드 영역 -->
            <div class="slide">
                <div class="sub_page_panel">
              	<%
              	if(list_i.size() != 0) {
              		for(int i=0; i<list_i.size(); i++) {
              	%>
              		 <div class="room-wrap">
                        <div><img src="/upload/room/<%=list_i.get(i).get("image")%>"/></div>
                    </div>
              	<%
              		}
              	}
              	%>  
                </div>
            </div>
            <div class="room-btn clear">
                <button class="slick-prev"></button>
                <button class="slick-next"></button>
            </div>

            <div class="brief">
            	<%
            	String r_instruction = "";
            	String[] arr = read.getInstruction().split("<br/>");
            	for(int i=0; i<arr.length; i++) {
            		r_instruction += arr[i];
            	}
            	%>
                <h5><%=r_instruction %></h5>

                <div class="book"><a href="#">객실 예약하기</a></div>

				<div class="book-wrap">
					<div class="direct-reservation">
						<h2>RESERVATION</h2>
						<div class="d-r-input clear">
							<form action="/book/room/add_option" method="post">
								<div class="d-r-input1">
									<input type="text" name="checkin" id="checkin" value="<%=DateUtil.getToday()%>">
									<p>~</p>
									<input type="text" name="checkout" id="checkout" value="<%=DateUtil.getDayDateAdd(1, DateUtil.getToday())%>"> 
									<select id="adult_select">
										<option>성인</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select> 
									<select id="kid_select">
										<option>어린이</option>
										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>
								<span id="submit_btn_area"></span>
								<!-- <div class="d-r-input2">
									<input type="submit" value="객실 예약" />
								</div> -->
								<input type="hidden" name="room_name" id="room_name" value="<%=read.getName()%>"/>
								<input type="hidden" name="adult" id="adult" value=""/>
								<input type="hidden" name="kid" id="kid" value=""/>
								<input type="hidden" name="adult_basic" id="adult_basic" value="<%=read.getAdult()%>"/>
								<input type="hidden" name="kid_basic" id="kid_basic" value="<%=read.getKid()%>"/>
								<input type="hidden" name="adult_add" id="adult_add" value=""/>
								<input type="hidden" name="kid_add" id="kid_add" value=""/>
								<input type="hidden" name="day_stay" id="day_stay" value=""/>
								<input type="hidden" name="person_price" id="person_price" value=""/>
								<input type="hidden" name="room_price" id="room_price" value=""/>
								<input type="hidden" name="room_pk" id="room_pk" value="<%=read.getNo()%>"/>
							</form>
						</div>
						<p class="book-close">
							<a href="#">X</a>
						</p>
					</div>
				</div>
			</div>
            
            <div class="info-box">
                <ul class="info-detail clear line">
                    <li class="title">기본정보</li>
                    <li clear>
                        <ul class="themost">
                            <li>체크인</li>
                            <li>체크아웃</li>
                            <li>위치</li>
                            <li>전망</li>
                            <li>객실타입</li>
                        </ul>

                        <ul class="second">
                            <li><%=read.getCheckin_time()%></li>
                            <li><%=read.getCheckout_time()%></li>
                            <li><%=read.getLocation()%></li>
                            <li><%=read.getLandscape()%></li>
                            <li><%=read.getType() %></li>
                        </ul>
                    </li>
                </ul>

                <ul class="info-detail clear line">
                        <li class="title">편의시설</li>
                        <li clear>
                            <ul class="themost1">
                            
                            <% 
                            if(list_s.size() != 0) {
                            	for(int i=0; i<list_s.size(); i++) { 
                            %>
                            	<li>·<%=list_s.get(i).get("name") %></li>
                            <% 	
                            	}
                           	}
                            %>
                            </ul>
                        </li>
                </ul>

                <ul class="info-detail clear">
                            <li class="title">투숙객 혜택</li>
                            <li clear>
                                <ul class="themost1">
        
                                    <li>·피트니스 클럽 무료 이용</li>
                                    <li>·실내 수영장 무료 이용</li>
                                    <li>·사우나 유료 이용 (27,500원)</li>
                                    <li>·모앙클레르 10% 할인</li>
                                    <li>·스파 & 갤러리 10% 할인</li>
                                    <li><p>(매월 첫째주 화요일 휴관일로 이용이 제한됩니다.)</p></li>
                                </ul>        
                            </li>
                </ul>
            </div>
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
                    <li><a href="#"><img src="../img/sns1.png"></a></li>
                    <li><a href="#"><img src="../img/sns2.png"></a></li>
                    <li><a href="#"><img src="../img/sns3.png"></a></li>
                    <li><a href="#"><img src="../img/sns4.png"></a></li>
                </ul>
            </div>
            <div class="footer-bottom">
                <h5>에이블현대호텔앤리조트주식회사  대표이사  JANG PAUL HYUK (장혁),최종윤  사업자 등록번호 104-81-21344  통신판매업신고번호 2012-서울중구-1214<br/>
                    서울시 중구 장충단로60(장충동2가), 04605 / TEL 02.2250.8000
                </h5>
                <h6>Copyright 2018 Banyan Tree Club & Spa. All Rights Reserved</h6>
                <ul class="support-logo clear">
                    <li><img src="../img/footericon1.png"></li>
                    <li><img src="../img/footericon2.png"></li>
                    <li><img src="../img/footericon3.png"></li>
                    <li><img src="../img/footericon4.png"></li>
                </ul>
            </div>
        </div>
    </div>

    
</body>
</html>