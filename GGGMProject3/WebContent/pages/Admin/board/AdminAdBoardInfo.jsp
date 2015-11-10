<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ad Request Form</title>


<script type="text/javascript" src="<%=request.getContextPath() %>/ajax/ajax.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
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
      <input type=text name="adsubject" id="sbmFrm1" readonly="readonly" value="${d.adsubject }"> 
     </td>
    </tr>
    <tr>
      <td align=center >���� ������</td>
      <td colspan="3" >
       ${d.url }
      </td>
    </tr>
    <tr>
      <td align=center >���� �̹���</td>
      <td colspan="3" >
       ${d.img }
      </td>
    </tr>
    <tr>
      <td align=center >���� ����</td>
      <td colspan="3">
       <textarea name="msg"  class="adcontent" id="sbmFrm3" rows="20" cols="100" readonly="readonly">${d.msg }</textarea>
    </tr>
	<tr>
      <td align=center >Ŭ�� �� ����Ʈ</td>
      <td colspan="3">
       <input type="text" id="sbmFrm4" name="ppc" readonly="readonly" value="${d.ppc }">
    </td>
    <tr>
      <td align=center >����<br>ī�װ�</td>
      <td colspan="3">
      &nbsp;
��з�:${d.maj_category }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  �Һз�:${d.sub_category }
	    </td>
    </tr>	
		<tr>
          <td rowspan = "7" align="center" width=100>Ÿ��</td>
          <td align=center>����</td>
          <td>
           	${sex}
          </td>
          <td align=center>����ġ
        	<input type="number" max=1 min=0 step=0.05 id="wgt1" name="wgt1" readonly="readonly" value="${weight[0]}">
        	<span id=err1 style="color:red"></span>
          </td>
        </tr>
		<tr>
    	  <td align=center>����</td>
    	  <td>�ּ� ����: ${min_age }
    	  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ִ� ����: ${max_age }
    	  	<span id="mx_age">
    	  	</span>
    	  </td>
          <td align=center>����ġ
        	<input type="number" max=1 min=0 step=0.05 id="wgt2" name="wgt2" readonly="readonly" value="${weight[1]}">
        	<span id=err2 style="color:red"></span>
          </td>
		</tr>
		<tr>
    	  <td align=center>�ּ���</td>
    	  <td>&nbsp;
    	   ${addr }
	      </td>
	      <td align=center>����ġ
        	<input type="number" max=1 min=0 step=0.05 id="wgt3" name="wgt3" readonly="readonly" value="${weight[2]}">
        	<span id=err3 style="color:red"></span>
          </td>
		</tr>
		<tr>
    	  <td align=center>��ȥ����</td>
    	  <td>
            ${marry }
          </td>
          <td align=center>����ġ
        	<input type="number" max=1 min=0 step=0.05 id="wgt4" name="wgt4" readonly="readonly" value="${weight[3]}">
        	<span id=err4 style="color:red"></span>
          </td>
		</tr>
		<tr>
    	  <td align=center>����</td>
    	  <td>
    	    ${tgtJob }
    	    </td>
          <td align=center>����ġ
        	<input type="number" max=1 min=0 step=0.05 id="wgt5" name="wgt5" readonly="readonly" value="${weight[4]}">
        	<span id=err5 style="color:red"></span>
          </td>
		</tr>
		<tr>
    	  <td align=center>�ҵ�</td>
    	  
    	  <td>�ּ�:( ${min_sal } )&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  �ִ�:( ${min_sal } )
 
    	  </td>
    	  
          <td align=center>����ġ
        	<input type="number" max=1 min=0 step=0.05 id="wgt6" name="wgt6" readonly="readonly" value="${weight[5]}">
        	<span id=err6 style="color:red"></span>
          </td>
		</tr>
		<tr>
    	  <td align=center>���ɺо�</td>
    	  <td>
    	    ${tgtInterest }
    	  </td>
          <td align=center>����ġ
        	<input type="number" max=1 min=0 step=0.05 id="wgt7" name="wgt7" readonly="readonly" value="${weight[6]}">
        	<span id=err7 style="color:red"></span>
          </td>
		</tr>
		
       </table>
      		
				<br>
					
				<div class="panel-footer" style="text-align: center;">
					<button type="button" onclick="location.href='AdminAdInsert.do?adno=${d.adno}'">����</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="javascript:history.back()">���</button>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>