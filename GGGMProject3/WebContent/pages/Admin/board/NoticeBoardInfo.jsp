<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/faq/qna.css"/>
<link rel="stylesheet" type="text/css" href="./css/faq/reply.css"/>
<link rel="stylesheet" type="text/css" href="./css/faq/table.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="./js/faq/reply.js"></script>
<script type="text/javascript">
 var i=0;
$(function(){
	var k=0;
	$('.re_re_a').click(function(){
		var no=$(this).attr("name");
		//alert(no);
		if(k==0)
		{
			$('.hide_comment').hide();
			$('#notice_reply_reply_write1'+no).show();
			$('#notice_reply_reply_write'+no).show();
		   k=1;
		}
		else
		{
			$('#notice_reply_reply_write1'+no).hide();
			$('#notice_reply_reply_write'+no).hide();
			k=0;
		}
	});
	var p=0;
	$('.re_up_a').click(function(){
		var no=$(this).attr("name");
		//alert(no);
		if(p==0)
		{
			$('.hide_comment').hide();
			$('#notice_reply_modify_write1'+no).show();
			$('#notice_reply_modify_write'+no).show();
		   p=1;
		}
		else
		{
			$('#notice_reply_modify_write1'+no).hide();
			$('#notice_reply_modify_write'+no).hide();
			p=0;
		}
	});
});

function reply_del(no){
		alert("아랫댓글까지는 삭제가 되지 않습니다");
} 
function reply_del1(no){
	
		alert("아랫댓글이 있어 삭제 할 수 없습니다");
} 
function re_ok(){
	var msg=$('#msg').val();
	
	if(msg=="")
	{
		alert("댓글내용을 입력하세요");
		$('#msg').focus();
		return;
	}
	$('#notice_re_write').submit();
}
 function re_re_ok(no){
	var msg=$('#rrmsg'+no).val();
	
	if(msg=="")
	{
		alert("댓글댓글내용을 입력하세요");
		$('#rrmsg'+no).focus();
		return;
	}
	$('#notice_re_re_write'+no).submit();
} 
 function re_up_ok(no){
		var msg=$('#umsg'+no).val();
		
		if(msg=="")
		{
			alert("댓글댓글내용을 입력하세요");
			$('#umsg'+no).focus();
			return;
		}
		$('#notice_re_update'+no).submit();
}
</script>


</head>

<body>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr align="center">
       <td height="100" style="padding-left:110"><img src="img/notice.gif"></td>
      </tr>
</table>
	<table width="700" align="center" id="bv_viewdetail">
		<tr>
			<td width=50% align=left height="28" class="bv_title bv_subject" style="padding-left: 8px; padding-top: 5px;">
				<span class="bv_titlesub">번호</span> : ${dto.no }
			</td>
						
			<td width=50% class="bv_title bv_subject" height="26">
			<span class="bv_titlesub">제 &nbsp; 목</span>
			 : <strong>${dto.subject }</strong>
			</td>
			
		</tr>
		
		<tr>
			<td width=50% height="28" class="bv_subject" style="padding-left: 8px; padding-top: 5px;">
			<span class="bv_titlesub">조회수</span>
			 : ${dto.hit }
			</td>
			
			<td width=50% align=left height="28" class="bv_subject" style="padding-left: 8px; padding-top: 5px;">
			<span class="bv_titlesub">작성일</span> : <fmt:formatDate value="${dto.regdate }" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		
		<tr>
			<td colspan=2 class="bv_subject" height="230" valign="top" style="padding: 13px 8px">${dto.content }</td>
		</tr>
	</table>
	<!-- 이동메뉴  -->
	<table width="700" border="0" align="center" id="bv_viewdetail">
		<tr>
    		<td id="bl_linkbutton" align=right>
    		 <c:if test="${sessionScope.grade==3 }">
    			<a href="notice_modify.do?no=${dto.no}">수정</a>&nbsp;&nbsp;&nbsp;
    			<a href="notice_delete.do?no=${dto.no}">삭제</a>&nbsp;&nbsp;&nbsp;
    		</c:if>
    			<a href="notice.do?page=${curpage }">목록</a>
    		</td>
		</tr>
	</table>
<!-- 	<hr width="650" align="center"> -->
	
	<!-- 댓글 부분 시작 -->
	<!-- <table width="700" border="0" align="center" >
		<tr>
        	<td align=right>
         		<a href="#" id="replyShow">댓글열기</a>
        	</td>
       </tr>
	</table> -->
	
<!-- <div id="reply" align=center> -->
<c:if test="${rDto.replyCount!=0 }">
<table  width="700" align="center" height="100">
        <c:forEach var="rDto" items="${rlist }">
          <tr>
           <td width="70%" colspan="2" align=left>
            <c:if test="${rDto.group_tab!=0 }">
              <c:forEach var="i" begin="1" end="${rDto.group_tab }">
               &nbsp;&nbsp;
              </c:forEach>
              <img src="img/qna_reply.gif">
            </c:if>
            <img src="img/qna_dot_black.gif">&nbsp;&nbsp;${rDto.name }
            (${rDto.dbday })
            <br>
            <c:if test="${rDto.group_tab!=0 }">
              <c:forEach var="i" begin="1" end="${rDto.group_tab }">
               &nbsp;&nbsp;
              </c:forEach>
            </c:if>
            ${rDto.msg }
           </td>
           <td width="30%" align=right>    
			<c:choose>
			<c:when test="${rDto.msg=='관리자가 삭제한 댓글입니다' }">
			<c:if test="${sessionScope.grade==3}">
			 └ <a href="#" class="re_re_a" name="${rDto.no }">댓글</a>&nbsp;
        	 └ <a href="#" class="re_up_a" name="${rDto.no }">수정</a>&nbsp;
             <c:choose>
              <c:when test="${rDto.depth!=0 }">
             	<a href="notice_reply_delete.do?no=${rDto.no }&bno=${dto.no}&page=${curpage}" name="${rDto.depth }" onclick="reply_del1(${rDto.no})">└삭제</a>
             </c:when>
             <c:otherwise>
             	<a href="notice_reply_delete.do?no=${rDto.no }&bno=${dto.no}&page=${curpage}" >└삭제</a>
             </c:otherwise>
             </c:choose>
             </c:if>
			</c:when>
			<c:otherwise>
			 └ <a href="#" class="re_re_a" name="${rDto.no }">댓글</a>&nbsp;
             <c:if test="${sessionScope.id==rDto.id || sessionScope.grade==3 }">
             └ <a href="#" class="re_up_a" name="${rDto.no }">수정</a>&nbsp;
              <c:choose>
              <c:when test="${rDto.depth!=0 }">
              <c:if  test="${sessionScope.id!=rDto.id && sessionScope.grade==3}">
             	<a href="notice_reply_delete.do?no=${rDto.no }&bno=${dto.no}&page=${curpage}" name="${rDto.depth }" onclick="reply_del(${rDto.no})">└삭제</a>
             </c:if>
             <c:if  test="${sessionScope.id==rDto.id && sessionScope.grade==3}">
             	<a href="notice_reply_delete.do?no=${rDto.no }&bno=${dto.no}&page=${curpage}" name="${rDto.depth }" onclick="reply_del(${rDto.no})">└삭제</a>
             </c:if>
             <c:if test="${sessionScope.id==rDto.id && sessionScope.grade!=3}">
             <a href="notice_reply_delete.do?no=${rDto.no }&bno=${dto.no}&page=${curpage}" name="${rDto.depth }" onclick="reply_del1(${rDto.no})">└삭제</a>
             </c:if>
             </c:when>
             <c:otherwise>
             	<a href="notice_reply_delete.do?no=${rDto.no }&bno=${dto.no}&page=${curpage}" >└삭제</a>
             </c:otherwise>
             </c:choose>
             </c:if>
            </c:otherwise>
            </c:choose>
           </td>
          </tr>
<!-- 댓글 댓글 -->
<tr id="notice_reply_reply_write1${rDto.no }" style="display:none" class="hide_comment">
    <td class="bc_title bc_title_name"><img src="img/qna_dot_black.gif">ID </td>
    <td>
        <input id="bc_input_writer" type="text" name="id" size="10" value="${sessionScope.id }">
        <img src="img/qna_dot_black.gif"> name
        <input id="bc_input_name" type="text" name="name" size="12" value="${sessionScope.name }">
    </td>
</tr>
<tr style="display:none" class="hide_comment" id="notice_reply_reply_write${rDto.no }">
    <td class="bc_title_name"></td>
    <td>
    <form id="notice_re_re_write${rDto.no }" action="notice_reply_reply_write.do" method="post">
        <textarea id="rrmsg${rDto.no }" name="rrmsg" rows="3" style="width:510px"></textarea>
    </td>
    <td>
     	<input type="hidden" name="no" value="${rDto.no }">
        <input type="hidden" name="bno" value="${dto.no }">
        <input type="hidden" name="page" value="${curpage }">
      	 <a href="#" onclick="re_re_ok(${rDto.no })">
        <img src="img/button_comment.gif" style="vertical-align:top;" border="0"></a>
		</form>        
    </td>
</tr>
<tr id="notice_reply_modify_write1${rDto.no }" style="display:none" class="hide_comment">
    <td class="bc_title bc_title_name"><img src="img/qna_dot_black.gif">ID </td>
    <td>
        <input id="bc_input_writer" type="text" name="id" size="10" value="${sessionScope.id }">
        <img src="img/qna_dot_black.gif"> name
        <input id="bc_input_name" type="text" name="name" size="12" value="${sessionScope.name }">
    </td>
    <td></td>
</tr>
<!--  댓글 수정 -->
<tr style="display:none" class="hide_comment" id="notice_reply_modify_write${rDto.no }">
    <td class="bc_title_name"></td>
    <td>
    	<form id="notice_re_update${rDto.no }" action="notice_reply_modify.do" method="post">
        <textarea id="umsg${rDto.no }" name="umsg" rows="3" style="width:510px">${rDto.msg }</textarea>
    </td>
    <td>
    	<input type=hidden name="no" value="${rDto.no }">
        <input type=hidden name="bno" value="${dto.no }">
        <input type=hidden name="page" value="${curpage }">
        <a href="#" onclick="re_up_ok(${rDto.no })">
        <img src="img/button_comment.gif" style="vertical-align:top;" border="0"></a>
		</form>        
    </td>
</tr>

</c:forEach>  
</table>
</c:if>
<table  width="700" align="center" id="bv_viewdetail">
<tr>
    <td class="bc_title bc_title_name"><img src="img/qna_dot_black.gif">ID</td>
    <td class="bc_title">
        <input id="bc_input_writer" type="text" name="id" size="10" value="${sessionScope.id }">
        <img src="img/qna_dot_black.gif"> name
        <input id="bc_input_name" type="text" name="name" size="12" value="${sessionScope.name }">
   
    </td>
</tr>
<tr>
    <td class="bc_title_name"></td>
    <td>
    	<form id="notice_re_write" action="notice_reply_write.do" method="post">
        <textarea id="msg" name="msg" rows="3" style="width:510px"></textarea>
        <input type=hidden name="bno" value="${dto.no }">
        <input type=hidden name="page" value="${curpage }">
        <a href="#" onclick="re_ok()">
        <img src="img/button_comment.gif" style="vertical-align:top;" border="0"></a>
		</form>        
    </td>
</tr>
</table>
		<table width="700" border="0" align="center">
			<tr>
		    	<td id="bl_pages">
					<span class="bl_curpage bl_pagetext">
						${rcurpage } page / ${rtotal} pages
					</span>
			    </td>

	    		<td id="bl_linkbutton">
					<a href="adminnoticeinfo.do?no=${ dto.no }&rPage=${rcurpage>1?rcurpage-1:rcurpage }&page=${curpage}">이전</a>&nbsp;&nbsp;&nbsp;
					<a href="adminnoticeinfo.do?no=${ dto.no }&rPage=${rcurpage<rtotal?rcurpage+1:rcurpage }&page=${curpage}">다음</a>&nbsp;&nbsp;
	    		</td>
			</tr>
		</table>
<!-- 	</div> -->
	
</body>
</html>