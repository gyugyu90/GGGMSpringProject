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
         msg='<select id="big_cat" onchange="showSmCat()" id="sbmSlt1" name="sub_category">   <option value="컴퓨터">컴퓨터</option> <option value="휴대폰">휴대폰</option> <option value="노트북">노트북</option> </select>&nbsp;&nbsp;'
      if(target.selectedIndex==2)
         msg='<select id="big_cat" onchange="showSmCat()" id="sbmSlt1" name="sub_category">   <option value="여성복">여성복</option> <option value="남성복">남성복</option> <option value="아동복">아동복</option> </select>&nbsp;&nbsp;'
      if(target.selectedIndex==3)
         msg='<select id="big_cat" onchange="showSmCat()" id="sbmSlt1" name="sub_category">   <option value="한식">한식</option> <option value="중식">중식</option> <option value="양식">양식</option> </select>&nbsp;&nbsp;'
      showSmCat(msg);
}
function showSmCat(msg){
   $('#sm_cat').html(msg);
}
function chsMinAge(){
   var target=document.getElementById("min_age")
   var msg="";
   if(target.selectedIndex==1)
      msg='최대 나이:<select id="sbmSlt3" name="max_age"> <option value="10">10대</option> <option value="20">20대</option> <option value="30">30대</option> <option value="40">40대</option> <option value="50">50대</option> <option value="60">60대 이상</option> </select>'
   if(target.selectedIndex==2)
      msg='최대 나이:<select id="sbmSlt3" name="max_age"> <option value="20">20대</option> <option value="30">30대</option> <option value="40">40대</option> <option value="50">50대</option> <option value="60">60대 이상</option> </select>'
   if(target.selectedIndex==3)
      msg='최대 나이:<select id="sbmSlt3" name="max_age"> <option value="30">30대</option> <option value="40">40대</option> <option value="50">50대</option> <option value="60">60대 이상</option> </select>'
   if(target.selectedIndex==4)
      msg='최대 나이:<select id="sbmSlt3" name="max_age"> <option value="40">40대</option> <option value="50">50대</option> <option value="60">60대 이상</option> </select>'
   if(target.selectedIndex==5)
      msg='최대 나이:<select id="sbmSlt3" name="max_age"> <option value="50">50대</option> <option value="60">60대 이상</option> </select>'      
   if(target.selectedIndex==6)
      msg='최대 나이:<select id="sbmSlt3" name="max_age"><option value="60">60대 이상</option> </select>'
   showMaxAge(msg);
}
function showMaxAge(msg){
   $('#mx_age').html(msg);
}

function chsMinSal(){
   var target=document.getElementById("min_sal")
   var msg="";
   if(target.selectedIndex==1)
      msg='최대:<select id="sbmSlt4" name="max_sal"> <option value="100">100만원/월</option> <option value="200">200만원/월</option> <option value="300">300만원/월</option> <option value="400">400만원/월</option> <option value="500">500만원/월</option> <option value="600">600만원 이상/월</option> </select>'
   if(target.selectedIndex==2)
      msg='최대:<select id="sbmSlt4" name="max_sal"> <option value="200">200만원/월</option> <option value="300">300만원/월</option> <option value="400">400만원/월</option> <option value="500">500만원/월</option> <option value="600">600만원 이상/월</option> </select>'
   if(target.selectedIndex==3)
      msg='최대:<select id="sbmSlt4" name="max_sal"> <option value="300">300만원/월</option> <option value="400">400만원/월</option> <option value="500">500만원/월</option> <option value="600">600만원 이상/월</option> </select>'
   if(target.selectedIndex==4)
      msg='최대:<select id="sbmSlt4" name="max_sal"> <option value="400">400만원/월</option> <option value="500">500만원/월</option> <option value="600">600만원 이상/월</option> </select>'
   if(target.selectedIndex==5)
      msg='최대:<select id="sbmSlt4" name="max_sal"> <option value="500">500만원/월</option> <option value="600">600만원 이상/월</option> </select>'      
   if(target.selectedIndex==6)
      msg='최대:<select id="sbmSlt4" name="max_sal"><option value="600">600만원 이상/월</option> </select>'
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
//          alert("입력필요");
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
               <h3>&nbsp;&nbsp;※ 광고 등록 신청</h3>
   
   <form id="adReq" name="adReq" action="ad_request_ok.do" method=post enctype="multipart/form-data">            
    <table  width=680 height=800 align=center >
    <p>
    <tr>
     <td align=center bgcolor=steelblue><font color=white>광고 제목</font></td>
     <td colspan="3" bgcolor=#F5F5F5>
      <input type=text name="adsubject" id="sbmFrm1"> 
     </td>
    </tr>
    <tr>
      <td align=center bgcolor=steelblue ><font color=white>광고<br>동영상</font></td>
      <td colspan="3" bgcolor=#F5F5F5>
       <input type="file" id="sbmFrm2" name="url">
      </td>
    </tr>
    <tr>
      <td align=center bgcolor=steelblue><font color=white>광고<br>이미지</font></td>
      <td colspan="3" bgcolor=#F5F5F5>
       <input type="file" id="sbmFrm2" name="img">
      </td>
    </tr>
    <tr>
      <td align=center bgcolor=steelblue><font color=white>광고 설명</font></td>
      <td colspan="3" bgcolor=#F5F5F5>
       <textarea name="msg"  class="adcontent" id="sbmFrm3" rows="20" cols="80"></textarea>
    </tr>
   <tr>
      <td align=center bgcolor=steelblue><font color=white>클릭 당<br>포인트</font></td>
      <td colspan="3" bgcolor=#F5F5F5>
       <input type="text" id="sbmFrm4" name="ppc">
    </td>
    <tr>
      <td align=center bgcolor=steelblue><font color=white>광고<br>카테고리</font></td>
      <td colspan="3" bgcolor=#F5F5F5>
      &nbsp;
       <select id="big_cat" onchange="chsBigCat()" name="maj_category">
           <option value="">선택</option>
             <option value="가전">가전</option>
            <option value="의류">의류</option>
            <option value="음식">음식</option>
          </select>&nbsp;&nbsp;
       <span id="sm_cat">
       </span>
       </td>
    </tr>   
      <tr>
          <td rowspan = "7" align="center" width=100 bgcolor=steelblue><font color=white>타겟</font></td>
          <td align=center bgcolor=cornflowerblue><font color=white>성별</font></td>
          <td bgcolor=#F5F5F5>
            <input type=radio name="sex" id="sbmSlt2" checked value="1">남자
            <input type=radio name="sex" id="sbmSlt2" value="2">여자
           <input type=radio name="sex" id="sbmSlt2" value="3">성별무관
          </td>
          <td align=center bgcolor=#F5F5F5>가중치
           <input type="number" max=1 min=0 step=0.05 id="wgt1" name="wgt1">
           <span id=err1 style="color:red"></span>
          </td>
        </tr>
      <tr>
         <td align=center bgcolor=cornflowerblue><font color=white>나이</font></td>
         <td bgcolor=#F5F5F5>최소 나이:
            <select id="min_age" onchange="chsMinAge()" name="min_age">
               <option value="">선택</option>
               <option value="10">10대</option>
               <option value="20">20대</option>
               <option value="30">30대</option>
               <option value="40">40대</option>
               <option value="50">50대</option>
               <option value="60">60대 이상</option>
            </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span id="mx_age">
            </span>
         </td>
          <td align=center bgcolor=#F5F5F5>가중치
           <input type="number" max=1 min=0 step=0.05 id="wgt2" name="wgt2">
           <span id=err2 style="color:red"></span>
          </td>
      </tr>
      <tr>
         <td align=center bgcolor=cornflowerblue><font color=white>주소지</font></td>
         <td bgcolor=#F5F5F5>&nbsp;
           <select id="useraddr" name="addr">
              <option value="1">강원</option><option value="2">경기</option>
              <option value="3">경남</option><option value="4">경북</option>
              <option value="5">광주</option><option value="6">대구</option>
              <option value="7">대전</option><option value="8">부산</option>
              <option value="9">서울</option><option value="10">세종</option>
              <option value="11">울산</option><option value="12">인천</option>
              <option value="13">전남</option><option value="14">전북</option>
              <option value="15">제주</option><option value="16">충남</option>
              <option value="17">충북</option>
          </select>
         </td>
         <td align=center bgcolor=#F5F5F5>가중치
           <input type="number" max=1 min=0 step=0.05 id="wgt3" name="wgt3">
           <span id=err3 style="color:red"></span>
          </td>
      </tr>
      <tr>
         <td align=center bgcolor=cornflowerblue><font color=white>결혼여부</font></td>
         <td bgcolor=#F5F5F5>
            <input type=radio name="marry" id="usermarry" checked value="1">미혼
            <input type=radio name="marry" id="usermarry" value="2">기혼
           <input type=radio name="marry" id="usermarry" value="3">무관
          </td>
          <td align=center bgcolor=#F5F5F5>가중치
           <input type="number" max=1 min=0 step=0.05 id="wgt4" name="wgt4">
           <span id=err4 style="color:red"></span>
          </td>
      </tr>
      <tr>
         <td align=center bgcolor=cornflowerblue><font color=white>직업</font></td>
         <td bgcolor=#F5F5F5>
           <input type=checkbox name="job" id="userjob" value="1">학생
           <input type=checkbox name="job" id="userjob" value="2">사업가
           <input type=checkbox name="job" id="userjob" value="4">운동선수
           <input type=checkbox name="job" id="userjob" value="8">주부<br>
           <input type=checkbox name="job" id="userjob" value="16">회사원
           <input type=checkbox name="job" id="userjob" value="32">아티스트
           <input type=checkbox name="job" id="userjob" value="64">기타
           </td>
          <td align=center bgcolor=#F5F5F5>가중치
           <input type="number" max=1 min=0 step=0.05 id="wgt5" name="wgt5">
           <span id=err5 style="color:red"></span>
          </td>
      </tr>
      <tr>
         <td align=center bgcolor=cornflowerblue><font color=white>소득</font></td>
         <td bgcolor=#F5F5F5>최소:
            <select id="min_sal" onchange="chsMinSal()" name="min_sal">
               <option value="">선택</option>
               <option value="100">100만원/월</option>
               <option value="200">200만원/월</option>
               <option value="300">300만원/월</option>
               <option value="400">400만원/월</option>
               <option value="500">500만원/월</option>
               <option value="600">600만원 이상/월</option>
            </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span id="mx_sal">
            </span>
         </td>
          <td align=center bgcolor=#F5F5F5>가중치
           <input type="number" max=1 min=0 step=0.05 id="wgt6" name="wgt6">
           <span id=err6 style="color:red"></span>
          </td>
      </tr>
      <tr>
         <td align=center bgcolor=cornflowerblue><font color=white>관심분야</font></td>
         <td bgcolor=#F5F5F5>
           <input type=checkbox name="interest" id="userhobby" value="1">스포츠
          <input type=checkbox name="interest" id="userhobby" value="2">쇼핑
          <input type=checkbox name="interest" id="userhobby" value="4">인터넷
          <input type=checkbox name="interest" id="userhobby" value="8">여행
          <input type=checkbox name="interest" id="userhobby" value="16">독서<br>
          <input type=checkbox name="interest" id="userhobby" value="32">영화감상
          <input type=checkbox name="interest" id="userhobby" value="64">음악감상
          <input type=checkbox name="interest" id="userhobby" value="128">게임
          <input type=checkbox name="interest" id="userhobby" value="256">공연
         </td>
          <td align=center bgcolor=#F5F5F5>가중치
           <input type="number" max=1 min=0 step=0.05 id="wgt7" name="wgt7">
           <span id=err7 style="color:red"></span>
          </td>
      </tr>
      
       </table>
       </form>      
            <br>
               
            <div class="panel-footer" style="text-align: center;">
               <button type="button" class="btnSbt" onclick="send()">전송</button>
            </div>
         </div>
      </div>
   </div>
</body>
</html>