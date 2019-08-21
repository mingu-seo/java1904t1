<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.security.SecureRandom"  %>
<%@ page import="java.math.BigInteger"  %>
<%@ page import="java.net.URLEncoder"  %>
<%
String client_id = "yyt5qpvTbPa5tqyLB0Td";   //수정할 시 클라이언트 아이디 수정
String redirectURI = URLEncoder.encode("http://localhost:8080/sns/join/naverCallback.jsp"); //수정할 시 콜백url 수정
SecureRandom random = new SecureRandom();
String state = new BigInteger(130, random).toString(32);
session.setAttribute("state", state);

String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id="+client_id+"&redirect_uri="+redirectURI+"&state="+state;

%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/choice_join.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>Tree_회원가입</title>
</head>




<body>
    <div id="header">
        <div class="header-center">
            <div class="pc-header">
                <h1 class="logo"><a href="/index"><img src="../img/header-logo.png"></a></h1>
                <ul class="pc-gnb">
                    <li>
                        <a href="#">BOOK</a>
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
                   <li><a href="#">SIGN IN</a></li>
                </ul>
                
            </div>
        </div>
    </div>
    
    
    <div id="container">
        <div class="join-section clear">
            <h2>멤버십 회원가입</h2>
            <h3>Log In</h3>
            <div class="join-box join-box1 clear">
                <h2>더호텔 계정 만들기</h2>
                <p>이메일 인증후 회원가입 페이지로<br/> 이동하실 수 있습니다.</p>
                <form action="#" method="POST">

                    <div class="join-box-logo"><img src="../img/sign_in_img/login-logo.png"></div>

                    <!-- <div class="join-board clear">
                            <input type="text" id="email" name="email" placeholder="이메일 입력">
                    </div>  -->
                </form>    
            
                <div class="join-btn" >
                    <a href="join" onclick="goJoin">호텔 멤버십 가입 </a>
                </div>
                
            </div>    

            <div class="join-box join-box2 clear">
                    <h2>SNS로 회원가입</h2>
                    <p>SNS 계정을 통해 간편 가입이 가능합니다.</p>

                    <ul class="snsJoin clear">
                   <li>
                        <!-- <div id="naver_id_login" class="naver" ><p>네이버로 로그인</p></div> -->
                         
                        <button class="naver" href="#;" id="naverBtn"><p>네이버로 회원가입</p></button>
       			<script>
			    		$(function() {
			    			$("#naverBtn").click(function() {
			    				window.open('<%=apiURL%>', '_blank', 'width=400, height=400,scrollbar=no,status=no');
			    			});
			    		});
    
    			</script>
                        </li>

                        <li>
                            <button class="kakao" onclick="loginWithKakao()"><p>카카오로 회원가입</p></button> 
                            <!-- <button class="kakao" href="#;" id="kakaoBtn"><p>카카오로 회원가입</p></button> -->
                    
                           
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

  
    <!-- <a id="kakao-login-btn"></a>
    <a href="http://developers.kakao.com/logout">로그아웃</a> -->
    <script type="text/javascript" src="/js/jquery-1.8.0.min.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   <script type='text/javascript' >
      //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('4d081a510a22bd9e6626b30d9311132e');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function(authObj) {
            /* alert(JSON.stringify(authObj)); */
             alert("로그인 되었습니다.");
             Kakao.API.request({
                  url: '/v2/user/me',
                  success: function(res) {
                    /* alert(JSON.stringify(res)); */
                    console.log(JSON.stringify(res));
                    console.log('email:'+res.kakao_account.email);
                    console.log('name:'+res.properties.nickname);
                    console.log('id:'+res.id);
                    
                    
                    $.ajax({
                       url : "/member/insertSns.do",
                       data : {
                    	   
                    	   l_name : res.properties.nickname,
	               			email : res.kakao_account.email,
	               			sns_key : res.id,
	               			gender : "0",
	               			sns_type : "2"
                       },
                       dataType : "HTML",
               		success : function(data) {
               			alert("정상적으로 가입되었습니다.");
               			window.close();
               		},
               		/* error : function () {
               			alert("이미 가입된 계정입니다.");
               			window.close();
               		} */
                    })
                    // 로그인 하는 경우
                    // ajax member 테이블에 카카오계정을 회원가입한 데이터가
                    // 있으면 ajax 로그인
                    // 없으면 alert('회원가입해라')
                    
                    // 회원가입 하는 경우
                    // ajax member 테이블에 카카오계정을 회원가입한 데이터가
                    // 있으면 alert('이미 가입됌')
                    // 없으면 ajax DB insert
                    
                    
                  },
                  fail: function(error) {
                    alert(JSON.stringify(error));
                  }
                });
          },
          fail: function(err) {
             alert(JSON.stringify(err));
          }
        });
      //]]>
      
      
        function loginWithKakao() {
            // 로그인 창을 띄웁니다.
            Kakao.Auth.login({
              success: function(authObj) {
                alert(JSON.stringify(authObj));
              },
              fail: function(err) {
                alert(JSON.stringify(err));
              }
            });
          };
          
       /*  $(function(){
           $("src='kakao.png'").click(function(){
              loginWithKakao();
           });
        });   */
    </script> 

   <!-- <img src="kakao.png" onclick="loginWithKaKao();"> -->
   

</html>