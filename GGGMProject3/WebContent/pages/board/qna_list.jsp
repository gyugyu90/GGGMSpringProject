<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="pages/board/qna.css"/>

</head>
<body>
<table border="0" cellspacing="0" cellpadding="0" width="770" id="makebanner">
<tbody>
<tr>

<!-- ��ü ���̾ƿ� ���̺� -->
<form action="qna_search.jsp" method="post" name="search"></form>
<td valign="top" width="150" height="100%" id="mk_left">
<br><script>
		// login id setting
        if(typeof document.search != "undefined" && typeof document.search.id != "undefined" && typeof document.search.save_id != "undefined") {
           document.search.id.value = getCookieMS('save_id');
        if(document.search.id.value=="null") document.search.id.value="";
        if(typeof document.search.id != "undefined" && document.search.id.value.length>0) document.search.save_id.checked=true; 
                }
     </script>
</td>

<td valign="top" width="640" align="center" id="mk_center"><table id="boardtable" border="0" cellpadding="0" cellspacing="0" width="620">
<tbody>
<tr><td align="center">
<form action="qna_list.do" name="form1">
<table width="1078" border="0" align="center" cellpadding="0" cellspacing="0">
  <tbody>
  <tr align="center">
    <td height="100" style="padding-left:110"><img src="img/board_1.gif"></td>
  </tr>
  <tr>
    <td><table width="850" border="0" align="center" cellpadding="0" cellspacing="0" id="bl_table">
	<tbody>
	<tr>
      <td class="bl_title bl_no">NO</td>
      <td class="bl_title bl_icon">&nbsp;</td>
      <td class="bl_title bl_subject">SUBJECT</td>
      <td class="bl_title bl_name">WRITER</td>
      <td class="bl_title bl_date">DATE</td>
    </tr>
<!-- INLINE NOTICE -->

	<tr class="bl_noticeline">
   	  <td class="bl_list bl_no">&nbsp;</td>
      <td class="bl_list bl_icon"><img src="img/star_notice.gif"></td>
      <td class="bl_list" colspan="5"><font color="#000000"><b>&nbsp;&nbsp;&nbsp;�̿��Ͻø鼭 �ñ��� ���ǻ����� �����ּ���</b></font></td>
	</tr>

	<c:forEach var="dto" items="${list }">
	<tr class="bl_oddline">
      <td class="bl_list bl_no">${dto.no }</td>
      <td class="bl_list bl_icon"><img src="img/lock.gif" border="0"></td>
	  <td class="bl_list bl_subject leftalign" colspan="1"><img src="img/board_head.gif" style="margin-right:5px;">
	  <span class="BoardBrandName"></span>
      <a href="qna_authorized.do?no=${dto.no }&page=${curpage }">${dto.subject }</a>
       <c:if test="${dto.replyCount!=0 }">
          (${dto.replyCount })
       </c:if>
       <c:if test="${today==dto.dbday }">
         <sup><img src="img/qna_new.gif"></sup>
       </c:if> 
         <!-- <span class="bl_commtstyle">(1)</span>&nbsp; -->
      </td>
      <td class="bl_list bl_name">
      <div style="padding-left:2px; padding-right:2px;" onmouseover="document.getElementById('MK_searchId_438235_00000').style.display='block'" onmouseout="document.getElementById('MK_searchId_438235_00000').style.display='none'">${dto.name }
      <div id="MK_searchId_438235_00000" style="display:none"></div></div></td>
    
      <td class="bl_list bl_date"><span class="bl_oldcontent"><fmt:formatDate value="${dto.regdate }" pattern="yyyy-MM-dd"/></span></td>
	</tr>
	</c:forEach>
   
<!-- LIST REPEAT END -->
	</tbody></table></td>
   </tr>
   <tr>
    <td><table width="850" border="0" align="center" cellpadding="0" cellspacing="0">
     <tbody><tr>
      <td height="50" align="right">
      <a href="qna_write.do"><img src="img/detail_write.gif" border="0"></a>
      </td>
      </tr>
      <tr>
      <!-- ������ �κ� -->
   
      <td id="bl_pages">
      
      
      <c:if test="${curpage>block}">
       <a href="qna_list.do?page=${fromPage-1 }"><img src="img/page_prev.gif" border="0"></a>&nbsp;&nbsp;
      </c:if>
 	 <c:forEach var="i" begin="${fromPage }" end="${toPage }">
 	  <c:if test="${i==curpage }">
 	  	<span class="bl_pagetext" style="color:red">${i }</span>
 	  </c:if>
 	  <c:if test="${i!=curpage }">
 	  	 <span class="bl_pagetext"><a href="qna_list.do?page=${i }">${i }</a></span>
 	  </c:if>
 	 </c:forEach>
     <c:if test="${toPage<totalpage }">
       <a href="qna_list.do?page=${toPage+1 }"><img src="img/page_end.gif" border="0"></a>&nbsp;&nbsp;
     </c:if>
     
       </td>
      </tr>
     </tbody></table></td>
    </tr>
    <tr>
    <td><table width="260" border="0" align="center" cellpadding="0" cellspacing="0">
     <tbody><tr>
      <td class="style2"><input type="checkbox" name="shname" value="ok" onclick="change(1)">�̸�
        <input type="checkbox" name="ssubject" value="ok" checked="" onclick="change(2)">����
        <input type="checkbox" name="scontent" value="ok" onclick="change(3)">����
      </td>
      <td><input type="text" name="stext" size="10">
      <a href="JavaScript:document.form1.submit();"><img src="img/search.gif" border="0" align="absmiddle"></a></td>
      </tr></tbody></table>
     </td>
     </tr>
 </tbody></table>
    <input type="hidden" name="s_id" value="">
    <input type="hidden" name="code" value="hyojung99">
    <input type="hidden" name="page" value="1">
    <input type="hidden" name="type" value="s">
</form>
<script type="text/javascript">
function change(temp) {
    onoff   = new Array(document.form1.shname,document.form1.ssubject,document.form1.scontent, document.form1.sbrand);
    temp    = temp-1;
    if(typeof document.form1.sbrand !="undefined") temp2=4;
    else temp2=3;
    for (i=0;i<temp2;i++) {
        if(i == temp) {
            onoff[i].checked = true;
        } else {
            onoff[i].checked = false;
        }
    }
}
</script></td></tr>
</tbody></table>

<script type="text/javascript" src="/js/cookie.js"></script>
<script type="text/javascript">
var selectedobj;
var dragapproved = false;
var zindex = 100;
function drag_move() {
	if(dragapproved) {
		selectedobj.style.left = base_x + event.clientX - previous_x;
		selectedobj.style.top  = base_y + event.clientY - previous_y;
		return false;
	}
}

function start_drag(drag_id) {
	selectedobj = document.getElementById(drag_id);
	selectedobj.style.zIndex = zindex++;
        if(document.body && document.body.setCapture) {
           // body ȭ�� ����(IE����) 
           document.body.setCapture();
        }
	base_x = parseInt(selectedobj.style.left);
	base_y = parseInt(selectedobj.style.top);
	previous_x = event.clientX;
	previous_y = event.clientY;
	dragapproved = true;
}

function drag_release() {
	dragapproved=false;
        if (document.body && document.body.releaseCapture) {
          // bodyȭ�� ����Ǯ��(IE����)
          document.body.releaseCapture();
        }
}
document.onmousemove = drag_move;
document.onmouseup = drag_release;
</script>


<script type="text/javascript">
    function nhn_anchor(pid) {
        
        
    }
</script>
</td></tr></tbody></table>
</body>
</html>