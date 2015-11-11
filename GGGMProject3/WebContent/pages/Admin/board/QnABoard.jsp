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
<body>
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
			<div class="panel panel-default col-lg-12">
				<div class="panel-body">
					<div class="table-responsive">
						<h3>QnA</h3>
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td width="10%" align="center">NO</td>
									<td width="60%" align="left">SUBJECT</td>
									<td width="20%" align="center">DATE</td>
									<td width="10%" align="center">HIT</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="q" items="${qna }">
									<tr
										onclick="location.href='adminqnainfo.do?no=${q.no}&page=${curpage}'">
										<td width="10%" align="center">${q.no }</td>
										<td width="60%" align="left">${q.subject }<small><c:if
													test="${q.replyCount!=0 }">(${q.replyCount })</c:if></small></td>
										<td width="20%" align="center">${q.dbday }</td>
										<td width="10%" align="center">${q.hit }</td>
									</tr>
								</c:forEach>
						</table>
					</div>
					<div class="col-lg-12" style="text-align: right;">
						<a href="adminqnaboard.do?page=${curpage>1?curpage-1:curpage }">
							<img src="img/prev_icon.gif">
						</a>&nbsp; <a
							href="adminqnaboard.do?page=${curpage<totalpage?curpage+1:curpage }">
							<img src="img/next_icon.gif">
						</a>&nbsp;&nbsp; ${curpage } page / ${totalpage } pages
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.row -->
</body>
</html>