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
<link href="../../../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- font Awesome -->
<link href="../../../css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<!-- Ionicons -->
<link href="../../../css/ionicons.min.css" rel="stylesheet" type="text/css" />
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
					<h3>FAQ</h3>
						<table class="table table-bordered table-hover">						
							<tr>
							<td width="10%" align="center">번호</td>	<td width="10%" style="text-align: center;">${d.no }</td>							
							<td width="10%" align="center">제목</td>
							<td width="70%" style="text-align: center;">${d.subject }</td>																			
							</tr>
							<tr>
							<td width="30%" align="center" colspan="3" style="vertical-align: middle;">내용</td>
							<td width="70%" align="left"><textarea rows="20" cols="100" readonly="readonly">${d.content}</textarea></td>
							</tr>							
						</table>
					</div>
				</div>				
			</div>
		</div>
	</div>
	<!-- /.row -->
</body>
</html>