<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="pages/board/qna.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#delA').click(function(){
		if(confirm("���� �����Ͻðڽ��ϱ�?")== true)
		{   
		    $('#delForm').submit();
		}else
		{   
		    return;
		}
	});
	var k=0;
	$('.re_re_a').click(function(){
		var no=$(this).attr("name");
		//alert(no);
		if(k==0)
		{
			$('.hide_comment').hide();
			$('#qna_reply_reply_write1'+no).show();
			$('#qna_reply_reply_write'+no).show();
		   k=1;
		}
		else
		{
			$('#qna_reply_reply_write1'+no).hide();
			$('#qna_reply_reply_write'+no).hide();
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
			$('#qna_reply_modify_write1'+no).show();
			$('#qna_reply_modify_write'+no).show();
		   p=1;
		}
		else
		{
			$('#qna_reply_modify_write1'+no).hide();
			$('#qna_reply_modify_write'+no).hide();
			p=0;
		}
	});
});
function re_del()
{
	var depth=$(this).attr("name");
	if(depth==0)
	{
		alert("�Ʒ������ �־� ���� �� �� �����ϴ�");
	}
}
function re_ok(){
	var msg=$('#msg').val();
	
	if(msg=="")
	{
		alert("��۳����� �Է��ϼ���");
		$('#msg').focus();
		return;
	}
	$('#qna_re_write').submit();
}
 function re_re_ok(no){
	var msg=$('#rrmsg'+no).val();
	
	if(msg=="")
	{
		alert("��۴�۳����� �Է��ϼ���");
		$('#rrmsg'+no).focus();
		return;
	}
	$('#qna_re_re_write'+no).submit();
} 
 function re_up_ok(no){
		var msg=$('#umsg'+no).val();
		
		if(msg=="")
		{
			alert("��۴�۳����� �Է��ϼ���");
			$('#umsg'+no).focus();
			return;
		}
		$('#qna_re_update'+no).submit();
}
 // login id setting
 if(typeof document.search != "undefined" && typeof document.search.id != "undefined" && typeof document.search.save_id != "undefined") {
     document.search.id.value = getCookieMS('save_id');
     if(document.search.id.value=="null") document.search.id.value="";
     if(typeof document.search.id != "undefined" && document.search.id.value.length>0) document.search.save_id.checked=true; 
 }
</script>
<style type="text/css">
#bc_commentlist , #bc_write{
    border-collapse : collapse;
}
#bc_commentlist {
    color   : #8C8C8C;
}
#bc_write{
    border-top : 1px #cccccc solid;
    padding-bottom   : 7px;
}
.bc_list {
    border-top : 1px #cccccc solid;
    vertical-align  : top;
}
.bc_commentname {
    padding     : 10px;
    text-align  : left;
    width   : 80px;
    color   : #6c6c6c;
}
.bc_commenttext {
    padding     : 10px;
}
.bc_commentline {
    padding-top : 11px;
    width   : 3px;
}
.bc_commentsetup {
    padding     : 10px;
    text-align  : right;
    font-size   :8pt;
    width   : 75px;
}

.bc_title {
    color  : #555555;
    font-weight : normal;
    text-align : left;
    padding : 3px 0px 3px 0px;
}

.bc_title_name {
    width : 60px;
    padding-left: 10px;
}

#bc_textarea {
    height: 42px;
    border: 1px solid #EEEEEE;
}

#bc_input_writer , #bc_input_passwd {
    border: 1px solid #EEEEEE;
    width   : 110px;
    margin : 0px;
}
#bc_input_writer { margin-right : 10px;}
#bc_input_passwd { margin-left : 20px;}

/* �α��� �� �ڸ�Ʈ �ۼ��ڸ� style */
.bc_writer {
    color   : #6c6c6c;
    padding-right : 20px;
    font-weight : normal;
}
#bc_agree { 
    border-bottom : 1px solid #CCCCCC;
}
td.bc_agree_title { 
    padding : 5px;
}
.privercy_contract {
    padding: 10px;
    width : 750px;
    height : 100px;
    border : 1px solid #CCCCCC;
}
#replyStyle {
    padding-left: 1px;
    padding-top: 20px;
    padding-bottom: 0px;
}
#qnafunction{
	padding-top: 10px;
    padding-bottom: 10px;
}
</style>

</head>
<body>

<!-- ��� -->
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
      <tbody><tr align="center">
       <td height="100" style="padding-left:110"><img src="img/board_1.gif"></td>
        </tr>
      <tr>
        <td></td>
        </tr>
    </tbody></table>
<table width="700" align="center" id="bv_viewdetail">
<tbody><tr>
    <td width=50% class="bv_title bv_subject" height="26">
    <span class="bv_titlesub">�� &nbsp; ��</span> : <strong>${d.subject }</strong>
    <a href="qna_content.jsp&bno=${d.no }&page=${strPage}"></a>
    <td width=50% align=left height="28" class="bv_title bv_subject" style="padding-left: 8px; padding-top:5px;">
    <span class="bv_titlesub">�ۼ���</span> : ${d.name } </td>
</tr>
<tr>
    <td width=50% height="28" class="bv_subject" style="padding-left: 8px; padding-top:5px;">
    <span class="bv_titlesub">��ȸ��</span> : ${d.hit } </td>
     <td width=50% align=left height="28" class="bv_subject" style="padding-left: 8px; padding-top:5px;">
    <span class="bv_titlesub">�ۼ���</span> : <fmt:formatDate value="${d.regdate }" pattern="yyyy-MM-dd"/></td>
    </tr>
<tr>
	
    <td class="bv_subject" colspan="2" height="230" valign="top" style="padding: 13px 8px">${d.content }</td>

</tr>
</tbody>
</table>
<table id="table_content" width="700" align="center" >
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
            <hr>
           </td>
           <td width="30%" align=right id="replyStyle">    
			<c:choose>
			<c:when test="${rDto.msg=='�����ڰ� ������ ����Դϴ�' }">
			<c:if test="${sessionScope.grade==3}">
			 �� <a href="#" class="re_re_a" name="${rDto.no }">���</a>&nbsp;
             �� <a href="#" class="re_up_a" name="${rDto.no }">����</a>&nbsp;
             <a href="qna_reply_delete.do?no=${rDto.no }&bno=${d.no}&page=${strPage}" name="${rDto.depth }" onclick="re_del()">������</a>
             </c:if>
			</c:when>
			<c:otherwise>
            <c:if test="${sessionScope.id!=null }">
             �� <a href="#" class="re_re_a" name="${rDto.no }">���</a>&nbsp;
             <c:if test="${sessionScope.id==rDto.id || sessionScope.grade==3 }">
             �� <a href="#" class="re_up_a" name="${rDto.no }">����</a>&nbsp;
             �� <a href="qna_reply_delete.do?no=${rDto.no }&bno=${d.no}&page=${strPage}" name="${rDto.depth }" onclick="re_del()">����</a>
             </c:if>
            </c:if>
            </c:otherwise>
            </c:choose>
       		 <hr>
           </td>
       
          </tr>
<!-- ��� ��� -->
<tr id="qna_reply_reply_write1${rDto.no }" style="display:none" class="hide_comment">
    <td class="bc_title bc_title_name"><img src="img/qna_dot_black.gif"> ID </td>
    <td>
        <input id="bc_input_writer" type="text" name="id" size="10" value="${sessionScope.id }">
        <img src="img/qna_dot_black.gif"> name
        <input id="bc_input_name" type="text" name="name" size="12" value="${sessionScope.name }">
    </td>
</tr>
<tr style="display:none" class="hide_comment" id="qna_reply_reply_write${rDto.no }">
    <td class="bc_title_name"></td>
    <td style="padding-bottom: 20px;, padding-top: 10px;">
    	<form id="qna_re_re_write${rDto.no }" action="qna_reply_reply_write.do" method="post">
        <textarea id="rrmsg${rDto.no }" name="rrmsg" rows="3" style="width:510px"></textarea>
    </td>
    <td>
     	<input type=hidden name="no" value="${rDto.no }">
        <input type=hidden name="bno" value="${d.no }">
        <input type=hidden name="page" value="${strPage }">
        <a href="#" onclick="re_re_ok(${rDto.no })">
        <img src="img/button_comment.gif" style="vertical-align:middle;" border="0"></a>
		</form>        
    </td>
</tr>
<tr id="qna_reply_modify_write1${rDto.no }" style="display:none" class="hide_comment">
    <td class="bc_title bc_title_name"><img src="img/qna_dot_black.gif"> ID </td>
    <td>
        <input id="bc_input_writer" type="text" name="id" size="10" value="${sessionScope.id }">
        <img src="img/qna_dot_black.gif"> name
        <input id="bc_input_name" type="text" name="name" size="12" value="${sessionScope.name }">
    </td>
    <td></td>
</tr>
<!--  ��� ���� -->
<tr style="display:none" class="hide_comment" id="qna_reply_modify_write${rDto.no }">
    <td class="bc_title_name"></td>
   <td style="padding-bottom: 20px;, padding-top: 10px;">
    	<form id="qna_re_update${rDto.no }" action="qna_reply_modify.do" method="post">
        <textarea id="umsg${rDto.no }" name="umsg" rows="3" style="width:510px">${rDto.msg }</textarea>
    </td>
    <td>
    	<input type=hidden name="no" value="${rDto.no }">
        <input type=hidden name="bno" value="${d.no }">
        <input type=hidden name="page" value="${strPage }">
        <a href="#" onclick="re_up_ok(${rDto.no })">
        <img src="img/button_comment.gif" style="vertical-align:middle;" border="0"></a>
		</form>        
    </td>
</tr>

</c:forEach>  
</table>
<table width="700" align="center" id="bv_viewdetail">
<tr>
    <td class="bc_title bc_title_name"><img src="img/qna_dot_black.gif"> ID</td>
    <td class="bc_title">
        <input id="bc_input_writer" type="text" name="id" size="10" value="${sessionScope.id }">
        <img src="img/qna_dot_black.gif"> name
        <input id="bc_input_name" type="text" name="name" size="12" value="${sessionScope.name }">
   
    </td>
</tr>
<tr>
    <td class="bc_title_name"></td>
    <td style="padding-bottom: 20px;, padding-top: 10px;">
    	<form id="qna_re_write" action="qna_reply_write.do" method="post">
        <textarea id="msg" name="msg" rows="3" style="width:510px"></textarea>
        <input type=hidden name="bno" value="${d.no }">
        <input type=hidden name="page" value="${strPage }">
        <a href="#" onclick="re_ok()">
        <img src="img/button_comment.gif" style="vertical-align:middle;" border="0"></a>
		</form>      
    </td>
</tr>
</table>
<table width="700" border="0" align="center" style="margin-top: 10px;">
			<tr>
		    	<td id="bl_pages">
					<span class="bl_curpage bl_pagetext">
					${rcurpage } page / ${rtotal} pages
					</span>
			    </td>

	    		<td id="bl_linkbutton">
					<a href="qna_reply_content.do?no=${ d.no }&rPage=${rcurpage>1?rcurpage-1:rcurpage }&page=${strPage}">����</a>&nbsp;&nbsp;&nbsp;
					<a href="qna_reply_content.do?no=${ d.no }&rPage=${rcurpage<rtotal?rcurpage+1:rcurpage }&page=${strPage}">����</a>&nbsp;&nbsp;
	    		</td>
			</tr>
</table>
<table width="700" align="center">
<tr>
    <td align="right" id="qnafunction">
        <a href="qna_delete.do?no=${d.no }&page=${strPage }" id="delA">
        <img src="img/qna_delete.gif" border="0"></a>    
        <a href="qna_modify.do?no=${d.no }&page=${strPage }">
        <img src="img/qna_modify.gif" border="0"></a>
        <a href="qna_list.do?page=${strPage }">
        <img src="img/detail_list.gif" border="0"></a>   
    </td>
</tr>
</table>
<br>
<script type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript">
var selectedobj;
var dragapproved = false;
var zindex = 100;
function drag_move() {
	if(dragapproved) {
		selectedobj.style.left = base_x + event.clientX - previous_x;
		selectedobj.style.top  = base_y + event.clientY - previous_y;
		return false;
	}
}

function start_drag(drag_id) {
	selectedobj = document.getElementById(drag_id);
	selectedobj.style.zIndex = zindex++;
        if(document.body && document.body.setCapture) {
           // body ȭ�� ����(IE����) 
           document.body.setCapture();
        }
	base_x = parseInt(selectedobj.style.left);
	base_y = parseInt(selectedobj.style.top);
	previous_x = event.clientX;
	previous_y = event.clientY;
	dragapproved = true;
}

function drag_release() {
	dragapproved=false;
        if (document.body && document.body.releaseCapture) {
          // bodyȭ�� ����Ǯ��(IE����)
          document.body.releaseCapture();
        }
}
document.onmousemove = drag_move;
document.onmouseup = drag_release;
</script>


<script type="text/javascript">
    function nhn_anchor(pid) {
        
        
    }
</script>
</body>
</html>
