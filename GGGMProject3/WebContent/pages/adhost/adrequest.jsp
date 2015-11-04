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
		$('#sm_cat').text("선택이 됐어..");	
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
// 		$('#mtitle').text("제목:"+title);
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
					<h3>&nbsp;&nbsp;※ 광고 등록 신청</h3>
					
    <table border=1 width=850 height=800 align=center>
    <tr>
     <td align=center >광고 제목</td>
     <td colspan="3">
      <input type=text name="adsubject" id="adsubject" > 
     </td>
    </tr>
    <tr>
      <td align=center >광고 동영상</td>
      <td colspan="3" >
       <input type="file" id="exampleInputFile">
      </td>
    </tr>
    <tr>
      <td align=center >광고 설명</td>
      <td colspan="3">
       <textarea name=adcontent  class="adcontent" rows="20" cols="100"></textarea>
    </tr>
	<tr>
      <td align=center >포인트 범위</td>
      <td colspan="3">
       <input type="text" id="adpoint">
    </td>
    <tr>
      <td align=center >광고 카테고리</td>
      <td colspan="3">
      &nbsp;
    	<select id="big_cat" name="big_cat">
	    	<option id=>가전</option>
	      	<option>의류</option>
	      	<option>음식</option>
	    </select>&nbsp;&nbsp;
    	<span id="sm_cat">
	    </span>
	    </td>
       
    
    
    </tr>	
		<tr>
          <td rowspan = "7" align="center" width=100>타겟</td>
          <td align=center>성별</td>
          <td>
            <input type=radio name="sex" id="usersex" checked value="남자">남자
            <input type=radio name="sex" id="usersex" value="여자">여자
        	<input type=radio name="sex" id="usersex" value="무관">성별무관
          </td>
          <td align=center>가중치
        	<input type="text" id="sexvalue">
          </td>
        </tr>
		<tr>
    	  <td align=center>나이</td>
    	  <td>
    		<input type=checkbox name="age" id="userage" value="10">10대
        	<input type=checkbox name="age" id="userage" value="20">20대
    		<input type=checkbox name="age" id="userage" value="30">30대
  	 		<input type=checkbox name="age" id="userage" value="40">40대
    		<input type=checkbox name="age" id="userage" value="50">50대
    		<input type=checkbox name="age" id="userage" value="60">60대 이상
    	  </td>
          <td align=center >가중치
        	<input type="text" id="agevalue">
          </td>
		</tr>
		<tr>
    	  <td align=center>주소지</td>
    	  <td>&nbsp;
    	    <select id="useraddr" name="addr">
	      	  <option>강원</option>
	      	  <option>경기</option>
	      	  <option>경상남</option>
	      	  <option>경상북</option>
	      	  <option>광주</option>
	      	  <option>대구</option>
	      	  <option>대전</option>
	      	  <option>부산</option>
	      	  <option>서울</option>
	      	  <option>세종</option>
	      	  <option>울산</option>
	      	  <option>인천</option>
	      	  <option>전라남</option>
	      	  <option>전라북</option>
	      	  <option>제주</option>
	      	  <option>충청남</option>
	      	  <option>충청북</option>
	    	</select>
	      </td>
	      <td align=center >가중치
        	<input type="text" id="addrvalue">
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
        	<input type="text" id="marryvalue">
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
        	<input type="text" id="jobvalue">
          </td>
		</tr>
		<tr>
    	  <td align=center>소득</td>
    	  <td>
    		<input type=checkbox name="sal" id="usersal" value="100">100~200
    		<input type=checkbox name="sal" id="usersal" value="200">200~300
    		<input type=checkbox name="sal" id="usersal" value="300">300~400<br>
    		<input type=checkbox name="sal" id="usersal" value="400">400~500
    		<input type=checkbox name="sal" id="usersal" value="500">500~600
   			<input type=checkbox name="sal" id="usersal" value="600">600이상
   		  </td>
          <td align=center>가중치
        	<input type="text" id="salvalue">
          </td>
		</tr>
		<tr>
    	  <td align=center>관심분야</td>
    	  <td>
    	    <input type=checkbox name="hobby" id="userhobby" value="스포츠">스포츠
    		<input type=checkbox name="hobby" id="userhobby" value="쇼핑">쇼핑
    		<input type=checkbox name="hobby" id="userhobby" value="인터넷">인터넷
    		<input type=checkbox name="hobby" id="userhobby" value="여행">여행
    		<input type=checkbox name="hobby" id="userhobby" value="독서">독서<br>
    		<input type=checkbox name="hobby" id="userhobby" value="영화감상">영화감상
    		<input type=checkbox name="hobby" id="userhobby" value="음악감상">음악감상
    		<input type=checkbox name="hobby" id="userhobby" value="게임">게임
    		<input type=checkbox name="hobby" id="userhobby" value="공연">공연
    	  </td>
          <td align=center>가중치
        	<input type="text" id="salvalue">
          </td>
		</tr>
       </table>		
				<br>
					
				<div class="panel-footer" style="text-align: center;">
					<button type="submit" class="btn btn-primary">전송</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-primary">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>