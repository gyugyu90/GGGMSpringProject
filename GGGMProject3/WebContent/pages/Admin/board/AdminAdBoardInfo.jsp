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
					<h3>&nbsp;&nbsp;�� ���� ��� ��û ����</h3>
						<table class="table table-bordered table-hover">				

				
						<tr>
							<td width="20%" align=center>���� ����</td>
							<td width="75%" colspan="4"></td>
						</tr>
						<tr>
							<td width="20%" align=center>���� ������</td>
							<td width="75%" colspan="4"></td>
						</tr>
						<tr>
							<td width="20%" align=center style="vertical-align: middle;">���� ����</td>
							<td width="75%" colspan="4"><textarea name=adcontent class="adcontent"
									rows="20" cols="108" readonly="readonly"></textarea>
						</tr>
						<tr>
							<td width="20%" align=center>����Ʈ ����</td>
							<td width="75%" colspan="4"></td>
						<tr>
							<td width="20%" align=center>���� ī�װ�</td>
							<td width="75%" colspan="4"></td>



						</tr>
						<tr>
							<td width="20%" rowspan="7" align="center" style="vertical-align: middle;">Ÿ��</td>
							<td width="10%" align=center>����</td>
							<td width="30%"></td>
							<td width="10%" align=center>����ġ
							<td width="30%"></td> 
							
						</tr>
						<tr>
							<td width="10%" align=center>����</td>
							<td width="30%"></td>
							<td width="10%" align=center>����ġ</td>
							<td width="30%"></td>
						</tr>
						<tr>
							<td width="10%" align=center>�ּ���</td>
							<td width="30%"></td>
							<td width="10%" align=center>����ġ</td>
							<td width="30%"></td>
						</tr>
						<tr>
							<td width="10%" align=center>��ȥ����</td>
							<td width="30%"></td>
							<td width="10%" align=center>����ġ</td>
							<td width="30%"></td>
						</tr>
						<tr>
							<td width="10%" align=center>����</td>
							<td width="30%"></td>
							<td width="10%" align=center>����ġ</td>
							<td width="30%"></td>
						</tr>
						<tr>
							<td width="10%" align=center>�ҵ�</td>
							<td width="30%"></td>
							<td width="10%" align=center>����ġ</td>
							<td width="30%"></td>
						</tr>
						<tr>
							<td width="10%" align=center>���ɺо�</td>
							<td width="30%"></td>
							<td width="10%" align="center">����ġ</td>
							<td width="30%"></td>
						</tr>
					</table>
					<br>

					<div class="panel-footer" style="text-align: center;">
						<button type="submit" class="btn btn-primary">����</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-primary">���</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>