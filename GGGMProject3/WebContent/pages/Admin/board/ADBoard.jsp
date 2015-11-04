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
							<tr onclick="location.href='AdInfo.do?adid=${d.adid}'">
							<td width="10%" style="text-align: center;"></td>
							<td width="10%" style="text-align: center;"></td>
							<td width="10%" style="text-align: center;"></td>
							<td width="60%" style="text-align: center;"></td>
							<td width="10%" style="text-align: center;"></td>														
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>				
			</div>
		</div>
	</div>
	<!-- /.row -->
</body>
</html>