<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="board.member.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="pkg.res.*" %>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
MemberVO data = (MemberVO)request.getAttribute("data");
MemberVO sessionMember = (MemberVO)session.getAttribute("memberInfo");
%>
<%
ArrayList<Pkg_resVO> plist = (ArrayList<Pkg_resVO>)request.getAttribute("plist");
int ptotCount = (Integer)request.getAttribute("ptotCount");
int ptotPage = (Integer)request.getAttribute("ptotPage");
%>
<%
Pkg_resVO prparam = (Pkg_resVO)request.getAttribute("prvo");
%>
<%-- <%
MemberVO sessionPkg_res = (MemberVO)session.getAttribute("memberInfo");
%> --%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/mypage.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>마이페이지</title>
</head>
<script>
/* String pkg_name = "";
Int pkg_count = "";
String use_date = "";
if(sessionPkg_res != null) {
	
} else {
	
} */
</script>
<body>
    <jsp:include page="/header_menu" flush="true"/>
    
    
    <div id="container">
        
        <div class="banner">
            <div class="mypage-section">
                    <h2>마이페이지</h2>
                    <h3>MY PAGE</h3>
                </div>
        </div>
        <div class="reservation clear">
            <h3>예약현황<span class="title-sub">RESERVATION STATUS</span></h3>
            <div class="reservation-status-left">
                <table>
                    <tr class="table-head">
                        <th>예약 상품</th>
                        <th>인원</th>
                        <th>추가사항</th>
                    </tr>
                    <tr class="reserved">
                        <td>NAMSAN POOL DELUX ROOM</td>
                        <td class="participants">성인 x 2
                            <br/>
                            어린이 x 1
                        </td>
                        <td class="option">
                            SPA
                            <span class="option-select">- 추가사항 없음</span>
                            침대 추가
                            <span class="option-select">x 1</span>
                            웰컴 와인 & 치즈
                            <span class="option-select">x 1</span>
                        </td>
                    </tr>
                    <tr>
                        <td>TOTAL</td>
                        <td class="price" colspan="2">1,000,000 WON</td>
                    </tr>                   
                    <tr class="table-head">
                        <th>패키지 예약 상품</th>
                        <th>수량</th>
                        <th>수령일</th>
                    </tr>
                    <tr class="reserved">
                        <td>
                        <%
                        	if (ptotCount == 0) {
                        %>
                        	<ul>
                        		<li class="first">예약한 상품이 없습니다.</li>
                        	</ul>
                        <%
                        	} else {
                        		Pkg_resVO prdata;
                        		for (int i=0; i<plist.size(); i++) {
                        			prdata = plist.get(i);
                        %>
                        	<li><%=prdata.getPkg_name()%></li>
                        	<br><br>
                        <%
                        		}
                        	}
                        %>
                        </td>
                        <td class="participants">
                        <%
                        	if (ptotCount == 0) {
                        %>
                        	<ul>
                        		<li class="first">예약한 상품이 없습니다.</li>
                        	</ul>
                        <%
                        	} else {
                        		Pkg_resVO prdata;
                        		for (int i=0; i<plist.size(); i++) {
                        			prdata = plist.get(i);
                        %>
                        	<li><%=prdata.getPkg_count()%></li>
                        <%
                        		}
                        	}
                        %>                        
                        </td>
                        <td class="participants">
                        <%
                        	int totalPrice = 0;
                        	if (ptotCount == 0) {
                        %>
                        	<ul>
                        		<li class="first">예약한 상품이 없습니다.</li>
                        	</ul>
                        <%
                        	} else {
                        		Pkg_resVO prdata;
                        		for (int i=0; i<plist.size(); i++) {
                        			prdata = plist.get(i);
                        			totalPrice += prdata.getTotal_price();
                        %>
                        	<li><%=prdata.getUse_date()%></li>
                        <%
                        		}
                        	}
                        %>                              
                        </td>
                    </tr>                                                                             
                    <tr>
                        <td>TOTAL</td>
                        <td class="price" colspan="2">
                        	<%=totalPrice%> WON
						</td>
                    </tr>
                </table>
            </div>
            <div class="reservation-status-right">
                <div class="my-info">
                  <h4>
  
	<%=sessionMember.getF_name()%> <%=sessionMember.getL_name()%> 님<br/>
	
                      환영합니다 !
                    </h4>
                    <table>
                        <tr>
                            <td>회원등급</td>
                            
                            <td><%=CodeUtil.getMgrade(sessionMember.getGrade())%></td>
                        </tr> 
                   
                        <tr>
                            <td>포인트</td>
                            <td><%=sessionMember.getPoint()%> P</td>
                            <%-- <th scope="row"><label for="">포인트</label></th>
							<td colspan="3"><%=data.getPoint()%></td> --%>
                        </tr>
                    </table>
                </div>
                <ul class="my-info-list">
                    <li><a href="edit_account">개인정보 수정</a></li>
                    <li><a href="delete_account">회원탈퇴</a></li>
                    
                    <li><a href="/membership/logout">로그아웃</a></li>
                </ul>
            </div>
        </div>
        <div class="point">
            <h3>포인트 내역<span class="title-sub">POINT</span></h3>
            <div class="point-box">
                <table>
                    <tr>
                        <td><span class="plus">+</span> 9,000P</td>
                        <td>2019-06-29</td>
                    </tr>
                    <tr>
                        <td><span class="plus">+</span> 10,000P</td>
                        <td>2019-07-01</td>
                    </tr>
                    
                </table>
            </div>
        </div>
        <div class="my-question">
            <h3>나의 질문<span class="title-sub">MY QUESTION</span></h3>
            <div class="my-question-box">
                <table>
                    <tr>
                            <td><a href="#"><span class="plus">┌</span>회원탈퇴에 대한 답변입니다.</a></td>
                            <td>2019-06-29</td>
                    </tr>
                    <tr>
                        <td><a href="../qna.html">회원탈퇴를 하고싶어요.</a></td>
                        <td>2019-07-01</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="membership-benefit">
                <h3>멤버십 등급별 특전<span class="title-sub">MEMBERSHIP CLASS BENEFIT</span></h3>
            <div class="membership-benefit-box clear">
                <div class="membership-benefit-box-center clear">
                
                <%if(sessionMember.getGrade() == 1) {%>
                    <div class="classic on">   
                    <div class="benefit-img">                 
                            <p>CLASSIC</p>
                        </div>
                        <div class="benefit-text">
                            <p>1번 투숙 또는 3박 이상 이용</p>
                            <p>객실이용 금액 2% 적립</p>
                        </div>
                    </div>
                    <%}else { %>                 
                    <div class="classic"> 
                        <div class="benefit-img">
                        
                                                
                            <p>CLASSIC</p>
                        </div>
                        <div class="benefit-text">
                            <p>1번 투숙 또는 3박 이상 이용</p>
                            <p>객실이용 금액 2% 적립</p>
                        </div>
                    </div>
                    <%} %>
                    
                    <%if(sessionMember.getGrade() == 2) {%>
                    <div class="vip on">
                            <div class="benefit-img">
                                <p>VIP</p>
                            </div>
                            <div class="benefit-text">
                                <p>3번 투숙 또는 6박 이상 이용</p>
                                <p>객실이용 금액 5% 적립</p>
                            </div>
                    </div>
                    <%}else { %> 
                    <div class="vip">
                            <div class="benefit-img">
                                <p>VIP</p>
                            </div>
                            <div class="benefit-text">
                                <p>3번 투숙 또는 6박 이상 이용</p>
                                <p>객실이용 금액 5% 적립</p>
                            </div>
                    </div>
                    <%} %>
                    
                    <%if(sessionMember.getGrade() == 3) {%>
                    <div class="vvip on">
                            <div class="benefit-img">
                                <p>VVIP</p>
                            </div>
                            <div class="benefit-text">
                                <p>7번 투숙 또는 12박 이상 이용</p>
                                <p>객실이용 금액 7% 적립</p>
                            </div>
                    </div>
                    <%}else{ %>
                    <div class="vvip">
                            <div class="benefit-img">
                                <p>VVIP</p>
                            </div>
                            <div class="benefit-text">
                                <p>7번 투숙 또는 12박 이상 이용</p>
                                <p>객실이용 금액 7% 적립</p>
                            </div>
                    </div>
                    <%} %>
                    
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
</html>