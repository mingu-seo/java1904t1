<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="dining_res.*"%>
<%@ page import="java.util.*"%>
<%@ page import="board.member.*" %>
<%@ page import="util.*" %>
<%
Dining_resVO param = (Dining_resVO) request.getAttribute("vo");
Dining_resVO data = (Dining_resVO) request.getAttribute("data");
MemberVO member_vo = (MemberVO)session.getAttribute("memberInfo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/default.css">
    <link rel="stylesheet" href="../css/jquery-ui.css">
    <link rel="stylesheet" href="../css/header-fixed.css">
    <link rel="stylesheet" href="../css/dining_book_channel.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="../js/jquery-ui.js"></script>
    <script type="text/javascript" src="../js/gnb.js"></script>
    <script type="text/javascript" src="../js/datepicker.js"></script>
    <title>정보입력</title>
</head>


<script>

 
$(function() {
	
	$( "#d_day" ).datepicker({
        monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
        dateFormat: "yy-mm-dd",
        yearRange: "2019:2019",
        minDate: "0D" 
    });
	
	$("#d_day").change(function(){ 
		    console.log($('#d_day').val());
	});
	
	
	if($("#hideEmailOpt").val() == "@") {
	$("#hideEmailOpt").hide();
	
	$("#email2").attr("disabled",false);
	$("#selectEmail").val("1").prop("selected", true);
	}
		
		
	$('#selectEmail').change(function(){ 
		   $("#selectEmail option:selected").each(function () { 
		      if($(this).val()== '1'){ //직접입력일 경우
		         $("#email2").val(''); //값 초기화
		         $("#email2").attr("disabled",false); //활성화
		         }else{ //직접입력이 아닐경우
		            $("#email2").val($(this).text()); //선택값 입력
		            $("#email2").attr("disabled",true); //비활성화
		         } 
		    }); 
	});
	
	
	/* $("#telselect").change(function(){
		$("#guest_tel1").val($("#telselect option:selected").val());
		console.log($("#guest_tel1").val());
		console.log($("#guest_tel2").val());
		console.log($("#guest_tel3").val());
	});  */
	
});
	
  	function change_price() {
  		var price = Number($("#dining_product option:selected").data("price"));
  		var adult = Number($("#res_adult").val());
  		var kid = Number($("#res_kid").val());
  		
  		var totalPrice = price * (adult + kid);
  		
  		if (adult >= 5) {
  			totalPrice = totalPrice - totalPrice*0.1;
  		}
  		console.log(totalPrice);
  		$("#totalPrice").html(totalPrice);
  		$("#total_price").val(totalPrice);
	}  
</script>


<body>
    
    <div id="header">
        <div class="header-center">
            <div class="pc-header">
                <h1 class="logo"><a href="../index.html"><img src="../img/header-logo.png"></a></h1>
                <ul class="pc-gnb">
                    <li>
                        <a href="#">Book</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center">
                                        <div class="pc-sub-box">
                                            <h2><a href="../special_promotion.html">Promotion</a></h2>
                                            <ul class="offer">
                                                <li><a href="../room_offer.html">Room Package</a></li>
                                                <li><a href="../room_offer.html">Dining Package</a></li>
                                                <li><a href="../room_offer.html">Events & Gift</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Rooms</h2>
                                            <ul class="Rooms">
                                                <li><a href="../room-detail-subpage.html">Namsan Pool Deluxe Room</a></li>
                                                <li><a href="../room-detail-subpage.html">Namsan Pool Premier Suite</a></li>
                                                <li><a href="../room-detail-subpage.html">Namsan Presidential Suite</a></li>
                                                <li><a href="../room-detail-subpage.html">Spa Sanctuary Suite</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Dining</h2>
                                            <ul class="Dining">
                                                <li><a href="#">The Festa</a></li>
                                                <li><a href="#">Granum Dining Lounge</a></li>
                                                <li><a href="#">Moon Bar</a></li>
                                                <li><a href="#">The Oasis Outdoor Kitchen</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Meeting & Wedding</h2>
                                            <ul class="Meeting & Wedding">
                                                <li><a href="#">Meeting</li>
                                                <li><a href="#">Wedding</a></li>
                                                <li><a href="#">Family Party</a></li>
                                            </ul>
                                        </div>
                                    </div>
                            </div>
                    </li>
                    <li class="facilities">
                        <a href="#">Facilities</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center center clear">
                                            <div class="pc-sub-box facil-left">
                                                <h2 class="no-line">Facilities</h2>
                                                <ul>
                                                    <li><a href="../facilities.html#f1">The Oasis</a></li>
                                                    <li><a href="../facilities.html#f2">Indoor Swimming Pool</a></li>
                                                    
                                                </ul>
                                            </div>
                                            <div class="pc-sub-box mtop">
                
                                                <ul class="Rooms">
                                                        <li><a href="../facilities.html#f3">Fitness Centre</a></li>
                                                        <li><a href="../facilities.html#f4">Sauna</a></li>
                                                </ul>
                                            </div>
                                            <div class="pc-sub-box mtop facil-right">
                                                
                                                <ul class="Dining">
                                                    <li><a href="#">Troon Golf Academy</a></li>
                                                    <li><a href="#">Foresta Beauty Salon</a></li>
                                                </ul>
                                            </div>
                                        </div>
                            </div>
                        
                    </li>
                    <li>
                        <a href="#">Support</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center center clear">
                                            <div class="pc-sub-box">
                                                <h2 class="no-line">Support</h2>
                                                <a href="../notice.html" class="notice-a">
                                                <ul>
                                                    <li>Notice</li>
                                                    <li class="support-text">
                                                        반얀트리 공지사항과<br/>
                                                        놓칠 수 없는 이벤트 정보를 알려드립니다.
                                                    </li>
                                                    <li class="support-icon"><img src="../img/notice-icon.png"></li>
                                                </ul>
                                                </a>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                <a href="../faq.html">
                                                <ul>
                                                    <li>FAQ</li>
                                                    <li class="support-text">
                                                        반얀트리에 대한<br/>
                                                        자주 묻는 질문입니다.
                                                    </li>
                                                    <li class="support-icon"><img src="../img/faq-icon.png"></li>
                                                </ul>
                                                </a>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                <a href="../qna.html">
                                                <ul>
                                                    <li>Q&A</li>
                                                    <li class="support-text">
                                                        반얀트리에 관한질문 사항이나 궁금한 점을<br/> 
                                                        남겨 주시면 신속하게 답변을 드리겠습니다.
                                                    </li>
                                                    <li class="support-icon"><img src="../img/qna-icon.png"></li>
                                                </ul>
                                                </a>
                                        </div>
                            </div>
                    </li>
                    <!-- <li><a href="#">SIGN IN</a></li> -->
                </ul>
                <a href="sign_in.html">Sign In</a>
            </div>
        </div>
    </div>

    <div id="container">
        <!-- 베너 영역 -->
        <div class="banner">
                <h1 class="head-title">다이닝 예약 신청<br/>
                    <p>RESERVATION FOR DINING</p></h1>
        </div>

        <!-- 내용입력 구역 -->
        <div class="option_channel clear">
        	
        	<%
        	String L_name = "";
         	String F_name = "";
        	String email1 = "";
        	String F_tel = "";
        	String M_tel = "";
        	String L_tel = "";
        	
        	if(member_vo != null) {
        		L_name = member_vo.getL_name();
        		F_name = member_vo.getF_name();
        		email1 = member_vo.getEmail();
        		F_tel = member_vo.getF_tel();
        		M_tel = member_vo.getM_tel();
        		L_tel = member_vo.getL_tel();
        	}
        	%>
            
            <!-- 폼태그 / summit 입력버튼 311번 -->
            <!-- <form action="/book/confirm_dining" method="post" id="frm"> -->
            <form method="POST" name="frm" id="frm" action="/book/confirm_dining/process1" enctype="multipart/form-data" >
                <div class="section-wrap clear">

                    <!-- 왼쪽 정보 입력 박스 구역 -->
                    <div class="left-section">
                        
                        <div class="add01">
                            <div class="sec01-title">
                                <p>예약고객 정보 입력</p>
                            </div>

                            <div class="name_ko">
                                    <label for="name_ko">성명 (한글)＊</label>
                                    <input type="text" id="name_ko" name="guest_lname" placeholder="성" value="<%=member_vo.getF_name()%>">
                                    <input type="text" id="name_ko" name="guest_fname"placeholder="이름" value="<%=member_vo.getL_name()%>">
                            </div>

                           <!-- <div class="name_en clear">
                                    <div class="name_en_title">
                                        <label for="name_en">성명 (영문)＊</label>
                                    </div>
                                    <div class="name_en_area">
                                        <select>
                                            <option>선택안함</option>
                                            <option>Ms.</option>
                                            <option>Mr.</option>
                                        </select>
                                        <input type="text" id="name_en" placeholder="Family Name">
                                        <input type="text" id="name_en" placeholder="First Name">
                                        <p>* 여권에 기재된 영문 성명과 동일하게 기입해 주십시오.</p>
                                    </div>
                            </div> -->

                            <div class="phoneNumber">
                                    <label for="phoneNumber">연락처＊</label>
                                    <select id= "telselect" name="guest_tel1">
                                    	
                                        <option value="1">선택</option>
                                        <option value="010" <%="010".equals(F_tel) ? "selected":""%>>010</option>
                                        <option value="011" <%="011".equals(F_tel) ? "selected":""%>>011</option>
                                        <option value="017" <%="017".equals(F_tel) ? "selected":""%>>017</option>
                                    </select>
                                    <input type="text" id="guest_tel2" name="guest_tel2" placeholder="숫자만 입력가능" value="<%=M_tel%>">
                                    <input type="text" id="guest_tel3" name="guest_tel3" placeholder="숫자만 입력가능" value="<%=L_tel%>">
                            </div>

                            <div class="email">
                                    <ul class="email_adress clear">    
                                        <li class="email-title">
                                            <label for="email">이메일＊</label>
                                        </li>
                                    
                                        <li>
                                            <input type="text" id="email1" name="guest_email" maxlength="40" value="<%=email1%>">
                                        </li>
                                       <%--  <li class="adress">
                                                <select style="width:100px;height:45px;" name="email" id="selectEmail">
                                                	<option value="@<%=email2%>" id="hideEmailOpt"><%=email2%></option>
                                                	<option value="1">직접입력</option>
                                                	<option value="@naver.com" <%="@naver.com".equals(email2) ? "selected":""%>>naver.com</option>
                                                    <option value="@hanmail.net" <%="@hanmail.net".equals(email2) ? "selected":""%>>hanmail.net</option>
                                                    <option value="@google.com" <%="@google.com".equals(email2) ? "selected":""%>>google.com</option>
                                                </select>
                                        </li> --%>
                                    </ul>
                            </div>
                        </div>

                        <div class="add01 card">
                            <div class="sec01-title">
                                    <p>예약 날짜 및 시간</p>
                            </div>

                            <div class="cardType">
                                    <label for="name_ko">예약 상품<span>＊</span></label>
                                    <select name="dining_name" id="dining_product" onChange='change_price();'>
                                        <option value="더 페스트" data-price="50000">더 페스트</option>
                                        <option value="그라넘 다이닝 라운지" data-price="50000">그라넘 다이닝 라운지</option>
                                        <option value="문바" data-price="50000">문바</option>
                                        <option value="더 오아시스 아웃도어 키친" data-price="50000">더 오아시스 아웃도어 키친</option>
                                    </select>
                            </div>
                            
                            <div class="cardType">
                                    <label for="name_ko">예약 날짜<span>＊</span></label>
                                    <input type="text" name= "d_day" id="d_day" placeholder="클릭하시면 날짜를 선택할 수 있습니다.">
                                   
                            </div>

                            <div class="cardType">
                                <label for="name_ko">예약 시간<span>＊</span></label>
                                <select name="d_time">
                                    <option>시간대를 선택해 주세요.</option>
                                    <option value="12:00">12:00</option>
                                    <option value="12:30">12:30</option>
                                    <option value="13:00">13:00</option>
                                   	<option value="13:30">13:30</option>
                                    <option value="14:00">14:00</option>
                                    <option value="17:00">17:00</option>
                                    <option value="17:30">17:30</option>
                                    <option value="18:00">18:00</option>
                                    <option value="18:30">18:30</option>
                                    <option value="19:00">19:00</option>
                                    <option value="19:30">19:30</option>
                                    <option value="20:00">20:00</option>
                                </select>
                            </div>

                            <div class="person clear">
                                    <label for="name_ko">인원<span>＊</span></label>
                                    <ul class="adult clear">
                                       <li class="per">어른</li>
                                       <li>
                                           <select name="adult" id="res_adult" onChange='change_price();'>
                                           		<option value="0">0명</option>
                                                <option value="1">1명</option>
                                                <option value="2">2명</option>
                                                <option value="3">3명</option>
                                                <option value="4">4명</option>
                                                <option value="5">5명</option>
                                                <option value="6">6명</option>
                                                <option value="7">7명</option>
                                                <option value="8">8명</option>
                                                <option value="9">9명</option>
                                                <option value="10">10명</option>
                                            </select>
                                        </li>
                                    </ul>
                                    <ul class="child clear">
                                            <li class="per">어린이</li>
                                            <li>
                                                <select name="kid" id="res_kid" onChange='change_price();'>
                                                	 <option value="0">0명</option>
                                                     <option value="1">1명</option>
                                                     <option value="2">2명</option>
                                                     <option value="3">3명</option>
                                                     <option value="4">4명</option>
                                                     <option value="5">5명</option>
                                                     <option value="6">6명</option>
                                                     <option value="7">7명</option>
                                                     <option value="8">8명</option>
                                                     <option value="9">9명</option>
                                                     <option value="10">10명</option>
                                                 </select>
                                             </li>
                                             <p>(36개월 ~ 12세 미만)</p>        
                                    </ul>
                                    
                            </div>

                            
                        </div>
                                                     
                    </div>

                    <!-- 오른쪽 구역 예약신청 버튼 -->
                    <div class="right-section">
                        <div class="confirmation-box">
                                
                                <div class="content-area03 area clear">
                                	<h3><span></span>총가격</h3>
                                    <p id="totalPrice"></p>
                                <div class="next-but">
                                    <input type="button" id="countsubmit" type="url" onClick="$('#frm').submit();" value="예약 신청">
                                </div>
                                    
                                    <h4><span></span>예약 안내</h4>
                                    <p>· 10인 이상 예약을 원하시는 경우 전화로<br/>
                                        문의 부탁 드립니다.</p>
                                </div>

                                <div class="content-area04 area">
                                    <h4><span></span>예약문의 00-0000-0000</h4>
                                </div>
                                
                        </div>
                    </div>
                </div>  
                <input type="hidden" name="total_price" id="total_price" value="0"/>
                <input type="hidden" name="cmd" value="write" />
            </form> 
        </div>
    </div>

    <!-- 푸터영역 시작 -->
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