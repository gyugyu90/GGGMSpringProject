<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,java.text.*"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
<link rel="stylesheet" type="text/css" href="myPage.css"/>
<link rel="stylesheet" type="text/css" href="../../css/shadowbox.css"/>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript"> 


<script type="text/javascript">
Shadowbox.init({
   players:["iframe"]		
});
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
	<br>
	<br>
	<br>
	<br>
	
	<div id="wrapper">
	<form id="joinForm" name="join_form">
    <p>
    <label for="enterid">���̵�</label>
    ${d.id }
    </p>
    <p>
    <label for="enterpwd">��й�ȣ</label>
    <input type=password name="pwd" id="enterpwd">
    <input type=password name="pwd" id="enterpwd2" placeholder="���Է�">
    </p>
    <p>
    <label for="entername">�̸�</label>
    ${d.name }
    </p>
    <p>
    <label for="entername2">ȸ���</label>
    
    </p>
    <p>
	<label for="entermail">����� ��Ϲ�ȣ</label>			
	<input type=text size=3 name=enterpriseNumber1 style="width:250px">
	</p>
    <p>
    <label for="entersex">����</label>${d.sex}
    </p>
    <p>
    <label for="enterbday">�������</label>
    <fmt:formatDate value="${d.birth }" pattern="yyyy-MM-dd"/>
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
	    <input type=text name="phone2" id="enterphone1" style="width:250px" value="${d.tel }">
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
	    <input type=text name="tel2" id="entertel1" style="width:250px">
    </span>
    </p>
    <p>
     <label for="enteremail">e-mail</label>
    <input type=text name="email" id="enteremail" tabindex="13" value="${d.email }"> @
    <select id="enteremail2" name="email2" style="width:inherit" tabindex="14">
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