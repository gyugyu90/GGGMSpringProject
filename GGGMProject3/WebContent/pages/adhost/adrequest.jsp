<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>


<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<script type="text/javascript">
$(function(){
	var target=document.getElementById("big_cat")

	if(target.selectedIndex==1){
		$('#sm_cat').text("������ �ƾ�..");	
// 		$('#sm_cat').text(target.options[target.selectedIndex].text);
	}
	

	
// 	$('#sm_cat').html();
	
// 	$('#big_cat').select(function(){
		
// 		$('#theaterInfo').html(httpRequest.responseText);
	});
	
// 	click(function(){
// 		var mno=$(this).attr("value");
// 		$('#mimg').html('<img src="movie/image/s'+mno+'.jpg" width=100 height=120>');
// 		var title=$(this).text();
// 		$('#mtitle').text("����:"+title);
// 		var param="mno="+mno;
// 		sendMessage("GET", "theater_info.do", param, theater_info);
// 	});
// });
</script>



</head>
<body>
	<div id="adrequestform">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-header">
					<h3>&nbsp;&nbsp;�� ���� ��� ��û</h3>
					
    <table border=1 width=850 height=800 align=center>
    <tr>
     <td align=center >���� ����</td>
     <td colspan="3">
      <input type=text name="adsubject" id="adsubject" > 
     </td>
    </tr>
    <tr>
      <td align=center >���� ������</td>
      <td colspan="3" >
       <input type="file" id="exampleInputFile">
      </td>
    </tr>
    <tr>
      <td align=center >���� ����</td>
      <td colspan="3">
       <textarea name=adcontent  class="adcontent" rows="20" cols="100"></textarea>
    </tr>
	<tr>
      <td align=center >����Ʈ ����</td>
      <td colspan="3">
       <input type="text" id="adpoint">
    </td>
    <tr>
      <td align=center >���� ī�װ�</td>
      <td colspan="3">
      &nbsp;
    	<select id="big_cat" name="big_cat">
	    	<option id=>����</option>
	      	<option>�Ƿ�</option>
	      	<option>����</option>
	    </select>&nbsp;&nbsp;
    	<span id="sm_cat">
	    </span>
	    </td>
       
    
    
    </tr>	
		<tr>
          <td rowspan = "7" align="center" width=100>Ÿ��</td>
          <td align=center>����</td>
          <td>
            <input type=radio name="sex" id="usersex" checked value="����">����
            <input type=radio name="sex" id="usersex" value="����">����
        	<input type=radio name="sex" id="usersex" value="����">��������
          </td>
          <td align=center>����ġ
        	<input type="text" id="sexvalue">
          </td>
        </tr>
		<tr>
    	  <td align=center>����</td>
    	  <td>
    		<input type=checkbox name="age" id="userage" value="10">10��
        	<input type=checkbox name="age" id="userage" value="20">20��
    		<input type=checkbox name="age" id="userage" value="30">30��
  	 		<input type=checkbox name="age" id="userage" value="40">40��
    		<input type=checkbox name="age" id="userage" value="50">50��
    		<input type=checkbox name="age" id="userage" value="60">60�� �̻�
    	  </td>
          <td align=center >����ġ
        	<input type="text" id="agevalue">
          </td>
		</tr>
		<tr>
    	  <td align=center>�ּ���</td>
    	  <td>&nbsp;
    	    <select id="useraddr" name="addr">
	      	  <option>����</option>
	      	  <option>���</option>
	      	  <option>���</option>
	      	  <option>����</option>
	      	  <option>����</option>
	      	  <option>�뱸</option>
	      	  <option>����</option>
	      	  <option>�λ�</option>
	      	  <option>����</option>
	      	  <option>����</option>
	      	  <option>���</option>
	      	  <option>��õ</option>
	      	  <option>����</option>
	      	  <option>�����</option>
	      	  <option>����</option>
	      	  <option>��û��</option>
	      	  <option>��û��</option>
	    	</select>
	      </td>
	      <td align=center >����ġ
        	<input type="text" id="addrvalue">
          </td>
		</tr>
		<tr>
    	  <td align=center>��ȥ����</td>
    	  <td>
            <input type=radio name="marry" id="usermarry" checked value="��ȥ">��ȥ
            <input type=radio name="marry" id="usermarry" value="��ȥ">��ȥ
        	<input type=radio name="marry" id="usermarry" value="����">����
          </td>
          <td align=center>����ġ
        	<input type="text" id="marryvalue">
          </td>
		</tr>
		<tr>
    	  <td align=center>����</td>
    	  <td>
    	    <input type=checkbox name="job" id="userjob" value="�л�">�л�
    	    <input type=checkbox name="job" id="userjob" value="�����">�����
    	    <input type=checkbox name="job" id="userjob" value="�����">�����
    	    <input type=checkbox name="job" id="userjob" value="�ֺ�">�ֺ�<br>
    	    <input type=checkbox name="job" id="userjob" value="ȸ���">ȸ���
    	    <input type=checkbox name="job" id="userjob" value="��Ƽ��Ʈ">��Ƽ��Ʈ
    	    <input type=checkbox name="job" id="userjob" value="��Ÿ">��Ÿ
    	    </td>
          <td align=center>����ġ
        	<input type="text" id="jobvalue">
          </td>
		</tr>
		<tr>
    	  <td align=center>�ҵ�</td>
    	  <td>
    		<input type=checkbox name="sal" id="usersal" value="100">100~200
    		<input type=checkbox name="sal" id="usersal" value="200">200~300
    		<input type=checkbox name="sal" id="usersal" value="300">300~400<br>
    		<input type=checkbox name="sal" id="usersal" value="400">400~500
    		<input type=checkbox name="sal" id="usersal" value="500">500~600
   			<input type=checkbox name="sal" id="usersal" value="600">600�̻�
   		  </td>
          <td align=center>����ġ
        	<input type="text" id="salvalue">
          </td>
		</tr>
		<tr>
    	  <td align=center>���ɺо�</td>
    	  <td>
    	    <input type=checkbox name="hobby" id="userhobby" value="������">������
    		<input type=checkbox name="hobby" id="userhobby" value="����">����
    		<input type=checkbox name="hobby" id="userhobby" value="���ͳ�">���ͳ�
    		<input type=checkbox name="hobby" id="userhobby" value="����">����
    		<input type=checkbox name="hobby" id="userhobby" value="����">����<br>
    		<input type=checkbox name="hobby" id="userhobby" value="��ȭ����">��ȭ����
    		<input type=checkbox name="hobby" id="userhobby" value="���ǰ���">���ǰ���
    		<input type=checkbox name="hobby" id="userhobby" value="����">����
    		<input type=checkbox name="hobby" id="userhobby" value="����">����
    	  </td>
          <td align=center>����ġ
        	<input type="text" id="salvalue">
          </td>
		</tr>
       </table>		
				<br>
					
				<div class="panel-footer" style="text-align: center;">
					<button type="submit" class="btn btn-primary">����</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-primary">���</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>