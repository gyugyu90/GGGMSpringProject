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
			<h3>※&nbsp;게시글 관리</h3>
			<ol class="breadcrumb">
				<li><a href="adminnotice.do">공지사항</a></li>
				<li><a href="adminfaqboard.do">FAQ</a></li>
				<li><a href="adminqnaboard.do">QnA</a></li>
				<li><a href="adboard.do">광고</a></li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-11 col-md-offset-1">

			<div class="panel panel-default">
				<div class="panel-body">
					<div class="table-responsive">
						공지사항
						<table class="table table-bordered">
							<thead>
								<tr>
									<td width="10%" align="center">NO</td>
									<td width="70%" align="left">SUBJECT</td>
									<td width="10%" align="center">DATE</td>
									<td width="10%" align="center">HIT</td>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="n" items="${notice }">
								<tr>
									<td width="10%" align="center">${n.no }</td>
									<td width="70%" align="left">${n.subject }</td>
									<td width="10%" align="center">${n.dbday }</td>
									<td width="10%" align="center">${n.hit }</td>
								</tr>
								</c:forEach>
								<tr>
									<td colspan="9" align="right"><a href="adminnotice.do">More</a></td>
								</tr>
							</tbody>
						</table>
						FAQ
						<table class="table table-bordered">
							<thead>
								<tr>
									<th width="20%" align="center">번호</th>
									<th width="80%">제목</th>
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
									<td width="10%" align="center">NO</td>
									<td width="70%" align="left">SUBJECT</td>
									<td width="10%" align="center">DATE</td>
									<td width="10%" align="center">HIT</td>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="qna" items="${qna}">
								<tr>
									<td width="10%" align="center">${qna.no }</td>
									<td width="70%" align="left">${qna.subject }</td>
									<td width="10%" align="center">${qna.dbday }</td>
									<td width="10%" align="center">${qna.hit }</td>
								</tr>
								</c:forEach>
								<tr>
									<td colspan="9" align="right"><a href="adminqnaboard.do">More</a></td>
								</tr>
							</tbody>
						</table>
						광고
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th width="10%" style="text-align: center;">대분류</th>
									<th width="10%" style="text-align: center;">소분류</th>
									<th width="10%" style="text-align: center;">번호</th>
									<th width="60%" style="text-align: center;">광고제목</th>
									<th width="10%" style="text-align: center;">광고주명</th>

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