<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/pages/myinfo/myPage_user.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/shadowbox.css"/>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
   players:["iframe"]		
});

function postfind()
{
	Shadowbox.open({
		content:'pages/member/postfind.jsp',
		player:'iframe',
		title:'�����ȣ �˻�',
		width:430,
		height:350
	});
}
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
		if($('#username').val()==''){
			alert('�̸��� �Է��ϼ���');
			return;
		}
		
		
		$('#myPageForm').submit();
	});
});
</script>
</head>

<body>
<br>
<br>
<br>
<br>

   <div id="wrapper">
    <form id="myPageForm" name="myPageForm" action="myInfoUpdate.do?id=${d.id}" method="post">
    <p>
    <label for="userid">���̵�</label>
 	${d.id }
    
    </p>
    <p>
    <label for="userpwd">��й�ȣ</label>
    <input type=password name="pwd" id="userpwd" tabindex="3">
    <input type=password name="pwd2" id="userpwd2" placeholder="���Է�" tabindex="4">
    <span id="pwdcheck"></span><i id="pwd_fa" class="" style="font-size:16px; color:lightcoral;"></i>
    </p>
    <p>
    <label for="username">�̸�</label>
    ${d.name }
    </p>
    <p>
    <label for="usersex">����</label>
    ${d.sex }
    </p>
    <p>
    <label for="userbday">�������</label>
    <fmt:formatDate value="${d.birth }" pattern="yyyy-MM-dd"/>
    </p>
    <p>
    <label for="userpost">�ּ�</label>
    <span id="cellStyle">
     <input type=text name="post" id="userpost" readonly tabindex="9" placeholder="${d.post }">
     <input type=button value="�����ȣ�˻�" id="userpostBtn" onclick="postfind()">
     <input type=text name="addr1" id="useraddr1" readonly tabindex="10" placeholder="${d.addr1 }">
     <input type=text name="addr2" id="useraddr2" tabindex="11" placeholder="${d.addr2 }">
    </span>
    </p>
    <p>
    <label for="usertel">��ȭ��ȣ</label>
    <span id="cellStyle">
	    
	    <input type=text name="tel" id="tel" style="width:250px" placeholder="${d.tel }">
	    
    </span>
    </p>
    <p>
    <label for="useremail">e-mail</label>
    <input type=text name="email" id="useremail" tabindex="13" placeholder="${d.email }"> @
    <select id="useremail2" name="email2" style="width:inherit" tabindex="14">
	      <option>naver.com</option>
	      <option>hanmail.net</option>
	      <option>gmail.com</option>
	      <option>nate.com</option>
	      <option>hotmail.com</option>
	      <option>�����Է�</option>
	    </select>
    </p>
    <p>
    <label for="usermail">���ϼ���</label> 
    <c:if test="${d.emailreceive=='���ŵ���' }">  
    <input type=radio name="emailreceive" id="usermail" checked value="���ŵ���">���ŵ���
    <input type=radio name="emailreceive" id="usermail" value="���Ű���">���Ű���
    </c:if>
     <c:if test="${d.emailreceive!='���ŵ���' }">  
    <input type=radio name="emailreceive" id="usermail" value="���ŵ���">���ŵ���
    <input type=radio name="emailreceive" id="usermail" checked value="���Ű���">���Ű���
    </c:if>  
    </p>
   
    <p>
    <label for="userjob">����</label>
    <select id="userjob" name="job">
	      <option>�л�</option>
	      <option>������</option>
	      <option>�����</option>
	      <option>�ֺ�</option>
	      <option>���ػ�</option>
	      <option>��Ƽ��Ʈ</option>
	      <option>��Ÿ</option>
	    </select>
    </p>
     <p>
    <label for="usermarry">��ȥ����</label>
    <input type=radio name="marry" id="usermarry" checked value="��ȥ">��ȥ
    <input type=radio name="marry" id="usermarry" value="��ȥ">��ȥ
    </p>
    <p>
    <label for="userhobby">���ɺо�</label>
    <input type=checkbox name="hobby" id="userhobby" value="������">������
    <input type=checkbox name="hobby" id="userhobby" value="����">����
    <input type=checkbox name="hobby" id="userhobby" value="���ͳ�">���ͳ�
    <input type=checkbox name="hobby" id="userhobby" value="����">����
    <input type=checkbox name="hobby" id="userhobby" value="����">����<br>
    <input type=checkbox name="hobby" id="userhobby" value="��ȭ����">��ȭ����
    <input type=checkbox name="hobby" id="userhobby" value="���ǰ���">���ǰ���
    <input type=checkbox name="hobby" id="userhobby" value="����">����
    <input type=checkbox name="hobby" id="userhobby" value="����">����
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
    <input type=text name="account1" id="useraccount" style="width:250px ">
    
    </p>
    <p class="btnSubmit">
    <input type=button id="btnSub" value=����>
    <input type=button id="btnCancel" value=���>
    </p>
    </form>
  </div>
</body>
</html>







