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
		<div class="col-lg-11 col-md-offset-1">
			<div class="panel panel-default col-lg-12">
				<div class="panel-body">
					<div class="table-responsive">
						<h3>FAQ</h3>
						<table class="table table-bordered table-hover">
							<tr>
								<th width="10%" style="text-align: center;">번호</th>
								<th width="10%" style="text-align: center;">제목</th>
							</tr>

							<c:forEach var="d" items="${list}">
								<tr
									onclick="location.href='AdminFAQInfo.do?no=${d.no}&page=${curpage}'">
									<td width="20%" style="text-align: center;">${d.no }</td>
									<td width="80%" style="text-align: center;">${d.subject }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="col-lg-12" style="text-align: right;">
						<a href="adminfaqboard.do?page=${curpage>1?curpage-1:curpage }"> <img
							src="img/prev_icon.gif"></a>&nbsp; <a
							href="adminfaqboard.do?page=${curpage<totalpage?curpage+1:curpage }">
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