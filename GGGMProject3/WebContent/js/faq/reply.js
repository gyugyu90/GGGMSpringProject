/**
 * 
 */

var i=0;
$(function(){
	${sessionScope.id="testtest"}
	var j=0;
	$('#replyShow').click(function(){
		if(j==0)
		{
			$('#reply').show();
			$('#replyShow').text("댓글닫기");
			j=1;
		}
		else
		{
			$('#reply').hide();
			$('#replyShow').text("댓글열기");
			j=0;
		}
	});
	$('#reWriteBtn').click(function(){
		var msg=$('#rmsg').val();
		if(msg=="")
		{
			alert("댓글내용을 입력하세요");
			$('#rmsg').focus();
			return;
		}
		$('#new_re_write').submit();
	});
	// 댓글=>댓글
	var k=0;
	$('.re_re_a').click(function(){
		var no=$(this).attr("name");
		//alert(no);
		if(k==0)
		{
		   $('#re_re_write'+no).show();
		   k=1;
		}
		else
		{
			$('#re_re_write'+no).hide();
			k=0;
		}
	});
	var p=0;
	$('.re_up_a').click(function(){
		var no=$(this).attr("name");
		//alert(no);
		if(p==0)
		{
		   $('#re_re_update'+no).show();
		   p=1;
		}
		else
		{
			$('#re_re_update'+no).hide();
			p=0;
		}
	});
	
});

function reReplyBtn(no)
{
	var rmsg=$('#rmsg'+no).val();
	if(rmsg=="")
	{
		alert("댓글 내용을 입력하세요");
		$('#rmsg'+no).focus();
		return;
	}
	$('#re_re_frm'+no).submit();
}
function reUpdateBtn(no)
{
	var rmsg=$('#umsg'+no).val();
	if(rmsg=="")
	{
		alert("댓글 내용을 입력하세요");
		$('#umsg'+no).focus();
		return;
	}
	$('#re_update_frm'+no).submit();
}