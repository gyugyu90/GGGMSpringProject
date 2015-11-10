<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*, dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/ad.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/ajax/ajax.js"></script>
<script type="text/javascript">
$(function(){
var j=0;

$('#replyShow').click(function(){
	if(j==0)
	{
		$('#reply').show();
		$('#replyShow').text("댓글닫기");
		j=1;
	}
	else
	{
		$('#reply').hide();
		$('#replyShow').text("댓글열기");
		j=0;
	}
});
$('#reWriteBtn').click(function(){
	var msg=$('#rmsg').val();
	if(msg=="")
	{
		alert("댓글내용을 입력하세요");
		$('#rmsg').focus();
		return;
	}
	$('#new_re_write').submit();
});
// 댓글=>댓글
var k=0;
$('.re_re_a').click(function(){
	var no=$(this).attr("name");
	//alert(no);
	if(k==0)
	{
	   $('#re_re_write'+no).show();
	   k=1;
	}
	else
	{
		$('#re_re_write'+no).hide();
		k=0;
	}
});
var p=0;
$('.re_up_a').click(function(){
	var no=$(this).attr("name");
	//alert(no);
	if(p==0)
	{
	   $('#re_re_update'+no).show();
	   p=1;
	}
	else
	{
		$('#re_re_update'+no).hide();
		p=0;
	}
});

});
function reReplyBtn(no)
{
var rmsg=$('#rmsg'+no).val();
if(rmsg=="")
{
	alert("댓글 내용을 입력하세요");
	$('#rmsg'+no).focus();
	return;
}
$('#re_re_frm'+no).submit();
}
function reUpdateBtn(no)
{
var rmsg=$('#umsg'+no).val();
if(rmsg=="")
{
	alert("댓글 내용을 입력하세요");
	$('#umsg'+no).focus();
	return;
}
$('#re_update_frm'+no).submit();
}

//video관련
var myVideo=$("#main_video"); 
var playbutton=$("#play");
function playPause() { 
    if ($("#main_video").get(0).paused){
    	$("#main_video").get(0).play();
    	$("#play").get(0).textContent="pause";
    }
    else{
    	$("#main_video").get(0).pause();
    	$("#play").get(0).textContent="play!";
    }
        
} 

function end(){
   $("#getpoint").get(0).disabled=false
}
function getpoint(adno, point, adsubject){
   alert("야호!"+adno+" "+point+" "+adsubject);
   sendMessage('GET', "getpoint.do", "adno="+adno+"&point="+point+"&description="+adsubject, check);
}
function check(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			alert("ajax는 별거 아님!");
			//$('#theaterInfo').html(httpRequest.responseText);
		}
	}
}
</script>
<style type="text/css">
#ad_comment ul li{
	background-color:#99FF66;
	cursor:pointer;
}
#ad_comment ul li:hover{
	background-color:#CCFF99;
	cursor:pointer;
}
#next_ad{
	padding-right: 50px;
}

</style>
</head>
<body id="body">
	<div id="body">
		<div id="body_content">

			<video id="main_video"
				onended="end()">
				<source src="<%=request.getContextPath()%>/ADs/${adinfo.url}.mp4" type="video/mp4">
			</video><%-- autoplay --%>
			<button onclick="playPause()" id="play" style="margin-left:5%">play!</button> 
			<button id="getpoint" disabled="disabled" 
				onclick="getpoint('<%=request.getParameter("adno")%>', '${adinfo.pointrange}', '${adinfo.adsubject}')">포인트 적립</button>
			<br><br>
		</div>
		<div id="body_recommend">
			<%-- <div id="next_ad"><h3>랜던 추천 광고<a href="ad_index.do?adno=${side.adno+1}"> <img src="img/next_ad2.jpg"></a></h3></div> --%>
			<div id="sub_video" align=center>
			<c:forEach var="side" items="${sidelist}">
				<div class="sub_1">
					<a href="ad_index.do?adno=${side.adno}">
					<img src="poster/ad${side.adno}.PNG" class="poster"></a>
				</div>
				<div class="sub_2">
					<a href="ad_index.do?adno=${side.adno}">${side.url}</a>
					<b>HIT ${side.hit}</b>
				</div>
			</c:forEach>
			</div>
			<%-- div#sub_video --%>
		</div>
		<%-- div#body_recommend --%>
		<div id="ad_info" align=center style="padding-left:30px">
		<table width="680px">
			<tr>
				<td width="20%">광고이름</td><td width="80%"><b>${adinfo.adsubject }</b></td>
			</tr>
			<tr>
				<td width="20%">광고사이트</td><td width="80%"><b>${adinfo.url }</b></td>
			</tr>
			<tr>
				<td width="20%">광고주</td><td width="80%"><b>${adinfo.adid }</b></td>
			</tr>
			<tr>
				<td width="20%">포인트</td><td width="80%"><b>${adinfo.pointrange }</b></td>
			</tr>
			<tr>
				<td width="20%">경품</td><td width="80%"><b>${adinfo.presentrange }</b></td>
			</tr>
			<tr>
				<td colspan="2">${adinfo.msg}<br><br></td>
			</tr>
		</table>
		</div>
		<div id="ad_comment" align=center style="padding-left:30px">
			<ul style="padding-left:0px"><li id="replyShow" style="padding-top:10px;padding-bottom:10px;">댓글열기</li></ul>
			<div id="reply" style="display:none">
				<table border=0 width=680 id="table_content">
					<c:forEach var="rDto" items="${list }">
						<tr>
							<td align=left>
								<c:if test="${rDto.group_tab!=0 }">
									<c:forEach var="i" begin="1" end="${rDto.group_tab }">
									&nbsp;&nbsp;
              						</c:forEach>
									<img src="img/re_icon.gif">
								</c:if> <font color=blue>${rDto.name }</font> (${rDto.dbday }) <br>
								<c:if test="${rDto.group_tab!=0 }">
									<c:forEach var="i" begin="1" end="${rDto.group_tab }">
               						&nbsp;&nbsp;
              						</c:forEach>
								</c:if> ${rDto.msg }</td>
							<td align=right><c:if test="${sessionScope.id!=null }">
            └ <a href="#" class="re_re_a" name="${rDto.no }">댓글</a>&nbsp;
             <c:if test="${sessionScope.id==rDto.id }">
             └ <a href="#" class="re_up_a" name="${rDto.no }">수정</a>&nbsp;└ <a
											href="reply_delete.do?no=${rDto.no }&bno=${d.no}&page=${adno}">삭제</a>
									</c:if>
								</c:if></td>
						</tr>
						<tr id="re_re_write${rDto.no }" style="display: none">
							<td colspan="2"><form method=post
									action="reply_reply_write.do" id="re_re_frm${rDto.no }">
									<span style="display: block; float: left; height: 50px; width: 680px;">

										<textarea rows="2.5" cols="80" name=rmsg id="rmsg${rDto.no }"
											style="vertical-align: middle;"></textarea> <input
										type="hidden" name="bno" value="${d.no }"> <input
										type="hidden" name="page" value="${adno }"> <input
										type="hidden" name="no" value="${rDto.no }"> <input
										type="button" value="댓글" style="height: 50px"
										onclick="reReplyBtn(${rDto.no})">

									</span>
								</form></td>
						</tr>
						<tr id="re_re_update${rDto.no }" style="display: none">
							<td colspan="2">
								<form method=post action="reply_reply_update.do"
									id="re_update_frm${rDto.no }">
									<span
										style="display: block; float: left; height: 50px; width: 680px;">


										<textarea rows="2.5" cols="80" name=rmsg id="umsg${rDto.no }"
											style="vertical-align: middle;">${rDto.msg }</textarea> <input
										type="hidden" name="bno" value="${adno }"> <%--  <input type="hidden" name="page" value="${adno }"> --%>
										<input type="hidden" name="no" value="${d.no }"> <input
										type="button" value="댓글" style="height: 50px"
										onclick="reUpdateBtn(${rDto.no})">


									</span>
								</form>
							</td>
						</tr>
					</c:forEach>

					<c:if test="${sessionScope.id!=null }">
						<tr>
							<td colspan="2">
								<form method=post
									action="reply_new_write.do?adno=<%=request.getParameter("adno")%>"
									id="new_re_write">
									<span style="display: block; float: left; height: 50px">

										<textarea rows="2.5" cols="80" name=rmsg id=rmsg
											style="vertical-align: middle;"></textarea> <input
										type="hidden" name="bno" value="${adno }"> <%-- <input type="hidden" name="page" value="${adno }"> --%>
										<input type="button" value="댓글" style="height: 50px"
										id="reWriteBtn">

									</span>
								</form>
							</td>
						</tr>
					</c:if>
				</table>
				<table border=0 width=600>
					<tr>
						<td align=right><a
							href="ad_index.do?adno=${adno}&rcurpage=${rcurpage>1?rcurpage-1:rcurpage }"><img
								src="img/prev_icon.gif"></a>&nbsp; <a
							href="ad_index.do?adno=${adno}&rcurpage=${rcurpage<rtotal?rcurpage+1:rcurpage }"><img
								src="img/next_icon.gif"></a>&nbsp;&nbsp; ${rcurpage } page /
							${rtotal } pages</td>
					</tr>
				</table>

			</div>
		</div>
		<%-- adcomment --%>
	</div>
</body>
</html>