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
				<li><a href="#">공지사항</a></li>
				<li><a href="adminfaqboard.do">FAQ</a></li>
				<li><a href="#">QnA</a></li>
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
									<th><input type="checkbox"></th>
									<th>회원번호</th>
									<th>회원구분</th>
									<th>회원ID</th>
									<th>이름</th>
									<th>가입일</th>
									<th>최근접속일</th>
									<th>접속IP</th>
									<th>Point</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td>1</td>
									<td>일반</td>
									<td>hong</td>
									<td>홍길동</td>
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
									<th><input type="checkbox"></th>
									<th>회원번호</th>
									<th>회원구분</th>
									<th>회원ID</th>
									<th>이름</th>
									<th>가입일</th>
									<th>최근접속일</th>
									<th>접속IP</th>
									<th>Point</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td>1</td>
									<td>일반</td>
									<td>hong</td>
									<td>홍길동</td>
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