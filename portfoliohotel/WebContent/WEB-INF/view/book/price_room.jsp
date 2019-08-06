<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/default.css">
    <link rel="stylesheet" href="../css/jquery-ui.css">
    <link rel="stylesheet" href="../css/header-fixed.css">
    <link rel="stylesheet" href="../css/price_room.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="../js/jquery-ui.js"></script>
    <script type="text/javascript" src="../js/datepicker.js"></script>
    <script type="text/javascript" src="../js/gnb.js"></script>
    <title>객실검색</title>
    <script type="text/javascript">
        $(function(){
            $(".toggle-btn").click(function(event){
                 $(this).children("h3").toggle(); 
                 $(this).siblings(".rate-info").toggle();
            });
        });
    
    </script>
</head>
<body>
<!--     <div id="header">
        <div class="header-center">
            <div class="pc-header">
                <h1 class="logo"><a href="../index.html"><img src="../img/header-logo.png"></a></h1>
                <ul class="pc-gnb">
                    <li>
                        <a href="#">Book</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center">
                                        <div class="pc-sub-box">
                                            <h2><a href="../pkg/special_promotion.html">Promotion</a></h2>
                                            <ul class="offer">
                                                <li><a href="../pkg/room_offer.html">Room Package</a></li>
                                                <li><a href="../pkg/dining_offer.html">Dining Package</a></li>
                                                <li><a href="../pkg/etc_offer.html">Events & Gift</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Rooms</h2>
                                            <ul class="Rooms">
                                                <li><a href="../room/room-detail-subpage.html">Namsan Pool Deluxe Room</a></li>
                                                <li><a href="../room/room-detail-subpage2.html">Namsan Pool Premier Suite</a></li>
                                                <li><a href="../room/room-detail-subpage3.html">Namsan Presidential Suite</a></li>
                                                <li><a href="../room/room-detail-subpage4.html">Spa Sanctuary Suite</a></li>
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
                        <a href="#">Facilites</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center center clear">
                                            <div class="pc-sub-box facil-left">
                                                <h2 class="no-line">Facilities</h2>
                                                <ul>
                                                    <li><a href="../facilites.html#f1">The Oasis</a></li>
                                                    <li><a href="../facilites.html#f2">Indoor Swimming Pool</a></li>
                                                    
                                                </ul>
                                            </div>
                                            <div class="pc-sub-box mtop">
                
                                                <ul class="Rooms">
                                                        <li><a href="../facilites.html#f3">Fitness Centre</a></li>
                                                        <li><a href="../facilites.html#f4">Sauna</a></li>
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
                                                <a href="../membership/notice.html" class="notice-a">
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
                                                <a href="../membership/faq.html">
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
                                                <a href="../membership/qna.html">
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
                    <li><a href="#">SIGN IN</a></li>
                </ul>
                <a href="../membership/sign_in.html">Sign in</a>
            </div>
        </div>
    </div> -->
	<jsp:include page="/header_menu" flush="true"/>

        <div id="container">
                    <div class="chk-section">
                        <h2>객실검색</h2>

                        <!-- 상단 예약진행 순서 -->
                            <ul class="cha_index clear">
                                <li><a href="check_room.html">객실검색 <span>></span> </a></li>
                                <li class="current-page"><a href="#">객실예약</a></li>
                                <li><a href="#"><span>></span>정보입력</a></li>
                                <li><a href="#"><span>></span> 예약완료</a></li>
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
                                        <input type="text" name="start-date" id="start-date" class="InDate"
                                        maxlength="10" placeholder="체크인" value="" readonly>
                                        <input type="text" name="end-date" id="end-date" class="OutDate"
                                        maxlength="10" placeholder="체크아웃" value="" readonly>
                                    </div>
        
                                    <!-- 기간 -->
                                    <div class="days">0박</div>
        
                                    
                                    <div class="room after">
                                        <label for="roomCount">객실</label>
                                    </div>
                                    <!-- 객실 수 -->
                                    <div class="roomCount select-option">
                                        <select name="roomCount" id="roomCount" class="option01" aria-hidden="true">
                                            <option value="1">1개</option>
                                            <option value="2">2개</option>
                                            <option value="3" selected>3개</option>
                                            <option value="4">4개</option>
                                            <option value="5">5개</option>
                                        </select>
                                    </div>
        
                                    <div class="adult after">
                                        <label for="adult">어른</label>
                                    </div>
        
                                    <div class="adultCount select-option">
                                        <select name="adult" id="adult" class="option1" aria-hidden="true">
                                            <option value="1">1명</option>
                                            <option value="2" selected>2명</option>
                                        </select>
                                    </div>
        
                                    <div class="child after">
                                            <label for="child">어린이</label>
                                    </div>
        
                                    <div class="childCount select-option">
                                        <select name="child" id="child" class="option1" aria-hidden="true">
                                            <option value="0" selected>0명</option>
                                            <option value="1">1명</option>
                                            <option value="2">2명</option>
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
                            <li><a href="check_room.html">객실로 보기</a></li>
                            <li class="on"><a href="#">요금으로 보기</a></li>
                        </ul>


                        <div class="priceResult-area clear">
                                <div class="resultSection">
                                    <div class="thePrice">
                                        <h3>객실요금</h3>
                                    </div>
                                    <div class="priceResult clear">
                                            <ul class="etc clear">
                                                <li><h1>1,150,000원 <span>~</span></h1></li>
                                                <li>
                                                    <h3>KRW/1박, 1객실</h3>
                                                    <p>(세금 및 수수료 별도)</p>
                                                </li>
                                            </ul>
                                    </div>
                                </div>
                                <ul class="rate-info clear">
                                                <li class="photo01">
                                                    <h1 class="camera"><a href="../room/room-detail-subpage.html" target="_blank"><img src="../img/ico_photo.png"></a></h1>
                                                </li>
                                                <li>
                                                    <ul class="roomResult-info clear">
                                                        <li><h2>NAMSAN POOL PREMIER SUITE</h2></li>
                                                        <li class="specific-notice clear">
                                                            <ul class="specific-notice01">
                                                                <li>객실크기 : 95~105㎡</li>
                                                                <li>객실위치 : 11~12층</li>
                                                                <li>수용인원 : 6명</li>
                                                            </ul>
                                                            <ul class="specific-notice02">
                                                                <li>객실타입 : 투룸</li>
                                                                <li>배드타입 : 킹 사이즈</li>
                                                            </ul>
                                                        </li>
                                                        <li>
                                                            <p>남산 풀 프리미어 스위트는 96㎡부터 105㎡의 면적으로 프라이빗하고<br/>
                                                            여유로운 휴식을 선사합니다. 한 층에 2개의 객실이 자리하고 있어 더욱 <br/>
                                                            프라이빗한 시간을 보내실 수 있으며 파노라믹 뷰로 펼쳐진 서울의 전경과<br/>
                                                            웅장한 남산의 모습을 객실 어디에서나 감상하실 수 있습니다. 
                                                            </p>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <div class="submit"><a href="add_option.html">예약하기</a></div>     
                                </ul>
                                <button class="toggle-btn">
                                    <h3 class="btn-show">예약 가능한 객실 보기</h3>
                                    <h3 class="btn-close">예약 가능한 객실 닫기</h3>
                                </button>
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