<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminLTE | Dashboard</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- bootstrap 3.0.2 -->
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- font Awesome -->
<link href="<%=request.getContextPath() %>/css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<!-- Ionicons -->
<link href="<%=request.getContextPath() %>/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="<%=request.getContextPath() %>/css/AdminLTE.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="row">
		<div class="col-md-offset-1">
			<h3>※&nbsp;게시글 관리</h3>
			<ol class="breadcrumb">
				<li><a href="adminnotice.do">공지사항</a></li>
				<li><a href="adminfaqboard.do">FAQ</a></li>
				<li><a href="#">QnA</a></li>
				<li><a href="adboard.do">광고</a></li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-11 col-md-offset-1">
			<div class="panel panel-default col-lg-12">
				<div class="panel-body">
					<div class="table-responsive">
					<h3>광고신청 List</h3>
						<table class="table table-bordered table-hover">
							<tr>							
							<th width="10%" style="text-align: center;">대분류</th>
							<th width="10%" style="text-align: center;">소분류</th>
							<th width="10%" style="text-align: center;">번호</th>
							<th width="60%" style="text-align: center;">광고제목</th>
							<th width="10%" style="text-align: center;">광고주명</th>
							
							</tr>
							
							<c:forEach var="d" items="${list}">
							<tr onclick="location.href='AdminAdBoardInfo.do?adid=${d.adid}'">
							<td width="10%" style="text-align: center;">${d.maj_category }</td>
							<td width="10%" style="text-align: center;">${d.sub_category }</td>
							<td width="10%" style="text-align: center;">${d.adno }</td>
							<td width="60%" style="text-align: center;">${d.adsubject }</td>
							<td width="10%" style="text-align: center;">${d.adid }</td>														
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