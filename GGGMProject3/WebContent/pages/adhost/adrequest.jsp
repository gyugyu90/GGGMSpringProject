<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ad Request Form</title>
<style type="text/css">

table, td {
    border: 1px solid black;
    border-radius: 5px;
    border-collapse: inherit;
    border-color: white;
}


</style>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<script type="text/javascript">
function chsBigCat(){
      
      var target=document.getElementById("big_cat")
      var msg="";
      if(target.selectedIndex==1)
         msg='<select id="big_cat" onchange="showSmCat()" id="sbmSlt1" name="sub_category">   <option value="��ǻ��">��ǻ��</option> <option value="�޴���">�޴���</option> <option value="��Ʈ��">��Ʈ��</option> </select>&nbsp;&nbsp;'
      if(target.selectedIndex==2)
         msg='<select id="big_cat" onchange="showSmCat()" id="sbmSlt1" name="sub_category">   <option value="������">������</option> <option value="������">������</option> <option value="�Ƶ���">�Ƶ���</option> </select>&nbsp;&nbsp;'
      if(target.selectedIndex==3)
         msg='<select id="big_cat" onchange="showSmCat()" id="sbmSlt1" name="sub_category">   <option value="�ѽ�">�ѽ�</option> <option value="�߽�">�߽�</option> <option value="���">���</option> </select>&nbsp;&nbsp;'
      showSmCat(msg);
}
function showSmCat(msg){
   $('#sm_cat').html(msg);
}
function chsMinAge(){
   var target=document.getElementById("min_age")
   var msg="";
   if(target.selectedIndex==1)
      msg='�ִ� ����:<select id="sbmSlt3" name="max_age"> <option value="10">10��</option> <option value="20">20��</option> <option value="30">30��</option> <option value="40">40��</option> <option value="50">50��</option> <option value="60">60�� �̻�</option> </select>'
   if(target.selectedIndex==2)
      msg='�ִ� ����:<select id="sbmSlt3" name="max_age"> <option value="20">20��</option> <option value="30">30��</option> <option value="40">40��</option> <option value="50">50��</option> <option value="60">60�� �̻�</option> </select>'
   if(target.selectedIndex==3)
      msg='�ִ� ����:<select id="sbmSlt3" name="max_age"> <option value="30">30��</option> <option value="40">40��</option> <option value="50">50��</option> <option value="60">60�� �̻�</option> </select>'
   if(target.selectedIndex==4)
      msg='�ִ� ����:<select id="sbmSlt3" name="max_age"> <option value="40">40��</option> <option value="50">50��</option> <option value="60">60�� �̻�</option> </select>'
   if(target.selectedIndex==5)
      msg='�ִ� ����:<select id="sbmSlt3" name="max_age"> <option value="50">50��</option> <option value="60">60�� �̻�</option> </select>'      
   if(target.selectedIndex==6)
      msg='�ִ� ����:<select id="sbmSlt3" name="max_age"><option value="60">60�� �̻�</option> </select>'
   showMaxAge(msg);
}
function showMaxAge(msg){
   $('#mx_age').html(msg);
}

function chsMinSal(){
   var target=document.getElementById("min_sal")
   var msg="";
   if(target.selectedIndex==1)
      msg='�ִ�:<select id="sbmSlt4" name="max_sal"> <option value="100">100����/��</option> <option value="200">200����/��</option> <option value="300">300����/��</option> <option value="400">400����/��</option> <option value="500">500����/��</option> <option value="600">600���� �̻�/��</option> </select>'
   if(target.selectedIndex==2)
      msg='�ִ�:<select id="sbmSlt4" name="max_sal"> <option value="200">200����/��</option> <option value="300">300����/��</option> <option value="400">400����/��</option> <option value="500">500����/��</option> <option value="600">600���� �̻�/��</option> </select>'
   if(target.selectedIndex==3)
      msg='�ִ�:<select id="sbmSlt4" name="max_sal"> <option value="300">300����/��</option> <option value="400">400����/��</option> <option value="500">500����/��</option> <option value="600">600���� �̻�/��</option> </select>'
   if(target.selectedIndex==4)
      msg='�ִ�:<select id="sbmSlt4" name="max_sal"> <option value="400">400����/��</option> <option value="500">500����/��</option> <option value="600">600���� �̻�/��</option> </select>'
   if(target.selectedIndex==5)
      msg='�ִ�:<select id="sbmSlt4" name="max_sal"> <option value="500">500����/��</option> <option value="600">600���� �̻�/��</option> </select>'      
   if(target.selectedIndex==6)
      msg='�ִ�:<select id="sbmSlt4" name="max_sal"><option value="600">600���� �̻�/��</option> </select>'
   showMaxSal(msg);
}
function showMaxSal(msg){
   $('#mx_sal').html(msg);
}

function send(){
   
   var ttl = 0;
   for(var i=1;i<=7;i++){
      ttl+=($('#wgt'+i).val()*1);
   }
   
   if(ttl!=1){
      for(var i=1;i<=7;i++)
         $('#err'+i).text("error");
      return;
   }else{
      for(var i=1;i<=7;i++)
         $('#err'+i).text("ok");
   }
   
   $('#adReq').submit();
//    var target="";
//    for(var i=1;i<4;i++){
//       target=document.getElementById("sbmFrm"+i)
//       if(target.val()==""){
//          alert("�Է��ʿ�");
// //          return;
//       }
               
//    }
   
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
    <table  width=680 height=800 align=center >
    <p>
    <tr>
     <td align=center bgcolor=steelblue><font color=white>���� ����</font></td>
     <td colspan="3" bgcolor=#F5F5F5>
      <input type=text name="adsubject" id="sbmFrm1"> 
     </td>
    </tr>
    <tr>
      <td align=center bgcolor=steelblue ><font color=white>����<br>������</font></td>
      <td colspan="3" bgcolor=#F5F5F5>
       <input type="file" id="sbmFrm2" name="url">
      </td>
    </tr>
    <tr>
      <td align=center bgcolor=steelblue><font color=white>����<br>�̹���</font></td>
      <td colspan="3" bgcolor=#F5F5F5>
       <input type="file" id="sbmFrm2" name="img">
      </td>
    </tr>
    <tr>
      <td align=center bgcolor=steelblue><font color=white>���� ����</font></td>
      <td colspan="3" bgcolor=#F5F5F5>
       <textarea name="msg"  class="adcontent" id="sbmFrm3" rows="20" cols="80"></textarea>
    </tr>
   <tr>
      <td align=center bgcolor=steelblue><font color=white>Ŭ�� ��<br>����Ʈ</font></td>
      <td colspan="3" bgcolor=#F5F5F5>
       <input type="text" id="sbmFrm4" name="ppc">
    </td>
    <tr>
      <td align=center bgcolor=steelblue><font color=white>����<br>ī�װ�</font></td>
      <td colspan="3" bgcolor=#F5F5F5>
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
          <td rowspan = "7" align="center" width=100 bgcolor=steelblue><font color=white>Ÿ��</font></td>
          <td align=center bgcolor=cornflowerblue><font color=white>����</font></td>
          <td bgcolor=#F5F5F5>
            <input type=radio name="sex" id="sbmSlt2" checked value="1">����
            <input type=radio name="sex" id="sbmSlt2" value="2">����
           <input type=radio name="sex" id="sbmSlt2" value="3">��������
          </td>
          <td align=center bgcolor=#F5F5F5>����ġ
           <input type="number" max=1 min=0 step=0.05 id="wgt1" name="wgt1">
           <span id=err1 style="color:red"></span>
          </td>
        </tr>
      <tr>
         <td align=center bgcolor=cornflowerblue><font color=white>����</font></td>
         <td bgcolor=#F5F5F5>�ּ� ����:
            <select id="min_age" onchange="chsMinAge()" name="min_age">
               <option value="">����</option>
               <option value="10">10��</option>
               <option value="20">20��</option>
               <option value="30">30��</option>
               <option value="40">40��</option>
               <option value="50">50��</option>
               <option value="60">60�� �̻�</option>
            </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span id="mx_age">
            </span>
         </td>
          <td align=center bgcolor=#F5F5F5>����ġ
           <input type="number" max=1 min=0 step=0.05 id="wgt2" name="wgt2">
           <span id=err2 style="color:red"></span>
          </td>
      </tr>
      <tr>
         <td align=center bgcolor=cornflowerblue><font color=white>�ּ���</font></td>
         <td bgcolor=#F5F5F5>&nbsp;
           <select id="useraddr" name="addr">
              <option value="1">����</option><option value="2">���</option>
              <option value="3">�泲</option><option value="4">���</option>
              <option value="5">����</option><option value="6">�뱸</option>
              <option value="7">����</option><option value="8">�λ�</option>
              <option value="9">����</option><option value="10">����</option>
              <option value="11">���</option><option value="12">��õ</option>
              <option value="13">����</option><option value="14">����</option>
              <option value="15">����</option><option value="16">�泲</option>
              <option value="17">���</option>
          </select>
         </td>
         <td align=center bgcolor=#F5F5F5>����ġ
           <input type="number" max=1 min=0 step=0.05 id="wgt3" name="wgt3">
           <span id=err3 style="color:red"></span>
          </td>
      </tr>
      <tr>
         <td align=center bgcolor=cornflowerblue><font color=white>��ȥ����</font></td>
         <td bgcolor=#F5F5F5>
            <input type=radio name="marry" id="usermarry" checked value="1">��ȥ
            <input type=radio name="marry" id="usermarry" value="2">��ȥ
           <input type=radio name="marry" id="usermarry" value="3">����
          </td>
          <td align=center bgcolor=#F5F5F5>����ġ
           <input type="number" max=1 min=0 step=0.05 id="wgt4" name="wgt4">
           <span id=err4 style="color:red"></span>
          </td>
      </tr>
      <tr>
         <td align=center bgcolor=cornflowerblue><font color=white>����</font></td>
         <td bgcolor=#F5F5F5>
           <input type=checkbox name="job" id="userjob" value="1">�л�
           <input type=checkbox name="job" id="userjob" value="2">�����
           <input type=checkbox name="job" id="userjob" value="4">�����
           <input type=checkbox name="job" id="userjob" value="8">�ֺ�<br>
           <input type=checkbox name="job" id="userjob" value="16">ȸ���
           <input type=checkbox name="job" id="userjob" value="32">��Ƽ��Ʈ
           <input type=checkbox name="job" id="userjob" value="64">��Ÿ
           </td>
          <td align=center bgcolor=#F5F5F5>����ġ
           <input type="number" max=1 min=0 step=0.05 id="wgt5" name="wgt5">
           <span id=err5 style="color:red"></span>
          </td>
      </tr>
      <tr>
         <td align=center bgcolor=cornflowerblue><font color=white>�ҵ�</font></td>
         <td bgcolor=#F5F5F5>�ּ�:
            <select id="min_sal" onchange="chsMinSal()" name="min_sal">
               <option value="">����</option>
               <option value="100">100����/��</option>
               <option value="200">200����/��</option>
               <option value="300">300����/��</option>
               <option value="400">400����/��</option>
               <option value="500">500����/��</option>
               <option value="600">600���� �̻�/��</option>
            </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span id="mx_sal">
            </span>
         </td>
          <td align=center bgcolor=#F5F5F5>����ġ
           <input type="number" max=1 min=0 step=0.05 id="wgt6" name="wgt6">
           <span id=err6 style="color:red"></span>
          </td>
      </tr>
      <tr>
         <td align=center bgcolor=cornflowerblue><font color=white>���ɺо�</font></td>
         <td bgcolor=#F5F5F5>
           <input type=checkbox name="interest" id="userhobby" value="1">������
          <input type=checkbox name="interest" id="userhobby" value="2">����
          <input type=checkbox name="interest" id="userhobby" value="4">���ͳ�
          <input type=checkbox name="interest" id="userhobby" value="8">����
          <input type=checkbox name="interest" id="userhobby" value="16">����<br>
          <input type=checkbox name="interest" id="userhobby" value="32">��ȭ����
          <input type=checkbox name="interest" id="userhobby" value="64">���ǰ���
          <input type=checkbox name="interest" id="userhobby" value="128">����
          <input type=checkbox name="interest" id="userhobby" value="256">����
         </td>
          <td align=center bgcolor=#F5F5F5>����ġ
           <input type="number" max=1 min=0 step=0.05 id="wgt7" name="wgt7">
           <span id=err7 style="color:red"></span>
          </td>
      </tr>
      
       </table>
       </form>      
            <br>
               
            <div class="panel-footer" style="text-align: center;">
               <button type="button" class="btnSbt" onclick="send()">����</button>
            </div>
         </div>
      </div>
   </div>
</body>
</html>