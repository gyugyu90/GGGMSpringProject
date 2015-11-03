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
			<h1>※&nbsp;상세 회원 정보</h1>
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
							<td width="30%" align="right">회원 ID</td>
							<td align="center">${d.id }</td>
							</tr>
							<tr>
							<td width="30%" align="right">회원 이름</td>
							<td align="center">${d.name }</td>
							</tr>
							<tr>
							<td width="30%" align="right">성별</td>
							<td align="center">${d.sex }</td>
							</tr>
							<tr>
							<td width="30%" align="right">생년월일</td>
							<td align="center"><fmt:formatDate value="${d.birth }"
												pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
							<td width="30%" align="right">주소</td>
							<td align="center">${d.post }<br>${d.addr1 } ${d.addr2 }</td>
							</tr>
							<tr>
							<td width="30%" align="right">전화번호</td>
							<td align="center">${d.tel }</td>
							</tr>
							<tr>
							<td width="30%" align="right">E-Mail</td>
							<td align="center">${d.email }</td>
							</tr>
							<tr>
							<td width="30%" align="right">회원등급</td>
							<td align="center">
							<select name="grade"><c:if test="${d.grade==1 }">
											<option value="1" selected="selected">일반회원</option>
											<option value="2">광고주회원</option>
											<option value="3">관리자</option>
										</c:if>
										<c:if test="${d.grade==2 }">
											<option value="1">일반회원</option>
											<option value="2" selected="selected">광고주회원</option>
											<option value="3">관리자</option>
										</c:if>
										<c:if test="${d.grade==3 }">
											<option value="1">일반회원</option>
											<option value="2">광고주회원</option>
											<option value="3" selected="selected">관리자</option>
										</c:if>
								</select>
								</td>
							</tr>


						</table>
						<div class="row">
							<div class="col-lg-12" style="text-align: center;">
								<input type="submit"
									value="수정"> <input type="button" value="취소">
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







