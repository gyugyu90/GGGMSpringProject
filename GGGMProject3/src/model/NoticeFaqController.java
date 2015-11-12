package model;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.RequestMapping;
import dao.FaqDAO;
import dao.FaqDTO;
import dao.NoticeDAO;
import dao.NoticeDTO;
import dao.NoticeReplyDTO;
import dao.ReplyDTO;

@Controller("nc")
public class NoticeFaqController {
	
	@RequestMapping("notice.do")
	public String notice(HttpServletRequest req, HttpServletResponse res){

		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String strPage=req.getParameter("page");
		if(strPage==null)
			strPage="1";
		int curpage=Integer.parseInt(strPage);
		int rowSize=10;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		Map map=new HashMap();
		map.put("start", start); // #{start}
		map.put("end", end); // #{end}
		
		List<NoticeDTO> noticelist= NoticeDAO.noticeListData(map);

		for(NoticeDTO d:noticelist){
			d.setDbday(sdf.format(d.getRegdate()));
			d.setReplyCount(NoticeDAO.noticeReplyCount(d.getNo()));
		}
		
		req.setAttribute("noticelist", noticelist);
		req.setAttribute("today", sdf.format(new Date()));
		int totalpage=NoticeDAO.noticeTotalPage();
		
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("curpage", curpage);
		req.setAttribute("title", "자유 게시판");
		req.setAttribute("jsp", "../board/notification.jsp");
		return "pages/main/main.jsp";

	}
	
	@RequestMapping("notice_content.do")
	public String notice_content(HttpServletRequest req, HttpServletResponse res){
		int no = Integer.parseInt(req.getParameter("no"));
		int page= Integer.parseInt(req.getParameter("page"));
		NoticeDTO dto= NoticeDAO.noticeContentData(no);
		
		req.setAttribute("no", no);
		req.setAttribute("curpage", page);
		req.setAttribute("dto", dto);
		req.setAttribute("title", "공지 사항");
		req.setAttribute("jsp", "../board/notice_content.jsp");
		
//		댓글 부분
		String rPage=req.getParameter("rPage");
		if(rPage==null)
			rPage="1";
		
		int rcurpage=Integer.parseInt(rPage);
		List<NoticeReplyDTO> temp=NoticeDAO.replyListData(no);
		List<NoticeReplyDTO> list=new ArrayList<NoticeReplyDTO>();
		

		int j=0;
		int pagecnt=(rcurpage*5)-5;
		for(int i=0;i<temp.size();i++)
		{
			if(j<5 && i>=pagecnt)
			{
				NoticeReplyDTO dd=temp.get(i);
				list.add(dd);
				j++;
			}
		}
		int rtotal=NoticeDAO.noticeReplyTotalPage(no);

		req.setAttribute("rcurpage", rcurpage);
		req.setAttribute("rtotal", rtotal);
		req.setAttribute("rlist", list);
		
		
				
		return "pages/main/main.jsp";

	}
	
	@RequestMapping("notice_write.do")
	public String notice_write(HttpServletRequest req, HttpServletResponse res){

		req.setAttribute("jsp", "../board/notice_write.jsp");
		return "pages/main/main.jsp";
	}
	
	@RequestMapping("notice_write_ok.do")
	public String notice_write_ok(HttpServletRequest req, HttpServletResponse res){
		try {
			req.setCharacterEncoding("euc-kr");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String subject=req.getParameter("subject");
		String content=req.getParameter("content");
		
		NoticeDTO d = new NoticeDTO();
		d.setSubject(subject);
		d.setContent(content);
		
		NoticeDAO.noticeWrite(d);
		return "notice.do";
	}
	
	@RequestMapping("notice_modify.do")
	public String notice_modify(HttpServletRequest req, HttpServletResponse res){

		int no = Integer.parseInt(req.getParameter("no"));
		
		NoticeDTO d = NoticeDAO.noticeContentData(no);
		
		req.setAttribute("oldsubject", d.getSubject());
		req.setAttribute("oldcontent", d.getContent());
		req.setAttribute("no", d.getNo());
		
		req.setAttribute("jsp", "../board/notice_modify.jsp");
		return "pages/main/main.jsp";
	}
	
	@RequestMapping("notice_modify_ok.do")
	public String notice_modify_ok(HttpServletRequest req, HttpServletResponse res){
		try {
			req.setCharacterEncoding("euc-kr");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String subject=req.getParameter("subject");
		String content=req.getParameter("content");
		int no = Integer.parseInt(req.getParameter("no"));
		
		System.out.println("model access succeed");
		NoticeDTO d = new NoticeDTO();
		d.setSubject(subject);
		d.setContent(content);
		d.setNo(no);
		
		NoticeDAO.noticeModify(d);
		return "notice.do";
	}
	
	@RequestMapping("notice_delete.do")
	public String notice_delete(HttpServletRequest req, HttpServletResponse res){
		int no = Integer.parseInt(req.getParameter("no"));
		
		NoticeDAO.noticeDelete(no);
		
		return "notice.do";
	}
	
	@RequestMapping("notice_reply_write.do")
	public String notice_reply_write(HttpServletRequest req, HttpServletResponse res){
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String msg=req.getParameter("msg");
		System.out.println("msg:"+msg);
		String bno=req.getParameter("bno");
		System.out.println("bno:"+bno);
		String page=req.getParameter("page");
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		// DB연동 
		ReplyDTO d=new ReplyDTO();
		d.setBno(Integer.parseInt(bno));
		d.setId(id);
		d.setName(name);
		d.setMsg(msg);
		NoticeDAO.noticeReplyNewWrite(d);
		//Insert완료
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "pages/board/notice_reply_write.jsp";
	}
	
	@RequestMapping("notice_reply_modify.do")
	public String notice_reply_modify(HttpServletRequest req, HttpServletResponse res){

		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String rmsg=req.getParameter("umsg");
		String no=req.getParameter("no");
		String bno=req.getParameter("bno");
		String page=req.getParameter("page");
		// DB연동 
		ReplyDTO d=new ReplyDTO();
		d.setNo(Integer.parseInt(no));
		d.setMsg(rmsg);
		// DB
		NoticeDAO.noticeReplyUpdate(d);
		// Insert완료 
		return "notice_content.do?no="+bno+"&page="+page;
	}
	
	@RequestMapping("notice_reply_reply_write.do")
	public String notice_reply_reply_write(HttpServletRequest req, HttpServletResponse res){

		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String rmsg=req.getParameter("rrmsg");
		String root=req.getParameter("no");
		String bno=req.getParameter("bno");
		String page=req.getParameter("page");
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		// DB연동 
		ReplyDTO d=new ReplyDTO();
		d.setBno(Integer.parseInt(bno));
		d.setId(id);
		d.setName(name);
		d.setMsg(rmsg);
		// DB
		ReplyDTO parent=NoticeDAO.noticeReplyParentInfo(Integer.parseInt(root));
		NoticeDAO.noticeReplyStepIncrement(parent);
		d.setGroup_id(parent.getGroup_id());
		d.setGroup_step(parent.getGroup_step()+1);
		d.setGroup_tab(parent.getGroup_tab()+1);
		d.setRoot(Integer.parseInt(root));
		NoticeDAO.noticeReplyReplyWrite(d);
		NoticeDAO.noticeReplyDepthIncrement(Integer.parseInt(root));
		// Insert완료 
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "pages/board/notice_reply_reply_write.jsp";
	}
	
	@RequestMapping("notice_reply_delete.do")
	public String notice_reply_delete(HttpServletRequest req, HttpServletResponse res){

		String no = req.getParameter("no");
		String bno=req.getParameter("bno");
		String page=req.getParameter("page");
		HttpSession session=req.getSession();
		int grade =(int)session.getAttribute("grade");
		/*req.setAttribute("no", bno);
		req.setAttribute("page", page);*/
		ReplyDTO d = NoticeDAO.noticeReplyDataInfo(Integer.parseInt(no));
		if(d.getDepth()==0)
		{
			NoticeDAO.noticeReplyDelete(Integer.parseInt(no));
			NoticeDAO.noticeReplyDepthDecrement(d.getRoot());
		}
		else
		{
			if(grade==3 && (d.getDepth()==0))
			{
				NoticeDAO.noticeReplyDelete(Integer.parseInt(no));
				NoticeDAO.noticeReplyDepthDecrement(d.getRoot());
			}
			else if(grade==3 && (d.getDepth()!=0))
			{
				NoticeDAO.noticeReplyMsgUpdate(Integer.parseInt(no));
			}
		}
		return "notice_content.do?no="+bno+"&page="+page;
	}
	
	@RequestMapping("faq.do")
	public String faq(HttpServletRequest req, HttpServletResponse res){
		List<FaqDTO> faqlist= FaqDAO.faqAllData();
		req.setAttribute("faqlist", faqlist);
		req.setAttribute("jsp", "../board/faq.jsp");
		
		return "/pages/main/main.jsp";
	}
	

}




   