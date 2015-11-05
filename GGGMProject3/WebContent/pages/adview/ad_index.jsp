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
    	$("#play").get(0).textContent="||";
    }
    else{
    	$("#main_video").get(0).pause();
    	$("#play").get(0).textContent=">";
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
</style>
</head>
<body id="body">
	<div id="body">
		<div id="body_content">

			<video id="main_video"
				onended="end()">
				<source src="ADs/${adinfo.url}.mp4" type="video/mp4">
			</video><%-- autoplay --%>
			<button onclick="playPause()" id="play">></button> 
			<button id="getpoint" disabled="disabled" 
				onclick="getpoint('<%=request.getParameter("adno")%>', '${adinfo.pointrange}', '${adinfo.adsubject}')">포인트 적립</button>
		</div>
		<div id="body_recommend">

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

		<div id="ad_info" align=center>
			<ul>
				<li>광고이름=${adinfo.adsubject }</li>
				<li>광고사이트=${adinfo.url }</li>
				<li>광고주=${adinfo.adid }</li>
				<li>포인트=${adinfo.pointrange }</li>
				<li>경품=${adinfo.presentrange }</li>
			</ul>
		</div>
		<div id="ad_msg">
		<span>${adinfo.msg}</span>	
		</div>
		<div id="ad_comment" align=center>
			<table border=0 width=400>
				<tr>
					<td align=right>
						<button id="replyShow">댓글열기</button>
					</td>
				</tr>
			</table>
			<div id="reply">
				<table border=0 width=700 id="table_content">
					<c:forEach var="rDto" items="${list }">
						<tr>
							<td align=left><c:if test="${rDto.group_tab!=0 }">
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
											href="reply_delete.do?no=${rDto.no }&bno=${d.no}&page=${curpage}">삭제</a>
									</c:if>
								</c:if></td>
						</tr>
						<tr id="re_re_write${rDto.no }" style="display: none">
							<td colspan="2"><form method=post
									action="reply_reply_write.do" id="re_re_frm${rDto.no }">
									<span
										style="display: block; float: left; height: 50px; width: 700px;">

										<textarea rows="3" cols="55" name=rmsg id="rmsg${rDto.no }"
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
										style="display: block; float: left; height: 50px; width: 700px;">


										<textarea rows="3" cols="55" name=rmsg id="umsg${rDto.no }"
											style="vertical-align: middle;">${rDto.msg }</textarea> <input
										type="hidden" name="bno" value="${curpage }"> <%--  <input type="hidden" name="page" value="${curpage }"> --%>
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

										<textarea rows="3" cols="55" name=rmsg id=rmsg
											style="vertical-align: middle;"></textarea> <input
										type="hidden" name="bno" value="${curpage }"> <%-- <input type="hidden" name="page" value="${curpage }"> --%>
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
							href="board_content.do?no=${ d.no }&rPage=${rcurpage>1?rcurpage-1:rcurpage }&page=${curpage}"><img
								src="img/prev_icon.gif"></a>&nbsp; <a
							href="board_content.do?no=${ d.no }&rPage=${rcurpage<rtotal?rcurpage+1:rcurpage }&page=${curpage}"><img
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