<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminLTE | Dashboard</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- bootstrap 3.0.2 -->
<link href="../../../css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- font Awesome -->
<link href="../../../css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<!-- Ionicons -->
<link href="../../../css/ionicons.min.css" rel="stylesheet"
	type="text/css" />
<!-- Theme style -->
<link href="../../../css/AdminLTE.css" rel="stylesheet" type="text/css" />
</head>
<body class="skin-black">
	<div class="row">
		<div class="col-md-offset-1">
			<h3>��&nbsp;�Խñ� ����</h3>
			<ol class="breadcrumb">
				<li><a href="#">��������</a></li>
				<li><a href="adminfaqboard.do">FAQ</a></li>
				<li><a href="#">QnA</a></li>
				<li><a href="adboard.do">����</a></li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-11 col-md-offset-1">

			<div class="panel panel-default">
				<div class="panel-body">
					<div class="table-responsive">
						��������
						<table class="table table-bordered">
							<thead>
								<tr>
									<th><input type="checkbox"></th>
									<th>ȸ����ȣ</th>
									<th>ȸ������</th>
									<th>ȸ��ID</th>
									<th>�̸�</th>
									<th>������</th>
									<th>�ֱ�������</th>
									<th>����IP</th>
									<th>Point</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td>1</td>
									<td>�Ϲ�</td>
									<td>hong</td>
									<td>ȫ�浿</td>
									<td>2015-10-17</td>
									<td>2015-10-17</td>
									<td>211.238.142.27</td>
									<td>0</td>
								</tr>
								<tr>
									<td colspan="9" align="right"><a href="#">More</a></td>
								</tr>
							</tbody>
						</table>
						FAQ
						<table class="table table-bordered">
							<thead>
								<tr>
									<th width="20%" align="center">��ȣ</th>
									<th width="80%">����</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="d" items="${faq}">
									<tr>
										<td width="20%" align="center">${d.no }</td>
										<td width="80%">${d.subject }</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="9" align="right"><a href="adminfaqboard.do">More</a></td>
								</tr>
							</tbody>
						</table>
						QnA
						<table class="table table-bordered">
							<thead>
								<tr>
									<th><input type="checkbox"></th>
									<th>ȸ����ȣ</th>
									<th>ȸ������</th>
									<th>ȸ��ID</th>
									<th>�̸�</th>
									<th>������</th>
									<th>�ֱ�������</th>
									<th>����IP</th>
									<th>Point</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td>1</td>
									<td>�Ϲ�</td>
									<td>hong</td>
									<td>ȫ�浿</td>
									<td>2015-10-17</td>
									<td>2015-10-17</td>
									<td>211.238.142.27</td>
									<td>0</td>
								</tr>
								<tr>
									<td colspan="9" align="right"><a href="#">More</a></td>
								</tr>
							</tbody>
						</table>
						����
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th width="10%" style="text-align: center;">��з�</th>
									<th width="10%" style="text-align: center;">�Һз�</th>
									<th width="10%" style="text-align: center;">��ȣ</th>
									<th width="60%" style="text-align: center;">��������</th>
									<th width="10%" style="text-align: center;">�����ָ�</th>

								</tr>
								<c:forEach var="ad" items="${ad}">
									<tr>
										<td width="10%" style="text-align: center;">${ad.maj_category }</td>
										<td width="10%" style="text-align: center;">${ad.sub_category }</td>
										<td width="10%" style="text-align: center;">${ad.adno }</td>
										<td width="60%" style="text-align: center;">${ad.adsubject }</td>
										<td width="10%" style="text-align: center;">${ad.adid }</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="9" align="right"><a href="adboard.do">More</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>