<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>

<link rel="stylesheet" type="text/css" href="join.css"/>
<link rel="stylesheet" type="text/css" href="../../css/shadowbox.css"/>
<script type="text/javascript" src="../../js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
   players:["iframe"]		
});
function idcheck()
{
	Shadowbox.open({
		content:'./idcheck.jsp',
		player:'iframe',
		title:'아이디 중복체크',
		width:300,
		height:150
	});
}
function postfind()
{
	Shadowbox.open({
		content:'./postfind.jsp',
		player:'iframe',
		title:'우편번호 검색',
		width:430,
		height:350
	});
}
$(function(){
	$('#userpwd2').focusout(function(){
		var pwd1=$('#userpwd').val();
		var pwd2=$('#userpwd2').val();
		if(pwd1==null){
			$('#pwdcheck').text('비밀번호를 입력하세요');
			return;
		}
		if(pwd2==null){
			$('#pwdcheck').text('비밀번호를 입력하세요');
			return;
		}
		
		if(pwd1==pwd2){
			$('#pwdcheck').text('사용가능');
		}else{
			$('#pwdcheck').text('비밀번호를 확인하세요');
		}
	});
});
</script>
</head>

<body>
   <div id="wrapper">
    <form id="joinForm" name="join_form">
    <p>
    <label for="userid">아이디</label>
    <input type=text name="id" id="userid" onclick="idcheck()" tabindex="1">
    <input type=button value=중복체크 id="useridBtn" onclick="idcheck()" tabindex="2">
 
    
    </p>
    <p>
    <label for="userpwd">비밀번호</label>
    <input type=password name="pwd" id="userpwd" tabindex="3">
    <input type=password name="pwd" id="userpwd2" placeholder="재입력" tabindex="4">
    <span id="pwdcheck">비밀번호 확인</span>
    </p>
    <p>
    <label for="username">이름</label>
    <input type=text name="name" id="username" tabindex="5">
    </p>
    <p>
    <label for="usersex">성별</label>
    <input type=radio name="sex" id="usersex" checked value="남자" tabindex="6">남자
    <input type=radio name="sex" id="usersex" value="여자" tabindex="7">여자
    </p>
    <p>
    <label for="userbday">생년월일</label>
    <input type=date name="bday" id="userbday" tabindex="8">
    </p>
    <p>
    <label for="userpost">주소</label>
    <span id="cellStyle">
     <input type=text name="post" id="userpost" readonly tabindex="9">
     <input type=button value="우편번호검색" id="userpostBtn" onclick="postfind()">
     <input type=text name="addr1" id="useraddr1" readonly tabindex="10">
     <input type=text name="addr2" id="useraddr2" tabindex="11">
    </span>
    </p>
    <p>
    <label for="usertel">전화번호</label>
    <span id="cellStyle">
	    <select id="usertel" name="tel1" tabindex="12">
	      <option>010</option>
	      <option>011</option>
	      <option>017</option>
	    </select>
	    <input type=text name="tel2" id="usertel1">-
	    <input type=text name="tel3" id="usertel2">
    </span>
    </p>
    <p>
    <label for="useremail">e-mail</label>
    <input type=text name="email" id="useremail" tabindex="13"> @
    <select id="useremail2" name="email2" style="width:inherit" tabindex="14">
	      <option>naver.com</option>
	      <option>hanmail.net</option>
	      <option>gmail.com</option>
	      <option>nate.com</option>
	      <option>hotmail.com</option>
	      <option>직접입력</option>
	    </select>
    </p>
    <p>
    <label for="usermail">메일수신</label>
    <input type=radio name="mail" id="usermail" checked value="수신동의">수신동의
    <input type=radio name="mail" id="usermail" value="수신거절">수신거절
    </p>
    <p>
    <label for="userjob">직업</label>
    <select id="userjob" name="job">
	      <option>학생</option>
	      <option>직장인</option>
	      <option>사업가</option>
	      <option>주부</option>
	      <option>취준생</option>
	      <option>아티스트</option>
	      <option>기타</option>
	    </select>
    </p>
     <p>
    <label for="usermarry">결혼여부</label>
    <input type=radio name="marry" id="usermarry" checked value="미혼">미혼
    <input type=radio name="marry" id="usermarry" value="기혼">기혼
    </p>
    <p>
    <label for="userhobby">관심분야</label>
    <input type=checkbox name="hobby" id="userhobby" value="스포츠">스포츠
    <input type=checkbox name="hobby" id="userhobby" value="쇼핑">쇼핑
    <input type=checkbox name="hobby" id="userhobby" value="인터넷">인터넷
    <input type=checkbox name="hobby" id="userhobby" value="여행">여행
    <input type=checkbox name="hobby" id="userhobby" value="독서">독서<br>
    <input type=checkbox name="hobby" id="userhobby" value="영화감상">영화감상
    <input type=checkbox name="hobby" id="userhobby" value="음악감상">음악감상
    <input type=checkbox name="hobby" id="userhobby" value="게임">게임
    <input type=checkbox name="hobby" id="userhobby" value="공연">공연
    </p>
   
     <p>
    <label for="usersal">소득수준</label>
    <input type=checkbox name="sal" id="usersal" value="100">100~200
    <input type=checkbox name="sal" id="usersal" value="200">200~300
    <input type=checkbox name="sal" id="usersal" value="300">300~400<br>
    <input type=checkbox name="sal" id="usersal" value="400">400~500
    <input type=checkbox name="sal" id="usersal" value="500">500~600
    <input type=checkbox name="sal" id="usersal" value="600">600이상
    </p>
     <p>
    <label for="userid">계좌번호</label>
    <select id="bankname">
    	<option>우리</option>
    	<option>하나</option>
    	<option>국민</option>
    	<option>농협</option>
    	<option>신한</option>
    	<option>기업</option>
    	<option>SC제일</option>
    </select>
    <input type=text name="account1" id="useraccount1">-
    <input type=text name="account2" id="useraccount2">-
    <input type=text name="account3" id="useraccount3">
    </p>
    <p class="btnSubmit">
    <input type=button id="btnSub" value=회원가입>
    <input type=button id="btnCancel" value=가입취소>
    </p>
    </form>
  </div>
</body>
</html>







