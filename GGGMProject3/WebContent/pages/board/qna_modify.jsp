<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="pages/board/qna.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	/* $('#username').focus(); */
	$('#btnSub').click(function(){
		if(document.form1.id.value=="")
		{
			alert("���̵� �Է��ϼ���");
			document.form1.id.focus();
			return;
		}
		if(document.form1.pwd.value=="")
		{
			alert("��й�ȣ�� �Է��ϼ���");
			document.form1.pwd.focus();
			return;
		}
		if(document.form1.subject.value=="")
		{
			alert("���Ӹ��� �Է��ϼ���");
			return;
		}
		if (document.form1.content.value.length==0) 
		{
		      alert('������ �Է��ϼ���.');document.form1.content.focus();
		      return;
		}
		$('#writeForm').submit();
	});
});
</script>
</head>
<body>
	<form id="writeForm" name="form1" action="qna_modify_ok.do" method="post">
		<div id="passimg" name="passimg"
			style="position: absolute; visibility: hidden;"></div>
		<input type="hidden" name="attach1" value="">

		<table width="1078" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr>
					<td align="center" height=100><img src="img/board_1.gif"></td>
				</tr>
				<tr>
					<td><table width="700" border="0" align="center"
							cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td><table width="700" border="0" align="center"
											cellpadding="0" cellspacing="0" class="bw_border_bottom"
											id="bw_table">
											<tbody>
												<tr>
													<td width="100" align="center" class="bw_title_color">���̵�</td>
													<td><input id="bw_input_writer" type="text" name="name"
														size="10" value="${d.name }"> &nbsp;&nbsp;&nbsp; <span
														class="bw_title_color">��й�ȣ&nbsp; </span><input
														id="bw_input_passwd" name="pwd" type="password" size="10" value="${d.pwd }">
														 <input type=hidden size=15 name=no value=${no }>
           												 <input type=hidden size=15 name=page value=${page }>
														
												    </td>
												</tr>
												<tr>
													<td width="100" align="center" class="bw_title_color">��&nbsp;&nbsp;��</td>
													<td class="bw_title_color"><span
														style="font-family: '����ü'";=""> <select
															name="subject" value="">
																<option value="">������ �����ϼ���</option>
																<option value="ȸ������">ȸ������</option>
																<option value="������">������</option>
																<option value="����Ʈȯ��">����Ʈȯ��</option>
																<option value="��ǰ����">��ǰ����</option>
																<option value="��Ÿ����">��Ÿ����</option>
														</select>&nbsp;
													</span></td>
												</tr>
												<tr>
													<td width="100" align="center"
														class="bw_title_color bw_border_top bw_contentscolor">����</td>
													<td class="bw_value bw_border_top bw_contentscolor">
													<textarea id="bw_contents" name="content" cols="67" rows="15"
															wrap="on" onfocus="clear_content()"
															style="font-family: ����ü; width: 100%;">${d.content }</textarea>
											     	</td>
												</tr>


											</tbody>
										</table></td>
								</tr>
								<tr>
									<td><table width="700" border="0" align="center"
											cellpadding="0" cellspacing="0">
											<tbody>
												<tr>
													<td>
														<div id="bw_button">

															
															<img src="img/detail_ok.gif" id="btnSub" alt="�Է�" border="0">
															<a href="javascript:history.back()"><img src="img/detail_cancel.gif" alt="���" border="0"></a>
			
														</div>
													</td>
												</tr>
											</tbody>
										</table></td>
								</tr>
							</tbody>
						</table></td>
				</tr>
				<tr>
					<td height="150">&nbsp;</td>
				</tr>

			</tbody>
		</table>
	</form>
</body>
</html>