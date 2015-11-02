<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" type="text/css" href="../../css/shadowbox.css"/>
<script type="text/javascript" src="../../js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
   players:["iframe"]		
});
$(function(){
	function memberClick(id){
		alert(trObj.id);
	}
})

</script>
</head>
<body class="skin-black">
	<div class="row">
		<div class="col-md-offset-1">
			<h1>※&nbsp;회원목록</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">회원</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-md-offset-1">
			&nbsp;&nbsp;&nbsp;&nbsp; <a href="member.do">전체회원 | </a> <a
				href="normalmember.do">일반회원 | </a> <a href="admember.do">광고주회원 |
			</a> <a href="AdminMember.do">관리자회원 </a>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-11 col-md-offset-1">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>회원ID</th>
									<th>이름</th>
									<th>생일</th>
									<th>전화번호</th>
									<th>성별</th>
									<th>우편번호</th>
									<th>주소</th>
									<th>E-mail</th>
									<th>수신여부</th>
									<th>회원등급</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="d" items="${list}">
									<tr style="font-size: 9pt;" onclick="memberClick(${d.id})">
										<td width="8%">${d.id}</td>
										<td width="8%">${d.name}</td>
										<td width="10%"><fmt:formatDate value="${d.birth }"
												pattern="yyyy-MM-dd" /></td>
										<td width="12%">${d.tel}</td>
										<td width="6%">${d.sex}</td>
										<td width="9%">${d.post}</td>
										<td width="16%"><small>${d.addr1}<br>${d.addr2}</small></td>
										<td width="15%">${d.email}</td>
										<td width="10%">${d.emailreceive}</td>
										<td width="10%"><c:choose>
												<c:when test="${d.grade==1}">
									일반회원
									</c:when>
												<c:when test="${d.grade==2}">
									광고주회원
									</c:when>
												<c:otherwise>
									관리자
									</c:otherwise>
											</c:choose></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-8">
									<select id="aa"><option>전체</option>
										<option>이름</option>
										<option style="text-align: right;">ID</option></select> <input
										type="search">

									<button type="submit">검색</button>
								</div>
								<div class="col-lg-4" style="text-align: right;">
									<a href="member.do?page=${curpage>1?curpage-1:curpage }"> <img
										src="img/prev_icon.gif"></a>&nbsp; <a
										href="member.do?page=${curpage<totalpage?curpage+1:curpage }">
										<img src="img/next_icon.gif">
									</a>&nbsp;&nbsp; ${curpage } page / ${totalpage } pages
								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>