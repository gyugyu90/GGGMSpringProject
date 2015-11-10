<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>

<link rel="stylesheet" type="text/css" href="join.css"/>
<link rel="stylesheet" type="text/css" href="../../css/shadowbox.css"/>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<script type="text/javascript" src="../../js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
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
function checkemailaddy(){
    if (joinForm.email_select.value == '1') {
        joinForm.email2.readonly = false;
        joinForm.email2.value = '';
        joinForm.email2.focus();
    }
    else {
        joinForm.email2.readonly = true;
        joinForm.email2.value = joinForm.email_select.value;
    }
}
$(document).ready(function(){
   $('#useremail2').focusin(function(){
      if($('#useremail2 option:selected').text()=='직접입력'){
         $('#email_fa').id('#selfinput');
      }
   });
});
$(function(){
   $('#userpwd2').focusout(function(){
      var pwd1=$('#userpwd').val();
      var pwd2=$('#userpwd2').val();
      if(pwd1==''){
         $('#pwdcheck').text('비밀번호를 입력하세요');
         $('#pwd_fa').removeClass('fa fa-check');
         return;
      }
      if(pwd2==''){
         $('#pwdcheck').text('비밀번호를 입력하세요');
         $('#pwd_fa').removeClass('fa fa-check');
         return;
      }
      
      if(pwd1==pwd2){
         $('#pwdcheck').text('');
         $('#pwd_fa').addClass('fa fa-check');
      }else{
         $('#pwdcheck').text('비밀번호를 확인하세요');
         $('#pwd_fa').removeClass('fa fa-check');
      }
   });
   $('#username').focusout(function(){
      if($('#username').val()==''){
         $('#namecheck').text('이름을 입력하세요');
         $('#name_fa').removeClass('fa fa-check');
      }else{
         $('#namecheck').text('');
         $('#name_fa').addClass('fa fa-check');
      }
   });
   $('#btnSub').click(function(){
      $('#joinForm').submit();
   });
   $('#userbday').focusout(function(){
      if($('#userbday').val()==''){
         $('#bdaycheck').text('생년월일을 입력하세요');
         $('#bday_fa').removeClass('fa fa-check');
      }else{
         $('#bdaycheck').text('');
         $('#bday_fa').addClass('fa fa-check');
      }
   });
   $('#useraddr2').focusout(function(){
      if(($('#useraddr1').val()=='')||($('#useraddr2').val()=='')){
         $('#postcheck').text('주소를 입력하세요');
         $('#post_fa').removeClass('fa fa-check');
      }else if(($('#useraddr1').val()!='')&&($('#useraddr2').val()!='')){
         $('#postcheck').text('');
         $('#post_fa').addClass('fa fa-check');
      }
   });
   $('#usertel2').focusout(function(){
      if($('#usertel option:selected').text()=='선택'){
         $('#telcheck').text('핸드폰 앞자리를 선택하세요');
         $('#tel_fa').removeClass('fa fa-check');}
      else if(($('#usertel1').val()=='')||($('#usertel2').val()=='')){
         $('#telcheck').text('핸드폰번호를 입력하세요');
         $('#tel_fa').removeClass('fa fa-check');
      }else if(($('#usertel1').val()!='')&&($('#usertel2').val()!='')){
         $('#telcheck').text('');
         $('#tel_fa').addClass('fa fa-check');
      }
   });
   
   $('#email_select').focusout(function(){
      if($('#email_select option:selected').text()=='선택'){
         $('#emailcheck').text('계정을 선택하세요');
         $('#email_fa').removeClass('fa fa-check');
      }else if(($('#email1').val()=='')||($('#email2').val()=='')){
         $('#emailcheck').text('이메일를 입력하세요');
         $('#email_fa').removeClass('fa fa-check');
      }else if(($('#email1').val()!='')&&($('#email2').val()!='')){
         $('#emailcheck').text('');
         $('#email_fa').addClass('fa fa-check');
      }
   });
   
   $('#userjob').focusout(function(){
      if($('#userjob').val()==''){
         $('#jobcheck').text('직업을 입력하세요');
         $('#job_fa').removeClass('fa fa-check');
      }else{
         $('#jobcheck').text('');
         $('#job_fa').addClass('fa fa-check');
      }
   });
   $('#useraccount3').focusout(function(){
      if(($('#useraccount1').val()=='')||($('#useraccount2').val()=='')||($('#useraccount3').val()=='')){
         $('#accountcheck').text('계좌번호를 입력하세요');
         $('#account_fa').removeClass('fa fa-check');
      }else if(($('#useraccuont1').val()!='')&&($('#useraccount2').val()!='')&&($('#useraccount3').val()!='')){
         $('#accountcheck').text('');
         $('#account_fa').addClass('fa fa-check');
      }
   });
});





</script>
</head>

<body>
   <div id="wrapper">
    <form id="joinForm" name="join_form" action="<%=request.getContextPath() %>/join.do" method="post">
    <p>
    <label for="userid">아이디</label>
    <input type=text name="id" id="userid" onclick="idcheck()" tabindex="1">
    <input type=button value=중복체크 id="useridBtn" onclick="idcheck()" tabindex="2">
 
    
    </p>
    <p>
    <label for="userpwd">비밀번호</label>
    <input type=password name="pwd" id="userpwd" tabindex="3">
    <input type=password name="pwd2" id="userpwd2" placeholder="재입력" tabindex="4">
    <span id="pwdcheck"></span><i id="pwd_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    </p>
    <p>
    <label for="username">이름</label>
    <input type=text name="name" id="username" tabindex="5">
    <span id="namecheck"></span><i id="name_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    </p>
    <p>
    <label for="usersex">성별</label>
    <input type=radio name="sex" id="usersex" checked value="남자" tabindex="6">남자
    <input type=radio name="sex" id="usersex" value="여자" tabindex="7">여자
    </p>
    <p>
    <label for="userbday">생년월일</label>
    <input type=date name="bday" id="userbday" tabindex="8">
    <span id="bdaycheck"></span><i id="bday_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    </p>
    <p>
    <label for="userpost">주소</label>
    <span id="cellStyle">
     <input type=text name="post" id="userpost" readonly tabindex="9">
     <input type=button value="우편번호검색" id="userpostBtn" onclick="postfind()">
     <input type=text name="addr1" id="useraddr1" readonly tabindex="10">
     <input type=text name="addr2" id="useraddr2" tabindex="11">
    </span>
    <span id="postcheck"></span><i id="post_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    </p>
    <p>
    <label for="usertel">전화번호</label>
    <span id="cellStyle">
       <select id="usertel" name="tel1" tabindex="12">
         <option disabled selected>선택</option>
         <option>010</option>
         <option>011</option>
         <option>017</option>
       </select>
       <input type=text name="tel2" id="usertel1" tabindex="13">-
       <input type=text name="tel3" id="usertel2" tabindex="14">
    </span>
    <span id="telcheck"></span><i id="tel_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    </p>
    <p>
    <label for="useremail">e-mail</label>
    <input name="email1" type="text" class="box" id="email1" size="15"> @ 
    <input name="email2" type="text" class="box" id="email2" >
    <select name="email_select" class="box" id="email_select" onChange="checkemailaddy();">
    <option value="" selected disabled>선택</option>
    <option value="naver.com">naver.com</option>
    <option value="hotmail.com">hotmail.com</option>
    <option value="hanmail.com">hanmail.com</option>
    <option value="gmail.com">gmail.com</option>
    <option value="1">직접입력</option>
    </select>
   <span id="emailcheck"></span>
   <i id="email_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    
    
    </p>
    <p>
    <label for="usermail">메일수신</label>
    <input type=radio name="emailreceive" id="usermail" checked value="수신동의" tabindex="17">수신동의
    <input type=radio name="emailreceive" id="usermail" value="수신거절" tabindex="18">수신거절
    </p>
    
    <p>
    <label for="userjob">직업</label>
    <select id="userjob" name="job" tabindex="19">
         <option value="1">학생</option>                 
         <option value="2">사업가</option>
         <option value="4">운동선수</option> 
         <option value="8">주부</option>
         <option value="16">직장인</option>
         <option value="32">아티스트</option>
         <option value="64">기타</option>
       </select>
       <span id="jobcheck"></span><i id="job_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    </p>
     <p>
    <label for="usermarry">결혼여부</label>
    <input type=radio name="marry" id="usermarry" checked value="미혼" tabindex="20">미혼
    <input type=radio name="marry" id="usermarry" value="기혼" tabindex="21">기혼
    </p>
    <p>
    <label for="userhobby">관심분야</label>
    <input type=checkbox name="hobby" id="userhobby" value="1">스포츠
    <input type=checkbox name="hobby" id="userhobby" value="2">쇼핑
    <input type=checkbox name="hobby" id="userhobby" value="4">인터넷
    <input type=checkbox name="hobby" id="userhobby" value="8">여행
    <input type=checkbox name="hobby" id="userhobby" value="16">독서<br>
    <input type=checkbox name="hobby" id="userhobby" value="32">영화감상
    <input type=checkbox name="hobby" id="userhobby" value="64">음악감상
    <input type=checkbox name="hobby" id="userhobby" value="128">게임
    <input type=checkbox name="hobby" id="userhobby" value="256">공연
    </p>
   
     <p>
    <label for="usersal">소득수준</label>
    <input type=radio name="sal" id="usersal" value="100">100~200
    <input type=radio name="sal" id="usersal" value="200">200~300
    <input type=radio name="sal" id="usersal" value="300">300~400<br>
    <input type=radio name="sal" id="usersal" value="400">400~500
    <input type=radio name="sal" id="usersal" value="500">500~600
    <input type=radio name="sal" id="usersal" value="600">600이상
    </p>
     <p>
    <label for="userid">계좌번호</label>
    <select id="bankname" name="bankname">
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
    <br>
    <span id="accountcheck"></span><i id="account_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    </p>
    <p class="btnSubmit">
    <input type=button id="btnSub" value=회원가입>
    <input type=button onclick="javascript:history.back()" value=가입취소>
    
    </p>
    </form>
  </div>
</body>
</html>