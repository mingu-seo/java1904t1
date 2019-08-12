<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="board.qna.*" %>
<%@ page import="board.member.*" %>
<%@ page import="util.*" %>
<%@ page import="property.*" %>
<%
QnaVO param = (QnaVO)request.getAttribute("param");
QnaVO qdata = (QnaVO) request.getAttribute("qdata");

%>
<!DOCTYPE html>

<html lang="ko">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/function.js"></script> 
<script type="text/javascript">
function goPassword(){
	$(".editBtn1").click(function(){
		$("#PwCheckBtn").show()	// 비밀번호 입력칸 보이기
		$("#editBtn2").show()	// 값 넘기는 버튼 생성
		$("#editBtn1").hide()	// 비밀번호 입력칸 보이게 하는 버튼 사라짐
		$("#password").focus();	
	});	
	
	$(".deleteBtn1").click(function(){
		$("#PwCheckBtn").show()	// 비밀번호 입력칸 보이기
		$("#deleteBtn2").show()	// 값 넘기는 버튼 생성
		$("#deleteBtn1").hide()	// 비밀번호 입력칸 보이게 하는 버튼 사라짐
		$("#password").focus();	
	});	
	
}
function goEdit(){
	if($("#password").val()==""){
		alert("비밀번호를 입력해주세요")
		$("#password").focus();
		return false;
	} 
}

$(function(){
	  var cmd = $('#cmd');
	  $('#deleteBtn2').click(function(){
	    cmd.attr('value','delete');
	  });
});

function goSave() {
	if ($("#name").val() == "") {
		alert("이름을 입력해주세요.");
		$("#name").focus();
		return false;
	}
	if ($("#id").val() == "") {
		alert("아이디를 입력해주세요.");
		$("#id").focus();
		return false;
	}
}
	
		
	<%-- function goDelete() {
		var del = confirm ('삭제하시겠습니까?');
		if (del){
			document.location.href = "/manage/board/qna/process?no=<%=data.getNo()%>&cmd=delete";
			} else {
				return false;
			}
		}
	function goDelete_reply() {
		var del = confirm ('삭제하시겠습니까?');
		if (del){
			document.location.href = "/manage/board/qna/process?no=<%=data.getNo()%>&cmd=delete_reply";
			} else {
				return false;
			}
		} --%>
	
	
	
	
</script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/qna_q.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>Tree_qna</title>
</head>
<body>

<jsp:include page="/header_menu" flush="true"/>
    
    <div id="container">
        
        <div class="banner">
            <div class="qna_q-section">
                    <h2>Support</h2>
                    <h3>Q&A</h3>
                    <h4>반얀트리 공지사항과<br/>
                            놓칠 수 없는 이벤트 정보를 알려드립니다.</h4>
                </div>
        </div>
        <div class="qna_q">
            <div class="support-list">
                <ul class="support-list-center">
                    <li><a href="notice">공지사항</a></li>
                    <li><a href="faq">FAQ</a></li>
                    <li class="on"><a href="qna">Q&A</a></li>
                </ul>
            </div>
            <div class="qna_q-table">
                <div class="qna_q-box">
                
                	
						<form method="POST"name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/processU" enctype="multipart/form-data" onsubmit="return goEdit();" >
                   
                    	<%-- <ul class="base_info clear">
                            <li>
                                <label for="">카테고리</label>
                                <input type="text" style="width:100px;height:30px;" id="category" name="category" value="<%=CodeUtil.getCategory_name(data.getCategory()) %>" title="성을 입력해주세요" placeholder="성" readonly></input>	
                               
                            </li>
                            <li>
                                <label for="">공개여부</label>
                                <input type="text" style="width:100px;height:30px;" id="open" name="open" value="<%=CodeUtil.getOpenName(data.getOpen()) %>" title="성을 입력해주세요" placeholder="성" readonly></input>
								
                            </li>
                        </ul> --%>
                        <ul class="base_info clear">
                            <li>
                                <label for="qna-title">이름</label>
                               		<input type="text" style="width:100px;height:45px;" id="familyname" name="LastName" value="<%=qdata.getLastName()%>" title="성을 입력해주세요" placeholder="성" readonly></input>	
									<input type="text" style="width:150px;height:45px;" id="firstname" name="FirstName" value="<%=qdata.getFirstName()%>" title="이름을 입력해주세요" placeholder="이름" readonly></input>
                                 
                            </li>
                            <li>
                                <label for="qna-title">연락처</label>
                                <input type="text" style="width:100px;height:45px;" id="tel1" name="tel1"  title="연락처를 입력해주세요" value="<%=qdata.getTel1()%>" readonly/>	
								<input type="text" style="width:100px;height:45px;" id="tel2" name="tel2"  title="연락처를 입력해주세요" value="<%=qdata.getTel2()%>" readonly/>	
								<input type="text" style="width:100px;height:45px;" id="tel3" name="tel3"  title="연락처를 입력해주세요" value="<%=qdata.getTel3()%>" readonly/>	
                            </li>
                        </ul>
                        <label for="">이메일</label>
                       		<input type="text" name="email" id="email" style="width:200px" value="<%=qdata.getEmail()%>"> 
							
							
						<label for="">제목</label>
                       		<input type="text" id="title" name="title" style="width:894px;height:45px;border: 2px solid #eee;" title="제목을 입력해주세요" value="<%=qdata.getTitle()%>" readonly/>	
								
                        <label for="">내용</label>
                       		<!-- <textarea name="qna-cont" id="qna-cont"></textarea> -->
                        	<!-- <textarea id="contents" name="contents" title="내용을 입력해주세요" style="width:100%; height:300px;"></textarea> -->
                        	<textarea name="contents" id="contents" 
                        			style="resize: none; width: 100%;height: 400px;padding: 10px 10px; border: 2px solid #eee;font-size: 14px;
    								color: #454545;font-family: 'Noto Sans KR', sans-serif;font-weight: 300;letter-spacing: 0.5px;" readonly><%=qdata.getContents()%></textarea>
                        <label for="">첨부파일</label>
                        	<!-- <input type="file" id="filename_tmp" name="filename_tmp" style="width:894px;height:45px;border: 2px solid #eee;" title="첨부파일을 업로드 해주세요." /> -->
                        	<% if (qdata.getFile() == null) { %>
									<input type="file" id="filename_tmp" name="filename_tmp" style="width:894px;height:45px;border: 2px solid #eee;" value="첨부파일이 없습니다." /> 
							<% } else { %>
												
									<p>기존파일 : <a href="<%= Function.downloadUrl(SiteProperty.QNA_UPLOAD_PATH, java.net.URLEncoder.encode(qdata.getFile_org(), "UTF-8"), qdata.getFile()) %>" target="_blank"><%= Function.checkNull(qdata.getFile_org()) %> </a><br />				
									</p>
											
							<% } %>			
                       <!--  <ul class="base_info clear">
                            <li>
                                <label for="qna-title">작성자 이름</label>
                                <input type="text" id="qna-title" name="qna-title">
                            </li>
                            <li>
                                <label for="qna-title">비밀번호</label>
                                <input type="text" id="qna-title" name="qna-title">
                            </li>
                        </ul>
                        <label for="qna-title">이메일</label>
                        <input type="text" id="email" name="email" placeholder="회원님의 질문을 이메일로 발송해드립니다.">-->
                        <!-- <input type="submit" value="질문하기" class="btns" href="javascript:$('#frm').submit();"> --> 
                        
                        <div class="pwCheck" id="PwCheckBtn" hidden>
                        	<label for="qna-title" >비밀번호 확인</label>
                        	<input type="password" name="password" id="password" style="    width: 300px; height: 45px; border: 2px solid #eee;"/>
                        </div>
                        <ul class="base_info clear">
                            <li>
                        	<div class="btnLeft" id="editBtn1">
                        		<input type="submit" class="editBtn1" onclick="goPassword();" value="수정" style="float:left;">
                        		<!-- <input type="submit" class="deleteBtn1" onclick="goPassword();" value="삭제" style="float:right;">
                        		<input type="submit" class="editBtn2" href="javascript:$('#frm').submit();" value="수정" style="display:none;"></a>
                        		<input type="submit" class="deleteBtn2" href="javascript:$('#frm').submit();" value="삭제" style="display:none;"></a> -->
                        	</div>
                        	<div>
                        	
                        	</div>
                        	<div class="btnLeft" id="editBtn2" style="display:none; ">
                        		<input type="submit" class="editBtn" href="javascript:$('#frm').submit();" value="수정"  style="width:140px; height:50px; display:block; margin:0 auto; margin-top:70px; background-color:#0e693f; color:#fff;"></a>
                        	</div>
                        	<div class="btnRight" id="deleteBtn1">
                        		<input type="submit" class="deleteBtn" onclick="goPassword();" value="삭제" style="width:140px; height:50px; display:block; margin:0 auto; margin-top:70px; background-color:#0e693f; color:#fff;">
                        	</div>
                        	<div class="btnRight" id="deleteBtn2" style="display:none; ">
                        		<input type="submit" class="deleteBtn" href="javascript:$('#frm').submit();" value="삭제" style="width:140px; height:50px; display:block; margin:0 auto; margin-top:70px; background-color:#0e693f; color:#fff;"></a>
                        	</div>
                        	
                       		</li>
                       	</ul>
						
                        <!--======== 필요값 히든처리================ -->
                        <input type="hidden" id="cmd" name="cmd" value="checkPW" />
						<input type="hidden" name="reply" value="0" />
						<input type="hidden" name="send_email" value="0" />
						<input type="hidden" name="no" value="<%=qdata.getNo() %>" />
                    </form>
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