<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>

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
      title:'���̵� �ߺ�üũ',
      width:300,
      height:150
   });
}
function postfind()
{
   Shadowbox.open({
      content:'./postfind.jsp',
      player:'iframe',
      title:'�����ȣ �˻�',
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
      if($('#useremail2 option:selected').text()=='�����Է�'){
         $('#email_fa').id('#selfinput');
      }
   });
});
$(function(){
   $('#userpwd2').focusout(function(){
      var pwd1=$('#userpwd').val();
      var pwd2=$('#userpwd2').val();
      if(pwd1==''){
         $('#pwdcheck').text('��й�ȣ�� �Է��ϼ���');
         $('#pwd_fa').removeClass('fa fa-check');
         return;
      }
      if(pwd2==''){
         $('#pwdcheck').text('��й�ȣ�� �Է��ϼ���');
         $('#pwd_fa').removeClass('fa fa-check');
         return;
      }
      
      if(pwd1==pwd2){
         $('#pwdcheck').text('');
         $('#pwd_fa').addClass('fa fa-check');
      }else{
         $('#pwdcheck').text('��й�ȣ�� Ȯ���ϼ���');
         $('#pwd_fa').removeClass('fa fa-check');
      }
   });
   $('#username').focusout(function(){
      if($('#username').val()==''){
         $('#namecheck').text('�̸��� �Է��ϼ���');
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
         $('#bdaycheck').text('��������� �Է��ϼ���');
         $('#bday_fa').removeClass('fa fa-check');
      }else{
         $('#bdaycheck').text('');
         $('#bday_fa').addClass('fa fa-check');
      }
   });
   $('#useraddr2').focusout(function(){
      if(($('#useraddr1').val()=='')||($('#useraddr2').val()=='')){
         $('#postcheck').text('�ּҸ� �Է��ϼ���');
         $('#post_fa').removeClass('fa fa-check');
      }else if(($('#useraddr1').val()!='')&&($('#useraddr2').val()!='')){
         $('#postcheck').text('');
         $('#post_fa').addClass('fa fa-check');
      }
   });
   $('#usertel2').focusout(function(){
      if($('#usertel option:selected').text()=='����'){
         $('#telcheck').text('�ڵ��� ���ڸ��� �����ϼ���');
         $('#tel_fa').removeClass('fa fa-check');}
      else if(($('#usertel1').val()=='')||($('#usertel2').val()=='')){
         $('#telcheck').text('�ڵ�����ȣ�� �Է��ϼ���');
         $('#tel_fa').removeClass('fa fa-check');
      }else if(($('#usertel1').val()!='')&&($('#usertel2').val()!='')){
         $('#telcheck').text('');
         $('#tel_fa').addClass('fa fa-check');
      }
   });
   
   $('#email_select').focusout(function(){
      if($('#email_select option:selected').text()=='����'){
         $('#emailcheck').text('������ �����ϼ���');
         $('#email_fa').removeClass('fa fa-check');
      }else if(($('#email1').val()=='')||($('#email2').val()=='')){
         $('#emailcheck').text('�̸��ϸ� �Է��ϼ���');
         $('#email_fa').removeClass('fa fa-check');
      }else if(($('#email1').val()!='')&&($('#email2').val()!='')){
         $('#emailcheck').text('');
         $('#email_fa').addClass('fa fa-check');
      }
   });
   
   $('#userjob').focusout(function(){
      if($('#userjob').val()==''){
         $('#jobcheck').text('������ �Է��ϼ���');
         $('#job_fa').removeClass('fa fa-check');
      }else{
         $('#jobcheck').text('');
         $('#job_fa').addClass('fa fa-check');
      }
   });
   $('#useraccount3').focusout(function(){
      if(($('#useraccount1').val()=='')||($('#useraccount2').val()=='')||($('#useraccount3').val()=='')){
         $('#accountcheck').text('���¹�ȣ�� �Է��ϼ���');
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
    <label for="userid">���̵�</label>
    <input type=text name="id" id="userid" onclick="idcheck()" tabindex="1">
    <input type=button value=�ߺ�üũ id="useridBtn" onclick="idcheck()" tabindex="2">
 
    
    </p>
    <p>
    <label for="userpwd">��й�ȣ</label>
    <input type=password name="pwd" id="userpwd" tabindex="3">
    <input type=password name="pwd2" id="userpwd2" placeholder="���Է�" tabindex="4">
    <span id="pwdcheck"></span><i id="pwd_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    </p>
    <p>
    <label for="username">�̸�</label>
    <input type=text name="name" id="username" tabindex="5">
    <span id="namecheck"></span><i id="name_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    </p>
    <p>
    <label for="usersex">����</label>
    <input type=radio name="sex" id="usersex" checked value="����" tabindex="6">����
    <input type=radio name="sex" id="usersex" value="����" tabindex="7">����
    </p>
    <p>
    <label for="userbday">�������</label>
    <input type=date name="bday" id="userbday" tabindex="8">
    <span id="bdaycheck"></span><i id="bday_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    </p>
    <p>
    <label for="userpost">�ּ�</label>
    <span id="cellStyle">
     <input type=text name="post" id="userpost" readonly tabindex="9">
     <input type=button value="�����ȣ�˻�" id="userpostBtn" onclick="postfind()">
     <input type=text name="addr1" id="useraddr1" readonly tabindex="10">
     <input type=text name="addr2" id="useraddr2" tabindex="11">
    </span>
    <span id="postcheck"></span><i id="post_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    </p>
    <p>
    <label for="usertel">��ȭ��ȣ</label>
    <span id="cellStyle">
       <select id="usertel" name="tel1" tabindex="12">
         <option disabled selected>����</option>
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
    <option value="" selected disabled>����</option>
    <option value="naver.com">naver.com</option>
    <option value="hotmail.com">hotmail.com</option>
    <option value="hanmail.com">hanmail.com</option>
    <option value="gmail.com">gmail.com</option>
    <option value="1">�����Է�</option>
    </select>
   <span id="emailcheck"></span>
   <i id="email_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    
    
    </p>
    <p>
    <label for="usermail">���ϼ���</label>
    <input type=radio name="emailreceive" id="usermail" checked value="���ŵ���" tabindex="17">���ŵ���
    <input type=radio name="emailreceive" id="usermail" value="���Ű���" tabindex="18">���Ű���
    </p>
    
    <p>
    <label for="userjob">����</label>
    <select id="userjob" name="job" tabindex="19">
         <option value="1">�л�</option>                 
         <option value="2">�����</option>
         <option value="4">�����</option> 
         <option value="8">�ֺ�</option>
         <option value="16">������</option>
         <option value="32">��Ƽ��Ʈ</option>
         <option value="64">��Ÿ</option>
       </select>
       <span id="jobcheck"></span><i id="job_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    </p>
     <p>
    <label for="usermarry">��ȥ����</label>
    <input type=radio name="marry" id="usermarry" checked value="��ȥ" tabindex="20">��ȥ
    <input type=radio name="marry" id="usermarry" value="��ȥ" tabindex="21">��ȥ
    </p>
    <p>
    <label for="userhobby">���ɺо�</label>
    <input type=checkbox name="hobby" id="userhobby" value="1">������
    <input type=checkbox name="hobby" id="userhobby" value="2">����
    <input type=checkbox name="hobby" id="userhobby" value="4">���ͳ�
    <input type=checkbox name="hobby" id="userhobby" value="8">����
    <input type=checkbox name="hobby" id="userhobby" value="16">����<br>
    <input type=checkbox name="hobby" id="userhobby" value="32">��ȭ����
    <input type=checkbox name="hobby" id="userhobby" value="64">���ǰ���
    <input type=checkbox name="hobby" id="userhobby" value="128">����
    <input type=checkbox name="hobby" id="userhobby" value="256">����
    </p>
   
     <p>
    <label for="usersal">�ҵ����</label>
    <input type=radio name="sal" id="usersal" value="100">100~200
    <input type=radio name="sal" id="usersal" value="200">200~300
    <input type=radio name="sal" id="usersal" value="300">300~400<br>
    <input type=radio name="sal" id="usersal" value="400">400~500
    <input type=radio name="sal" id="usersal" value="500">500~600
    <input type=radio name="sal" id="usersal" value="600">600�̻�
    </p>
     <p>
    <label for="userid">���¹�ȣ</label>
    <select id="bankname" name="bankname">
       <option>�츮</option>
       <option>�ϳ�</option>
       <option>����</option>
       <option>����</option>
       <option>����</option>
       <option>���</option>
       <option>SC����</option>
    </select>
    <input type=text name="account1" id="useraccount1">-
    <input type=text name="account2" id="useraccount2">-
    <input type=text name="account3" id="useraccount3">
    <br>
    <span id="accountcheck"></span><i id="account_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    </p>
    <p class="btnSubmit">
    <input type=button id="btnSub" value=ȸ������>
    <input type=button onclick="javascript:history.back()" value=�������>
    
    </p>
    </form>
  </div>
</body>
</html>