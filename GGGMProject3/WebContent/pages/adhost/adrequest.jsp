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
		msg='<select id="big_cat" onchange="showSmCat()" id="sbmSlt1" name="sub_category">	<option value="컴퓨터">컴퓨터</option> <option value="휴대폰">휴대폰</option> <option value="노트북">노트북</option> </select>&nbsp;&nbsp;'
	if(target.selectedIndex==2)
		msg='<select id="big_cat" onchange="showSmCat()" id="sbmSlt1" name="sub_category">	<option value="여성복">여성복</option> <option value="남성복">남성복</option> <option value="아동복">아동복</option> </select>&nbsp;&nbsp;'
	if(target.selectedIndex==3)
		msg='<select id="big_cat" onchange="showSmCat()" id="sbmSlt1" name="sub_category">	<option value="한식">한식</option> <option value="중식">중식</option> <option value="양식">양식</option> </select>&nbsp;&nbsp;'
	showSmCat(msg);
}
function showSmCat(msg){
	$('#sm_cat').html(msg);
}
function chsMinAge(){
	var target=document.getElementById("min_age")
	var msg="";
	if(target.selectedIndex==1)
		msg='최대 나이:<select id="sbmSlt3" name="max_age"> <option value="a10">10대</option> <option value="a20">20대</option> <option value="a30">30대</option> <option value="a40">40대</option> <option value="a50">50대</option> <option value="a60">60대 이상</option> </select>'
	if(target.selectedIndex==2)
		msg='최대 나이:<select id="sbmSlt3" name="max_age"> <option value="a20">20대</option> <option value="a30">30대</option> <option value="a40">40대</option> <option value="a50">50대</option> <option value="a60">60대 이상</option> </select>'
	if(target.selectedIndex==3)
		msg='최대 나이:<select id="sbmSlt3" name="max_age"> <option value="a30">30대</option> <option value="a40">40대</option> <option value="a50">50대</option> <option value="a60">60대 이상</option> </select>'
	if(target.selectedIndex==4)
		msg='최대 나이:<select id="sbmSlt3" name="max_age"> <option value="a40">40대</option> <option value="a50">50대</option> <option value="a60">60대 이상</option> </select>'
	if(target.selectedIndex==5)
		msg='최대 나이:<select id="sbmSlt3" name="max_age"> <option value="a50">50대</option> <option value="a60">60대 이상</option> </select>'		
	if(target.selectedIndex==6)
		msg='최대 나이:<select id="sbmSlt3" name="max_age"><option value="a60">60대 이상</option> </select>'
	showMaxAge(msg);
}
function showMaxAge(msg){
	$('#mx_age').html(msg);
}

function chsMinSal(){
	var target=document.getElementById("min_sal")
	var msg="";
	if(target.selectedIndex==1)
		msg='최대:<select id="sbmSlt4" name="max_sal"> <option value="s100">100만원/월</option> <option value="s200">200만원/월</option> <option value="s300">300만원/월</option> <option value="s400">400만원/월</option> <option value="s500">500만원/월</option> <option value="s600">600만원 이상/월</option> </select>'
	if(target.selectedIndex==2)
		msg='최대:<select id="sbmSlt4" name="max_sal"> <option value="s200">200만원/월</option> <option value="s300">300만원/월</option> <option value="s400">400만원/월</option> <option value="s500">500만원/월</option> <option value="s600">600만원 이상/월</option> </select>'
	if(target.selectedIndex==3)
		msg='최대:<select id="sbmSlt4" name="max_sal"> <option value="s300">300만원/월</option> <option value="s400">400만원/월</option> <option value="s500">500만원/월</option> <option value="s600">600만원 이상/월</option> </select>'
	if(target.selectedIndex==4)
		msg='최대:<select id="sbmSlt4" name="max_sal"> <option value="s400">400만원/월</option> <option value="s500">500만원/월</option> <option value="s600">600만원 이상/월</option> </select>'
	if(target.selectedIndex==5)
		msg='최대:<select id="sbmSlt4" name="max_sal"> <option value="s500">500만원/월</option> <option value="s600">600만원 이상/월</option> </select>'		
	if(target.selectedIndex==6)
		msg='최대:<select id="sbmSlt4" name="max_sal"><option value="s600">600만원 이상/월</option> </select>'
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
// 			alert("입력필요");
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
					<h3>&nbsp;&nbsp;※ 광고 등록 신청</h3>
	
	<form id="adReq" name="adReq" action="ad_request_ok.do" method=post enctype="multipart/form-data">				
    <table border=1 width=850 height=800 align=center>
    
    <tr>
     <td align=center >광고 제목</td>
     <td colspan="3">
      <input type=text name="adsubject" id="sbmFrm1"> 
     </td>
    </tr>
    <tr>
      <td align=center >광고 동영상</td>
      <td colspan="3" >
       <input type="file" id="sbmFrm2" name="url">
      </td>
    </tr>
    <tr>
      <td align=center >광고 이미지</td>
      <td colspan="3" >
       <input type="file" id="sbmFrm2" name="img">
      </td>
    </tr>
    <tr>
      <td align=center >광고 설명</td>
      <td colspan="3">
       <textarea name="msg"  class="adcontent" id="sbmFrm3" rows="20" cols="100"></textarea>
    </tr>
	<tr>
      <td align=center >클릭 당 포인트</td>
      <td colspan="3">
       <input type="text" id="sbmFrm4" name="ppc">
    </td>
    <tr>
      <td align=center >광고<br>카테고리</td>
      <td colspan="3">
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
          <td rowspan = "7" align="center" width=100>타겟</td>
          <td align=center>성별</td>
          <td>
            <input type=radio name="sex" id="sbmSlt2" checked value="남자">남자
            <input type=radio name="sex" id="sbmSlt2" value="여자">여자
        	<input type=radio name="sex" id="sbmSlt2" value="무관">성별무관
          </td>
          <td align=center>가중치
        	<input type="text" id="wgt1" name="wgt1">
          </td>
        </tr>
		<tr>
    	  <td align=center>나이</td>
    	  <td>최소 나이:
    	  	<select id="min_age" onchange="chsMinAge()" name="min_age">
    	  		<option value="">선택</option>
    	  		<option value="a10">10대</option>
    	  		<option value="a20">20대</option>
    	  		<option value="a30">30대</option>
    	  		<option value="a40">40대</option>
    	  		<option value="a50">50대</option>
    	  		<option value="a60">60대 이상</option>
    	  	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	  	<span id="mx_age">
    	  	</span>
    	  </td>
          <td align=center>가중치
        	<input type="text" id="agevalue" name="wgt2">
          </td>
		</tr>
		<tr>
    	  <td align=center>주소지</td>
    	  <td>&nbsp;
    	    <select id="useraddr" name="addr">
	      	  <option>강원</option><option>경기</option>
	      	  <option>경남</option><option>경북</option>
	      	  <option>광주</option><option>대구</option>
	      	  <option>대전</option><option>부산</option>
	      	  <option>서울</option><option>세종</option>
	      	  <option>울산</option><option>인천</option>
	      	  <option>전남</option><option>전북</option>
	      	  <option>제주</option><option>충남</option>
	      	  <option>충북</option>
	    	</select>
	      </td>
	      <td align=center>가중치
        	<input type="text" id="addrvalue" name="wgt3">
          </td>
		</tr>
		<tr>
    	  <td align=center>결혼여부</td>
    	  <td>
            <input type=radio name="marry" id="usermarry" checked value="미혼">미혼
            <input type=radio name="marry" id="usermarry" value="기혼">기혼
        	<input type=radio name="marry" id="usermarry" value="무관">무관
          </td>
          <td align=center>가중치
        	<input type="text" id="marryvalue" name="wgt4">
          </td>
		</tr>
		<tr>
    	  <td align=center>직업</td>
    	  <td>
    	    <input type=checkbox name="job" id="userjob" value="학생">학생
    	    <input type=checkbox name="job" id="userjob" value="사업가">사업가
    	    <input type=checkbox name="job" id="userjob" value="운동선수">운동선수
    	    <input type=checkbox name="job" id="userjob" value="주부">주부<br>
    	    <input type=checkbox name="job" id="userjob" value="회사원">회사원
    	    <input type=checkbox name="job" id="userjob" value="아티스트">아티스트
    	    <input type=checkbox name="job" id="userjob" value="기타">기타
    	    </td>
          <td align=center>가중치
        	<input type="text" id="jobvalue" name="wgt5">
          </td>
		</tr>
		<tr>
    	  <td align=center>소득</td>
    	  
    	  <td>최소:
    	  	<select id="min_sal" onchange="chsMinSal()" name="min_sal">
    	  		<option value="">선택</option>
    	  		<option value="s100">100만원/월</option>
    	  		<option value="s200">200만원/월</option>
    	  		<option value="s300">300만원/월</option>
    	  		<option value="s400">400만원/월</option>
    	  		<option value="s500">500만원/월</option>
    	  		<option value="s600">600만원 이상/월</option>
    	  	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	  	<span id="mx_sal">
    	  	</span>
    	  </td>
    	  
          <td align=center>가중치
        	<input type="text" id="salvalue" name="wgt6">
          </td>
		</tr>
		<tr>
    	  <td align=center>관심분야</td>
    	  <td>
    	    <input type=checkbox name="interest" id="userhobby" value="스포츠">스포츠
    		<input type=checkbox name="interest" id="userhobby" value="쇼핑">쇼핑
    		<input type=checkbox name="interest" id="userhobby" value="인터넷">인터넷
    		<input type=checkbox name="interest" id="userhobby" value="여행">여행
    		<input type=checkbox name="interest" id="userhobby" value="독서">독서<br>
    		<input type=checkbox name="interest" id="userhobby" value="영화감상">영화감상
    		<input type=checkbox name="interest" id="userhobby" value="음악감상">음악감상
    		<input type=checkbox name="interest" id="userhobby" value="게임">게임
    		<input type=checkbox name="interest" id="userhobby" value="공연">공연
    	  </td>
          <td align=center>가중치
        	<input type="text" id="salvalue" name="wgt7">
          </td>
		</tr>
		
       </table>
       </form>		
				<br>
					
				<div class="panel-footer" style="text-align: center;">
					<button type="button" class="btnSbt" onclick="send()">전송</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btnCnl">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>