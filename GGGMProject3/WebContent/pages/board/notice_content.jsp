<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<!-- <link rel="stylesheet" type="text/css" href="./css/shadowbox.css"/> -->
<!-- <script type="text/javascript" src="./js/shadowbox.js"></script> -->
<!-- <script type="text/javascript"> -->
<!-- Shadowbox.init({ -->
<!--    players:["iframe"]		 -->
<!-- }); -->

<!-- function dblchk_del() -->
<!-- { -->
<!-- 	Shadowbox.open({ -->
<!-- 		content:'dblchk_del.jsp', -->
<!-- 		player:'iframe', -->
<!-- 		title:'���̵� �ߺ�üũ', -->
<!-- 		width:300, -->
<!-- 		height:150 -->
<!-- 	}); -->
<!-- } -->
<!-- </script> -->

<script type="text/javascript">
var i=0;
$(function(){
	var j=0;
	$('#replyShow').click(function(){
		if(j==0)
		{
			$('#reply').show();
			$('#replyShow').text("��۴ݱ�");
			j=1;
		}
		else
		{
			$('#reply').hide();
			$('#replyShow').text("��ۿ���");
			j=0;
		}
	});
	$('#reWriteBtn').click(function(){
		var msg=$('#rmsg').val();
		if(msg=="")
		{
			alert("��۳����� �Է��ϼ���");
			$('#rmsg').focus();
			return;
		}
		$('#new_re_write').submit();
	});
	// ���=>���
	var k=0;
	$('.re_re_a').click(function(){
		var no=$(this).attr("name");
		//alert(no);
		if(k==0)
		{
			$('.togl_intrfc').hide();
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
			$('.togl_intrfc').hide();
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
		alert("��� ������ �Է��ϼ���");
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
		alert("��� ������ �Է��ϼ���");
		$('#umsg'+no).focus();
		return;
	}
	$('#re_update_frm'+no).submit();
}
</script>


</head>

<body>
	<table width="700" align="center" id="bv_viewdetail">
		<tr>
			<td width=50% align=left height="28" class="bv_title bv_subject" style="padding-left: 8px; padding-top: 5px;">
				<span class="bv_titlesub">��ȣ</span> : ${dto.no }
			</td>
						
			<td width=50% class="bv_title bv_subject" height="26">
			<span class="bv_titlesub">�� &nbsp; ��</span>
			 : <strong>${dto.subject }</strong>
			</td>
			
		</tr>
		
		<tr>
			<td width=50% height="28" class="bv_subject" style="padding-left: 8px; padding-top: 5px;">
			<span class="bv_titlesub">��ȸ��</span>
			 : ${dto.hit }
			</td>
			
			<td width=50% align=left height="28" class="bv_subject" style="padding-left: 8px; padding-top: 5px;">
			<span class="bv_titlesub">�ۼ���</span> : ${dto.regdate }
			</td>
		</tr>
		
		<tr>
			<td colspan=2 class="bv_subject" height="230" valign="top" style="padding: 13px 8px">${dto.content }</td>
		</tr>
	</table>
	<!-- �̵��޴�  -->
	<table width="700" border="0" align="center" id="bv_viewdetail">
		<tr>
    		<td id="bl_linkbutton" align=right>
    			<a href="notice_write.do">�۾���</a>&nbsp;&nbsp;&nbsp;
    			<a href="notice_modify.do?no=${dto.no}">����</a>&nbsp;&nbsp;&nbsp;
    			<a href="notice_delete.do?no=${dto.no}">����</a>&nbsp;&nbsp;&nbsp;
    			<a href="notice.do?page=${curpage }">���</a>
    		</td>
		</tr>
	</table>
	<hr width="650" align="center">
	
	<!-- ��� �κ� ���� -->
	<table width="700" border="0" align="center" >
		<tr>
        	<td align=right>
         		<a href="#" id="replyShow">��ۿ���</a>
        	</td>
       </tr>
	</table>
	
	
	<div id="reply" align=center>
		<table id="table_content">
			<c:forEach var="rDto" items="${rlist }">
				<tr><!-- �޽����� �Ʒ��ʿ� �߰��ϵ� tab��ŭ �鿩���ش�. -->
					<td align="left">
						<c:if test="${rDto.group_tab!=0 }">
							<c:forEach var="i" begin="1" end="${rDto.group_tab }">
								&nbsp;&nbsp;
							</c:forEach>
								<sup><span style="font-family:sans-serif;font-size: 5px; "></span></sup>
						</c:if>
						<font color=blue>${rDto.name }</font>
						(${rDto.bdday })
						<br>
						
						<c:forEach var="i" begin="1" end="${rDto.group_tab }">
							&nbsp;&nbsp;
						</c:forEach>
						${rDto.msg }
					</td>
					
					<td align=right>
<%-- 						<c:if test="${sessionScope.id!=null }"><!-- �α��� ���� ������ �������� �� �Ѿ�� ��� �ʿ���� �� --> --%>
							<a href="#0" class="re_re_a" name="${rDto.no }"><li>���</li></a>&nbsp;
							
<%-- 							<c:if test="${sessionScope.id==rDto.id }"> --%>
								<a href="#0" class="re_up_a" name="${rDto.no }"><li>����</li></a>&nbsp;
								<a href="reply_delete.do?no=${rDto.no}&bno=${dto.no}&page=${curpage}"><li>����</li></a>
<%-- 							</c:if> --%>
							
<%-- 						</c:if> --%>
					</td>
				</tr>
				
				<!-- ���� ��� �ڽ��� ��Ÿ���� �κ� -->
				<tr id="re_re_write${rDto.no }" style="display:none" class="togl_intrfc">
					<td colspan="2">
					<span style="display: block;float: left;height: 50px">
           				<form method=post action="reply_reply_write.do" id="re_re_frm${rDto.no }">
            				<textarea rows="3" cols="55" name=rmsg id="rmsg${rDto.no }" style="vertical-align: middle;"></textarea>
            				<input type="hidden" name="bno" value="${dto.no }">
            				<input type="hidden" name="page" value="${curpage }">
				            <input type="hidden" name="no" value="${rDto.no }">
				            <input type="button" value="���" style="height: 50px" onclick="reReplyBtn(${rDto.no})">
						</form>
					</span>
				   	</td>
				</tr>
				
				<tr id="re_re_update${rDto.no }" style="display:none"  class="togl_intrfc">
					<td colspan="2">
					<span style="display: block;float: left;height: 50px">
						<form method=post action="reply_reply_update.do" id="re_update_frm${rDto.no }">
				            <textarea rows="3" cols="55" name=rmsg id="umsg${rDto.no }" style="vertical-align: middle;">${rDto.msg }</textarea>
				            <input type="hidden" name="bno" value="${dto.no }">
				            <input type="hidden" name="page" value="${curpage }">
				            <input type="hidden" name="no" value="${rDto.no }">
				            <input type="button" value="����" style="height: 50px" onclick="reUpdateBtn(${rDto.no})">
			           	</form>
	          		</span>
		       		</td>
		        </tr>
			</c:forEach>

	        <c:if test="${sessionScope.id!=null }">
		        <tr>
					<td colspan="2">
		          		<span style="display: block;float: left;height: 50px" >
		           		<form method=post action="reply_new_write.do" id="new_re_write">
			            	<textarea rows="3" cols="55" name=rmsg id=rmsg style="vertical-align: middle;"></textarea>
			            	<input type="hidden" name="bno" value="${dto.no }">
			            	<input type="hidden" name="page" value="${curpage }">
			            	<input type="button" value="���" style="height: 50px" id="reWriteBtn">
		           		</form>
		          		</span>
	         		</td>
	        	</tr>
	        </c:if>
		</table>
		
		<hr width="650" align="center">
		
		<table width="700" border="0" align="center">
			<tr>
		    	<td id="bl_pages">
					<span class="bl_curpage bl_pagetext">
						${rcurpage } page / ${rtotal} pages
					</span>
			    </td>

	    		<td id="bl_linkbutton">
					<a href="notice_content.do?no=${ dto.no }&rPage=${rcurpage>1?rcurpage-1:rcurpage }&page=${curpage}">����</a>&nbsp;&nbsp;&nbsp;
					<a href="notice_content.do?no=${ dto.no }&rPage=${rcurpage<rtotal?rcurpage+1:rcurpage }&page=${curpage}">����</a>&nbsp;&nbsp;
	    		</td>
			</tr>
		</table>
	</div>
	
</body>
</html>