<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<link rel="stylesheet" type="text/css" href="join.css"/>
<link rel="stylesheet" type="text/css" href="../../css/shadowbox.css"/>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
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
$(function(){
	$('#pwd2').focusout(function(){
		var pwd1=$('#pwd').val();
		var pwd2=$('#pwd2').val();
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
	$('#name').focusout(function(){
		if($('#name').val()==''){
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
});
</script>
</head>
<body>
	<br>
	<br>
	<br>
	<div id="wrapper">
	<form id="joinForm" name="join_form" action="<%=request.getContextPath() %>/join.do?grade=2" method="post">
    <p>
    <label for="enterid">���̵�</label>
    <input type=text name="id" id="id">
    <input type=button value=�ߺ�üũ id="enteridBtn" onclick="idcheck()">
    </p>
    <p>
    <label for="enterpwd">��й�ȣ</label>
    <input type=password name="pwd" id="pwd">
    <input type=password name="pwd" id="pwd2" placeholder="���Է�">
    <span id="pwdcheck"></span><i id="pwd_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    </p>
    <p>
    <label for="entername">�̸�</label>
    <input type=text name="name" id="name">
    <span id="namecheck"></span><i id="name_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    </p>
    <p>
    <label for="entername2">ȸ���</label>
    <input type=text name="companyname" id="entername2">
    </p>
    
    <p>
    <label for="entersex">����</label>
    <input type=radio name="sex" id="sex" checked value="����">����
    <input type=radio name="sex" id="sex" value="����">����
    </p>
    <p>
    <label for="enterbday">�������</label>
    <input type=date name="bday" id="enterbday">
    </p>
    <p>
    <label for="enterpost">�ּ�</label>
    <span id="cellStyle">
     <input type=text name="post" id="post" readonly>
     <input type=button value="�����ȣ�˻�" id="enterpostBtn" onclick="postfind()">
     <input type=text name="addr1" id="addr1" readonly>
     <input type=text name="addr2" id="addr2">
    </span>
    </p>
    <p>
    <label for="enterphone">�޴�����ȣ</label>
    <span id="cellStyle">
	    <select id="enterphone" name="tel1">
	      <option>010</option>
	      <option>011</option>
	      <option>017</option>
	    </select>
	    <input type=text name="tel2" id="enterphone1">-
	    <input type=text name="tel3" id="enterphone2">
    </span>
    </p>     
    <p>
    <label for="enteremail">e-mail</label>
    <input type=text name="email" id="email"> @
    <select id="email2" name="email2" style="width:inherit">
	      <option>naver.com</option>
	      <option>hanmail.net</option>
	      <option>gmail.com</option>
	      <option>nate.com</option>
	      <option>hotmail.com</option>
	      <option>�����Է�</option>
	    </select>
    </p>
    <p>
    <label for="entermail">���ϼ���</label>
    <input type=radio name="emailreceive" id="entermail" checked value="���ŵ���">���ŵ���
    <input type=radio name="emailreceive" id="entermail" value="���Ű���">���Ű���
    </p>
    <p class="btnSubmit">
    <input type=button id="btnSub" value=ȸ������>
    <input type=button onclick="javascript:history.back()" value=�������>
    </p>	
		</form>
		</div>

	

</body>
</html>