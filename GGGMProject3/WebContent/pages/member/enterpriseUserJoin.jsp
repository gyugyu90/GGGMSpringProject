<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
<link rel="stylesheet" type="text/css" href="join.css"/>
<link rel="stylesheet" type="text/css" href="../css/shadowbox.css"/>
<script type="text/javascript" src="../js/shadowbox.js"></script>


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
</script>
</head>
<body>
	<br>
	<br>
	<br>
	<div id="wrapper">
	<form id="joinForm" name="join_form">
    <p>
    <label for="enterid">���̵�</label>
    <input type=text name="id" id="enterid">
    <input type=button value=�ߺ�üũ id="enteridBtn" onclick="idcheck()">
    </p>
    <p>
    <label for="enterpwd">��й�ȣ</label>
    <input type=password name="pwd" id="enterpwd">
    <input type=password name="pwd" id="enterpwd2" placeholder="���Է�">
    </p>
    <p>
    <label for="entername">�̸�</label>
    <input type=text name="name" id="entername">
    </p>
    <p>
    <label for="entername2">ȸ���</label>
    <input type=text name="name" id="entername2">
    </p>
    <p>
	<label for="entermail">����� ��Ϲ�ȣ</label>			
	<input type=text size=3 name=enterpriseNumber1>-
	<input type=text size=4 name=enterpriseNumber2>-
	<input type=text size=4 name=enterpriseNumber3>
	</p>
    <p>
    <label for="entersex">����</label>
    <input type=radio name="sex" id="entersex" checked value="����">����
    <input type=radio name="sex" id="entersex" value="����">����
    </p>
    <p>
    <label for="enterbday">�������</label>
    <input type=date name="bday" id="enterbday">
    </p>
    <p>
    <label for="enterpost">�ּ�</label>
    <span id="cellStyle">
     <input type=text name="post" id="enterpost" readonly>
     <input type=button value="�����ȣ�˻�" id="enterpostBtn" onclick="postfind()">
     <input type=text name="addr1" id="enteraddr1" readonly>
     <input type=text name="addr2" id="enteraddr2">
    </span>
    </p>
    <p>
    <label for="enterphone">�޴�����ȣ</label>
    <span id="cellStyle">
	    <select id="enterphone" name="phone1">
	      <option>010</option>
	      <option>011</option>
	      <option>017</option>
	    </select>
	    <input type=text name="phone2" id="enterphone1">-
	    <input type=text name="phone3" id="enterphone2">
    </span>
    </p>
     <p>
    <label for="entertel">ȸ�� ��ȭ��ȣ</label>
    <span id="cellStyle">
	    <select id="entertel" name="tel1">
	      <option>02</option>
	      <option>031</option>
	      <option>032</option>
	      <option>033</option>
	      <option>041</option>
	      <option>042</option>
	      <option>043</option>
	      <option>044</option>
	      <option>051</option>
	      <option>052</option>
	      <option>053</option>
	      <option>054</option>
	      <option>055</option>
	      <option>061</option>
	      <option>062</option>
	      <option>063</option>
	      <option>064</option>     
	    </select>
	    <input type=text name="tel2" id="entertel1">-
	    <input type=text name="tel3" id="entertel2">
    </span>
    </p>
    <p>
    <label for="enteremail">e-mail</label>
    <input type=text name="email" id="enteremail"> @
    <select id="enteremail2" name="email2" style="width:inherit">
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
    <input type=radio name="mail" id="entermail" checked value="���ŵ���">���ŵ���
    <input type=radio name="mail" id="entermail" value="���Ű���">���Ű���
    </p>
    <p class="btnSubmit">
    <input type=button id="btnSub" value=ȸ������>
    <input type=button id="btnCancel" value=�������>
    </p>	
		</form>
		</div>

	

</body>
</html>