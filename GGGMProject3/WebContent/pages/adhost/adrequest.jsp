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
function chsBigCat(){
	
	var target=document.getElementById("big_cat")
	var msg="";
	if(target.selectedIndex==1)
		msg='<select id="big_cat" onchange="showSmCat()" id="sbmSlt1" name="sub_category">	<option value="��ǻ��">��ǻ��</option> <option value="�޴���">�޴���</option> <option value="��Ʈ��">��Ʈ��</option> </select>&nbsp;&nbsp;'
	if(target.selectedIndex==2)
		msg='<select id="big_cat" onchange="showSmCat()" id="sbmSlt1" name="sub_category">	<option value="������">������</option> <option value="������">������</option> <option value="�Ƶ���">�Ƶ���</option> </select>&nbsp;&nbsp;'
	if(target.selectedIndex==3)
		msg='<select id="big_cat" onchange="showSmCat()" id="sbmSlt1" name="sub_category">	<option value="�ѽ�">�ѽ�</option> <option value="�߽�">�߽�</option> <option value="���">���</option> </select>&nbsp;&nbsp;'
	showSmCat(msg);
}
function showSmCat(msg){
	$('#sm_cat').html(msg);
}
function chsMinAge(){
	var target=document.getElementById("min_age")
	var msg="";
	if(target.selectedIndex==1)
		msg='�ִ� ����:<select id="sbmSlt3" name="max_age"> <option value="a10">10��</option> <option value="a20">20��</option> <option value="a30">30��</option> <option value="a40">40��</option> <option value="a50">50��</option> <option value="a60">60�� �̻�</option> </select>'
	if(target.selectedIndex==2)
		msg='�ִ� ����:<select id="sbmSlt3" name="max_age"> <option value="a20">20��</option> <option value="a30">30��</option> <option value="a40">40��</option> <option value="a50">50��</option> <option value="a60">60�� �̻�</option> </select>'
	if(target.selectedIndex==3)
		msg='�ִ� ����:<select id="sbmSlt3" name="max_age"> <option value="a30">30��</option> <option value="a40">40��</option> <option value="a50">50��</option> <option value="a60">60�� �̻�</option> </select>'
	if(target.selectedIndex==4)
		msg='�ִ� ����:<select id="sbmSlt3" name="max_age"> <option value="a40">40��</option> <option value="a50">50��</option> <option value="a60">60�� �̻�</option> </select>'
	if(target.selectedIndex==5)
		msg='�ִ� ����:<select id="sbmSlt3" name="max_age"> <option value="a50">50��</option> <option value="a60">60�� �̻�</option> </select>'		
	if(target.selectedIndex==6)
		msg='�ִ� ����:<select id="sbmSlt3" name="max_age"><option value="a60">60�� �̻�</option> </select>'
	showMaxAge(msg);
}
function showMaxAge(msg){
	$('#mx_age').html(msg);
}

function chsMinSal(){
	var target=document.getElementById("min_sal")
	var msg="";
	if(target.selectedIndex==1)
		msg='�ִ�:<select id="sbmSlt4" name="max_sal"> <option value="s100">100����/��</option> <option value="s200">200����/��</option> <option value="s300">300����/��</option> <option value="s400">400����/��</option> <option value="s500">500����/��</option> <option value="s600">600���� �̻�/��</option> </select>'
	if(target.selectedIndex==2)
		msg='�ִ�:<select id="sbmSlt4" name="max_sal"> <option value="s200">200����/��</option> <option value="s300">300����/��</option> <option value="s400">400����/��</option> <option value="s500">500����/��</option> <option value="s600">600���� �̻�/��</option> </select>'
	if(target.selectedIndex==3)
		msg='�ִ�:<select id="sbmSlt4" name="max_sal"> <option value="s300">300����/��</option> <option value="s400">400����/��</option> <option value="s500">500����/��</option> <option value="s600">600���� �̻�/��</option> </select>'
	if(target.selectedIndex==4)
		msg='�ִ�:<select id="sbmSlt4" name="max_sal"> <option value="s400">400����/��</option> <option value="s500">500����/��</option> <option value="s600">600���� �̻�/��</option> </select>'
	if(target.selectedIndex==5)
		msg='�ִ�:<select id="sbmSlt4" name="max_sal"> <option value="s500">500����/��</option> <option value="s600">600���� �̻�/��</option> </select>'		
	if(target.selectedIndex==6)
		msg='�ִ�:<select id="sbmSlt4" name="max_sal"><option value="s600">600���� �̻�/��</option> </select>'
	showMaxSal(msg);
}
function showMaxSal(msg){
	$('#mx_sal').html(msg);
}

function send(){

	$('#adReq').submit();
// 	var target="";
// 	for(var i=1;i<4;i++){
// 		target=document.getElementById("sbmFrm"+i)
// 		if(target.val()==""){
// 			alert("�Է��ʿ�");
// // 			return;
// 		}
					
// 	}
	
}

</script>



</head>
<body>
	<div id="adrequestform">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-header">
					<h3>&nbsp;&nbsp;�� ���� ��� ��û</h3>
	
	<form id="adReq" name="adReq" action="ad_request_ok.do" method=post enctype="multipart/form-data">				
    <table border=1 width=850 height=800 align=center>
    
    <tr>
     <td align=center >���� ����</td>
     <td colspan="3">
      <input type=text name="adsubject" id="sbmFrm1"> 
     </td>
    </tr>
    <tr>
      <td align=center >���� ������</td>
      <td colspan="3" >
       <input type="file" id="sbmFrm2" name="url">
      </td>
    </tr>
    <tr>
      <td align=center >���� �̹���</td>
      <td colspan="3" >
       <input type="file" id="sbmFrm2" name="img">
      </td>
    </tr>
    <tr>
      <td align=center >���� ����</td>
      <td colspan="3">
       <textarea name="msg"  class="adcontent" id="sbmFrm3" rows="20" cols="100"></textarea>
    </tr>
	<tr>
      <td align=center >Ŭ�� �� ����Ʈ</td>
      <td colspan="3">
       <input type="text" id="sbmFrm4" name="ppc">
    </td>
    <tr>
      <td align=center >����<br>ī�װ�</td>
      <td colspan="3">
      &nbsp;
    	
    	<select id="big_cat" onchange="chsBigCat()" name="maj_category">
	    	<option value="">����</option>
	    	<option value="����">����</option>
	      	<option value="�Ƿ�">�Ƿ�</option>
	      	<option value="����">����</option>
	    </select>&nbsp;&nbsp;
    	<span id="sm_cat">
	    </span>
	    </td>
    </tr>	
		<tr>
          <td rowspan = "7" align="center" width=100>Ÿ��</td>
          <td align=center>����</td>
          <td>
            <input type=radio name="sex" id="sbmSlt2" checked value="����">����
            <input type=radio name="sex" id="sbmSlt2" value="����">����
        	<input type=radio name="sex" id="sbmSlt2" value="����">��������
          </td>
          <td align=center>����ġ
        	<input type="text" id="wgt1" name="wgt1">
          </td>
        </tr>
		<tr>
    	  <td align=center>����</td>
    	  <td>�ּ� ����:
    	  	<select id="min_age" onchange="chsMinAge()" name="min_age">
    	  		<option value="">����</option>
    	  		<option value="a10">10��</option>
    	  		<option value="a20">20��</option>
    	  		<option value="a30">30��</option>
    	  		<option value="a40">40��</option>
    	  		<option value="a50">50��</option>
    	  		<option value="a60">60�� �̻�</option>
    	  	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	  	<span id="mx_age">
    	  	</span>
    	  </td>
          <td align=center>����ġ
        	<input type="text" id="agevalue" name="wgt2">
          </td>
		</tr>
		<tr>
    	  <td align=center>�ּ���</td>
    	  <td>&nbsp;
    	    <select id="useraddr" name="addr">
	      	  <option>����</option><option>���</option>
	      	  <option>�泲</option><option>���</option>
	      	  <option>����</option><option>�뱸</option>
	      	  <option>����</option><option>�λ�</option>
	      	  <option>����</option><option>����</option>
	      	  <option>���</option><option>��õ</option>
	      	  <option>����</option><option>����</option>
	      	  <option>����</option><option>�泲</option>
	      	  <option>���</option>
	    	</select>
	      </td>
	      <td align=center>����ġ
        	<input type="text" id="addrvalue" name="wgt3">
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
        	<input type="text" id="marryvalue" name="wgt4">
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
        	<input type="text" id="jobvalue" name="wgt5">
          </td>
		</tr>
		<tr>
    	  <td align=center>�ҵ�</td>
    	  
    	  <td>�ּ�:
    	  	<select id="min_sal" onchange="chsMinSal()" name="min_sal">
    	  		<option value="">����</option>
    	  		<option value="s100">100����/��</option>
    	  		<option value="s200">200����/��</option>
    	  		<option value="s300">300����/��</option>
    	  		<option value="s400">400����/��</option>
    	  		<option value="s500">500����/��</option>
    	  		<option value="s600">600���� �̻�/��</option>
    	  	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	  	<span id="mx_sal">
    	  	</span>
    	  </td>
    	  
          <td align=center>����ġ
        	<input type="text" id="salvalue" name="wgt6">
          </td>
		</tr>
		<tr>
    	  <td align=center>���ɺо�</td>
    	  <td>
    	    <input type=checkbox name="interest" id="userhobby" value="������">������
    		<input type=checkbox name="interest" id="userhobby" value="����">����
    		<input type=checkbox name="interest" id="userhobby" value="���ͳ�">���ͳ�
    		<input type=checkbox name="interest" id="userhobby" value="����">����
    		<input type=checkbox name="interest" id="userhobby" value="����">����<br>
    		<input type=checkbox name="interest" id="userhobby" value="��ȭ����">��ȭ����
    		<input type=checkbox name="interest" id="userhobby" value="���ǰ���">���ǰ���
    		<input type=checkbox name="interest" id="userhobby" value="����">����
    		<input type=checkbox name="interest" id="userhobby" value="����">����
    	  </td>
          <td align=center>����ġ
        	<input type="text" id="salvalue" name="wgt7">
          </td>
		</tr>
		
       </table>
       </form>		
				<br>
					
				<div class="panel-footer" style="text-align: center;">
					<button type="button" class="btnSbt" onclick="send()">����</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btnCnl">���</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>