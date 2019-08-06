<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    <link rel="stylesheet" href="/css/check_room.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.js"></script>
    <script type="text/javascript" src="/js/datepicker.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>객실검색</title>
</head>
<body>
<jsp:include page="/header_menu" flush="true"/>

        <div id="container">
            <div class="chk-section">
                <h2>객실검색</h2>
                <ul class="cha_index clear">
                    <li><a href="/book/check_room">객실검색 <span>></span> </a></li>
                    <li class="/book/detail_sub"><a href="#">객실예약</a></li>
                    <li><a href="/book/personal_info"><span>></span>정보입력</a></li>
                    <li><a href="/book/confirm_room"><span>></span> 예약완료</a></li>
                </ul>
                <!-- 객실 검색 박스 -->
                <div class="select-info-box">
                        <form class="room-search">
                            <div class="period after">
                                <label for="period">숙박기간</label>
                            </div>

                            <div class="checkInOut">
                                <input type="text" name="start-date" id="start-date" class="InDate"
                                maxlength="10" placeholder="체크인" value="" readonly>
                                <input type="text" name="end-date" id="end-date" class="OutDate"
                                maxlength="10" placeholder="체크아웃" value="" readonly>
                            </div>

                            <div class="days">0박</div>

                            <div class="room after">
                                <label for="roomCount">객실</label>
                            </div>

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
                        <div class="re-try">
                                <button class="re-check-btn">재검색</button>
                        </div>
                </div>
            </div>    

            <!-- 탭메뉴 객실/요금으로 보기 -->
            <div class="room-info">
                <ul class="tabMenu clear">
                    <li class="on"><a href="#">객실로 보기</a></li>
                    <li><a href="price_room.do">요금으로 보기</a></li>
                </ul>

            <!--예약 가능한 객실 조회 결과 나오는 영역 -->
                <div class="roomResult-area clear">
                    <ul>
                        <li class="photo roomtype01">
                            <h1 class="camera"><a href="/room/room-detail-subpage" target="_blank"><img src="/img/ico_photo.png"></a></h1>
                        </li>
                        <li>
                            <ul class="roomResult-info clear">
                                <li><h2>NAMSAN POOL DELUXE ROOM</h2></li>
                                <li class="specific-notice clear">
                                    <ul class="specific-notice01">
                                        <li>객실크기 : 50~56㎡</li>
                                        <li>객실위치 : 14~21층</li>
                                        <li>수용인원 : 4명</li>
                                    </ul>
                                    <ul class="specific-notice02">
                                        <li>객실타입 : 원룸</li>
                                        <li>배드타입 : 킹 사이즈</li>
                                    </ul>
                                </li>
                                <li>
                                    <p>포근한 킹사이즈 베드에서 몇 발자국 떼지 않고도 바로 널찍한<br/>
                                        릴랙세이션 풀을 즐길 수 있습니다. 따스한 나무빛이 여기저기에서 <br/>
                                        돋보이는 방 안에서는 안개가 자욱한 숲이 우거진 전경이 대형 유리창 <br/>
                                        너머로 내려다 보이고, 드레스룸을 비롯한 특별한 시설이 다채롭게 <br/>
                                        준비되어 있어 만족스러운 시간을 선사합니다. 
                                    </p>
                                </li>
                                <li>
                                    <div class="priceResult clear">
                                        <ul class="etc clear">
                                            <li><h1>688,500원 <span>~</span></h1></li>
                                            <li>
                                                <h3>KRW/1박, 1객실</h3>
                                                <p>(세금 및 수수료 별도)</p>
                                            </li>
                                        </ul>
                                        <button class="reservation-btn"><a href="/book/add_option">예약하기</a></button>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    
                </div>
                <!-- 예약 가능 검색 조회 결과 객실 한개 영역 끝 -->

                <!-- 사용 가능한 다른 객실 순차적으로 나옴 -->
                <div class="roomResult-area clear">
                        <ul>
                            <li class="photo roomtype02">
                                <h1 class="camera"><img src="/img/ico_photo.png"></h1>
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
                                    <li>
                                        <div class="priceResult clear">
                                            <ul class="etc clear">
                                                <li><h1>1,150,000원 <span>~</span></h1></li>
                                                <li>
                                                    <h3>KRW/1박, 1객실</h3>
                                                    <p>(세금 및 수수료 별도)</p>
                                                </li>
                                            </ul>
                                            <button class="reservation-btn"><a href="#">예약하기</a></button>
                                        </div>
                                    </li>
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
                            <li><a href="#"><img src="/img/sns1.png"></a></li>
                            <li><a href="#"><img src="/img/sns2.png"></a></li>
                            <li><a href="#"><img src="/img/sns3.png"></a></li>
                            <li><a href="#"><img src="/img/sns4.png"></a></li>
                        </ul>
                    </div>
                    <div class="footer-bottom">
                        <h5>에이블현대호텔앤리조트주식회사  대표이사  JANG PAUL HYUK (장혁),최종윤  사업자 등록번호 104-81-21344  통신판매업신고번호 2012-서울중구-1214<br/>
                            서울시 중구 장충단로60(장충동2가), 04605 / TEL 02.2250.8000
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