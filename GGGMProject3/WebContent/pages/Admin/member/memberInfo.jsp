<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- font Awesome -->
<link href="<%=request.getContextPath() %>/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="<%=request.getContextPath() %>/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="<%=request.getContextPath() %>/css/AdminLTE.css"
	rel="stylesheet" type="text/css" />
</head>
<body class="skin-black">
	<div class="row">
		<div class="col-md-offset-1">
			<h1>��&nbsp;�� ȸ�� ����</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-11 col-md-offset-1">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="table-responsive">
					<form action="MemberInfo.do?memberid=${d.id}" method="post">
						<table class="table table-hover">
							<tr>
							<td width="30%" align="right">ȸ�� ID</td>
							<td align="center">${d.id }</td>
							</tr>
							<tr>
							<td width="30%" align="right">ȸ�� �̸�</td>
							<td align="center">${d.name }</td>
							</tr>
							<tr>
							<td width="30%" align="right">����</td>
							<td align="center">${d.sex }</td>
							</tr>
							<tr>
							<td width="30%" align="right">�������</td>
							<td align="center"><fmt:formatDate value="${d.birth }"
												pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
							<td width="30%" align="right">�ּ�</td>
							<td align="center">${d.post }<br>${d.addr1 } ${d.addr2 }</td>
							</tr>
							<tr>
							<td width="30%" align="right">��ȭ��ȣ</td>
							<td align="center">${d.tel }</td>
							</tr>
							<tr>
							<td width="30%" align="right">E-Mail</td>
							<td align="center">${d.email }</td>
							</tr>
							<tr>
							<td width="30%" align="right">ȸ�����</td>
							<td align="center">
							<select name="grade"><c:if test="${d.grade==1 }">
											<option value="1" selected="selected">�Ϲ�ȸ��</option>
											<option value="2">������ȸ��</option>
											<option value="3">������</option>
										</c:if>
										<c:if test="${d.grade==2 }">
											<option value="1">�Ϲ�ȸ��</option>
											<option value="2" selected="selected">������ȸ��</option>
											<option value="3">������</option>
										</c:if>
										<c:if test="${d.grade==3 }">
											<option value="1">�Ϲ�ȸ��</option>
											<option value="2">������ȸ��</option>
											<option value="3" selected="selected">������</option>
										</c:if>
								</select>
								</td>
							</tr>


						</table>
						<div class="row">
							<div class="col-lg-12" style="text-align: center;">
								<input type="submit"
									value="����"> <input type="button" value="���">
							</div>
						</div>
						</form>						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.row -->
</body>
</html>







