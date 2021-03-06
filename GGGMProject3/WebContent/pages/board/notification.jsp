<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/faq/qna.css"/>
</head>
<body>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
      <tbody><tr align="center">
       <td height="100" style="padding-left:110"><img src="img/notice.gif"></td>
        </tr>
      <tr>
        <td></td>
        </tr>
    </tbody>
</table>
	<table>
		<tr>
			<table width="850" border="0" align="center" cellpadding="0" cellspacing="0" id="bl_table">
				<tr>
				    <td class="bl_title bl_no">NO</td>
				    <td class="bl_title bl_icon">&nbsp;</td>
				    <td class="bl_title bl_subject">SUBJECT</td>
				    <td class="bl_title bl_name">DATE</td>
				    <td class="bl_title bl_date">HIT</td>
				    <td></td>
				</tr>
	
				<c:forEach var="dto" items="${noticelist }">
				<tr class="bl_evenline">
				    <td class="bl_list bl_no">${dto.no}</td>
				    
				    <td class="bl_list bl_icon"><img src="img/star_notice.gif" border="0"></td>
					<td class="bl_list bl_subject leftalign" colspan="1">
				       <img src="img/board_head.gif" style="margin-right:5px;">
				    	<span class="BoardBrandName"></span><a href="notice_content.do?no=${dto.no}&page=${curpage}">${dto.subject }</a>&nbsp;&nbsp;
				      <c:if test="${dto.replyCount!=0 }">
      				    (${dto.replyCount })
      				   </c:if>
				    </td>
				    
				    <td class="bl_list bl_date"><span class="bl_oldcontent">
				    <fmt:formatDate value="${dto.regdate }" pattern="yyyy-MM-dd"/>
				    </span></td>
				    
				    <td class="bl_list bl_name"><div style="padding-left:2px; padding-right:2px;">${dto.hit }</div></td>
				    
				    <td></td>
				</tr>
				</c:forEach>
				
			</table>
			<!-- LIST END -->
		</tr>
		<br>
		<!-- PAGING START-->
			<table width="850" border="0" align="center" cellpadding="0" cellspacing="0">
			<c:if test="${sessionScope.grade==3 }">
				<tr><td align="right"><a href="notice_write.do"><img src="img/detail_write.gif" border="0"></a></td></tr>
			</c:if>
			</table>
		<tr>
			<table width="850" border="0" align="center">
				<tr>
		    		<td id="bl_pages">
					
						<span class="bl_curpage bl_pagetext">
							${curpage } page / ${totalpage} pages
						</span>
						
				    </td>
		    		<td id="bl_linkbutton">
		    			<a href="notice.do?page=${curpage>1?curpage-1:1}">����</a>&nbsp;&nbsp;&nbsp;
						<a href="notice.do?page=${curpage<totalpage?curpage+1:totalpage}">����</a>
		    		</td>
				</tr>
			</table>
		</tr>
	</table>
</body>
</html>