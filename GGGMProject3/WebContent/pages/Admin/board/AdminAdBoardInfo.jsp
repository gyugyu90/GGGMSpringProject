<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
		<div class="col-lg-11 col-md-offset-1">
			<div class="panel panel-default col-lg-12">
				<div class="panel-body">
					<div class="table-responsive">
					<h3>&nbsp;&nbsp;※ 광고 등록 요청 내역</h3>
						<table class="table table-bordered table-hover">				

				
						<tr>
							<td width="20%" align=center>광고 제목</td>
							<td width="75%" colspan="4"></td>
						</tr>
						<tr>
							<td width="20%" align=center>광고 동영상</td>
							<td width="75%" colspan="4"></td>
						</tr>
						<tr>
							<td width="20%" align=center style="vertical-align: middle;">광고 설명</td>
							<td width="75%" colspan="4"><textarea name=adcontent class="adcontent"
									rows="20" cols="108" readonly="readonly"></textarea>
						</tr>
						<tr>
							<td width="20%" align=center>포인트 범위</td>
							<td width="75%" colspan="4"></td>
						<tr>
							<td width="20%" align=center>광고 카테고리</td>
							<td width="75%" colspan="4"></td>



						</tr>
						<tr>
							<td width="20%" rowspan="7" align="center" style="vertical-align: middle;">타겟</td>
							<td width="10%" align=center>성별</td>
							<td width="30%"></td>
							<td width="10%" align=center>가중치
							<td width="30%"></td> 
							
						</tr>
						<tr>
							<td width="10%" align=center>나이</td>
							<td width="30%"></td>
							<td width="10%" align=center>가중치</td>
							<td width="30%"></td>
						</tr>
						<tr>
							<td width="10%" align=center>주소지</td>
							<td width="30%"></td>
							<td width="10%" align=center>가중치</td>
							<td width="30%"></td>
						</tr>
						<tr>
							<td width="10%" align=center>결혼여부</td>
							<td width="30%"></td>
							<td width="10%" align=center>가중치</td>
							<td width="30%"></td>
						</tr>
						<tr>
							<td width="10%" align=center>직업</td>
							<td width="30%"></td>
							<td width="10%" align=center>가중치</td>
							<td width="30%"></td>
						</tr>
						<tr>
							<td width="10%" align=center>소득</td>
							<td width="30%"></td>
							<td width="10%" align=center>가중치</td>
							<td width="30%"></td>
						</tr>
						<tr>
							<td width="10%" align=center>관심분야</td>
							<td width="30%"></td>
							<td width="10%" align="center">가중치</td>
							<td width="30%"></td>
						</tr>
					</table>
					<br>

					<div class="panel-footer" style="text-align: center;">
						<button type="submit" class="btn btn-primary">승인</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-primary">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>