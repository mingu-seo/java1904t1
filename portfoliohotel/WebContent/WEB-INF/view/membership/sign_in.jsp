<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board.member.*"%>
<%@ page import="util.*"%>
<%
	MemberVO param = (MemberVO) request.getAttribute("vo");
	ArrayList<MemberVO> list = (ArrayList) request.getAttribute("list");
	MemberVO sessionMember = (MemberVO)session.getAttribute("memberInfo");
%>


<%@ page import="java.security.SecureRandom"  %>
<%@ page import="java.math.BigInteger"  %>
<%@ page import="java.net.URLEncoder"  %>
<%
String client_id = "yyt5qpvTbPa5tqyLB0Td";   //수정할 시 클라이언트 아이디 수정
String redirectURI = URLEncoder.encode("http://localhost:8080/sns/login/naverCallback.jsp"); //수정할 시 콜백url 수정
SecureRandom random = new SecureRandom();
String state = new BigInteger(130, random).toString(32);
session.setAttribute("state", state);

String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id="+client_id+"&redirect_uri="+redirectURI+"&state="+state;
%>



<script>


function loginCheck(){
	if ( getObject("email").value.length < 1 ) {
		alert("이메일을 입력해주세요.");
		getObject("email").focus();
		return false;
	}
	if ( getObject("password").value.length < 1 ) {
		alert("비밀번호를 입력해주세요.");
		getObject("password").focus();
		return false;
	}
	var f = document.board;
	if (f.reg.checked==true) {
	   document.cookie = "cookie_userid=" + f.id.value + ";path=/;expires=Sat, 31 Dec 2050 23:59:59 GMT;";
	} else {
	   var now = new Date();	
	   document.cookie = "cookie_userid=" + f.id.value + ";path=/;expires="+now.getTime();
	}
	return true;
	
	
}

function userid_chk() {
	var f=document.member;
	var useridname = CookieVal("cookie_userid");
	
	if (useridname=="null"){	
		f.id.focus();
		f.id.value="";
	} else {
		f.password.focus();
		f.id.value=useridname;
		f.reg.checked=true;
	}
}

function CookieVal(cookieName) {
	thisCookie = document.cookie.split("; ");
	for (var i = 0; i < thisCookie.length;i++) {
		if (cookieName == thisCookie[i].split("=")[0]) {
			return thisCookie[i].split("=")[1];
		}
	}
	return "null" ;
}




</script>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>로그인페이지</title>
</head>
<body>
    <div id="header">
        <div class="header-center">
            <div class="pc-header">
                <h1 class="logo"><a href="/index"><img src="../img/header-logo.png"></a></h1>
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
                                                <li><a href="/room/room-detail-subpage">Namsan Pool Deluxe Room</a></li>
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

                    <li> <a href="/membership/sign_in">Sign in</a></li> 

                  

                </ul>
               
            </div>
        </div>
    </div>

    
    <div id="container">
        <div class="login-section">
            <h2>멤버십 로그인</h2>
            <h3>Log In</h3>
            <div class="login-box clear">
                <!-- <form action="#" method="POST"> -->
                <form name="mamber" id="member" method="post" action=" <%=request.getContextPath()%>/membership/login" onsubmit="return loginCheck();">
                    <div class="login-box-logo"><img src="../img/sign_in_img/login-logo.png"></div>
                    <div class="login-board clear">
                        <div class="login-box-left">
                            <!-- ID 구역 -->
                            <!-- <input type="text" id="id" name="id" placeholder="아이디 또는 이메일"> -->
                            <input type="text" id="email" name="email" placeholder="이메일">
                            <!-- 비밀번호 구역 -->
                            <!-- <input type="password" id="password" name="password" placeholder="비밀번호"> -->
                            <input type="password" id="password" name="password" placeholder="비밀번호">
                        </div>
                        <div class="login-board-right">
                            <!-- <input type="submit" id="submit" value="LOGIN"> -->
                            <input type="submit" <%-- src="<%=request.getContextPath()%>" --%> value ="로그인" class="loginBtn" title=""/>
                        </div>
                        <div class="id-remember">
                            <input type="checkbox" id="login-chk" name="login-chk" >
                            <label for="login-chk">아이디 기억하기</label>
                        </div>
                        <!-- <h4 class="find_id"><a href="#">· 아이디 / 비밀번호 찾기</a></h4> -->
                        <h4 class="find_id">
							<a href="find_email">이메일찾기 </a><a>/</a>
							<a href="find_pw"> 비밀번호 찾기</a>
						</h4>
                        
                    </div> 
                </form>    

                <div class="login-info">
                    <p>
                        호텔 회원번호의 경우 아이디 입력 영역에 입력해 주세요.<br/>
                        오프라인 회원의 경우 온라인 '반얀트리 멤버십' 가입을 통해 계정연동 가능합니다.
                    </p>

                    <ul class="snsLogin clear">
                     
                        <li>
                        <!-- <div id="naver_id_login" class="naver" ><p>네이버로 로그인</p></div> -->
                         
                        <button class="naver" href="#;" id="naverBtn"><p>네이버로 로그인</p></button>
       			<script>
			    		$(function() {
			    			$("#naverBtn").click(function() {
			    				window.open('<%=apiURL%>', '_blank', 'width=400, height=400,scrollbar=no,status=no');
			    			});
			    		});
    
    			</script>
                        </li>

                        <li>
                            <!-- <button class="kakao"><p>카카오로 로그인</p></button> -->
                            <button class="kakao" onclick="loginWithKakao()"><p>카카오로 로그인</p></button>
                        </li>
                    </ul>
                </div>
                <h5>아직 호텔 회원이 아니신가요?</h5>
                <p>온라인 회원은 예약/결제 정보를 온라인에서 확인하실 수 있습니다.</p>
                <div class="join-box">
                    <a href="choice_join">호텔 멤버십 가입 </a>
                </div>
                <div class="error-text clear">
                    <h6>멤버십 가입 및 온라인 인증에 문제가 생기셨나요?</h6>
                    <h6>대표문의 (02-455-5000)로 연락 주시기 바랍니다.</h6>
                </div>
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
   <script type='text/javascript'>
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
                       url : "/membership/choice_join",
                       data : {
                          "id":res.id,
                          "email":res.kakao_account.email
                       },
                       dataType: "HTML",
                       success : function(data) {
                          if(data.trim() == "ok"){
                             
                          }
                       }
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
 <!-- <a id="kakao-login-btn"></a>
    <a href="http://developers.kakao.com/logout">로그아웃</a> -->
    </html>