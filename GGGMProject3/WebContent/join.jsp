<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/join.css"/>
<link rel="stylesheet" type="text/css" href="css/shadowbox.css"/>

<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<body>
	<div id="wrapper">
	<form id="joinForm" name="join_form">
		<p>
		<label for="userid">���̵�</label>
		<input type="text" name="id" id="userid">
		<input type="button" value="�ߺ�üũ" onclick="idcheck()">
		</p>
		<p>
		<label for="userpwd">��й�ȣ</label>
		<input type="password" name="pwd" id="userpwd">
		<input type="password" name="pwd" id="userpwd2" placeholder="���Է�">
		</p>
		<p>
		<label for="username">�̸�</label>
		<input type="text" name="name" id="username">
		</p>
		<p>
		<label for="usersex">����</label>
		<input type="radio" name="name" id="usersex" checked value="����">����
		<input type="radio" name="name" id="usersex" value="����">����
		</p>
		<p>
		<label for="userbday">�������</label>
		<input type="date" name="bday" id="userbday">
		</p>
		<p>
		<label for="userpost">�ּ�</label>
		<span id="cellStyle">
			<input type="text" name="post" id="userpost" readonly>
			<input type="button" value="�����ȣ �˻�" id="userpostBtn" onclick="postfind()">
			<input type="text" name="addr1" id="useraddr1" readonly>
			<input type="text" name="addr2" id="useraddr2">
		</span>
		</p>
		<p>
		<label for="usertel">��ȭ��ȣ</label>
		<span class="cellStyle">
			<select id="usertel" name="tel1">
				<option>010</option>
				<option>011</option>
				<option>017</option>
			</select>
			<input type="text" name="tel2" id="usertel1">-
			<input type="text" name="tel3" id="usertel2">
		</span>
		</p>
		<p class="btnSubmit">
		
		<input type="button" name="btnSub" value="ȸ������">
		<input type="button" name="btnCancel" value="�������">
		</p>
	</form>
	</div>
	<script type="text/javascript" src="js/shadowbox.js"></script>
	<script type="text/javascript">
		Shadowbox.init({
			players:["iframe"]
		});
		function idcheck(){
			Shadowbox.open({
				content:'idcheck.jsp',
				player:'iframe',
				title:'���̵� �ߺ�üũ',
				width:300,
				height:150
			});
		}
		function postfind(){
			Shadowbox.open({
				content:'postfind.jsp',
				player:'iframe',
				title:'�����ȣ �˻�',
				width:430,
				height:350
			});
		}
	</script>
</body>
</html>