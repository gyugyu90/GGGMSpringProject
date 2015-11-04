<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/faq/qna.css"/>
<!-- <link rel="stylesheet" type="text/css" href="../../css/faq/qna.css" /> -->

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#bw_subject').focus();
	$('#btnSub').click(function(){
		var subj=$('#bw_subject').val();
		if(subj==""){
			$('#subjectSpan').text("제목입력");
			$('#bw_subject').focus();
			return;
		}
		$('#subjectSpan').text("");
		
		var cont=$('#bw_contents').val();
		if(cont==""){
			$('#contentSpan').text("내용입력");
			$('#bw_contents').focus();
			return;
		}
		$('#contentSpan').text("");
		
		$('#writeForm').submit();
	});
});
</script>


</head>

<body>
	<form id="writeForm" name="write_form" action="notice_write_ok.do" method=post>
	<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="bw_border_bottom" id="bw_table">
					<tr>
						<td width="100" align="center" class="bw_title_color">제&nbsp;&nbsp;목<br>
							<span style="text-align:center;color:red;" id="subjectSpan"></span>
						</td>
						
						<td>
							<input  type="text" name="subject" id="bw_subject" size= 50> &nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td width="100" align="center" class="bw_title_color bw_border_top bw_contentscolor">내&nbsp;&nbsp;용<br>
							<span style="text-align:center; color:red;" id="contentSpan"></span>
						</td>
						<td class="bw_value bw_border_top bw_contentscolor">
							<textarea id="bw_contents" name="content" cols="67" rows="15" wrap="on" onfocus="clear_content()" style="font-family: 굴림체; width: 100%;">
							</textarea>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td>
							<div id="bw_button">
								<input type=button id="btnSub" value=글쓰기>
    							<input type=button id="btnCancel" value=취소 onclick="javascript:history.back()">
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>