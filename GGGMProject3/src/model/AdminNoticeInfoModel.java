package model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dao.NoticeDTO;
import dao.NoticeReplyDTO;

public class AdminNoticeInfoModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int no = Integer.parseInt(req.getParameter("no"));
		int page= Integer.parseInt(req.getParameter("page"));
		NoticeDTO dto= NoticeDAO.noticeContentData(no);
		
		req.setAttribute("no", no);
		req.setAttribute("curpage", page);
		req.setAttribute("dto", dto);
		req.setAttribute("title", "���� ����");
		
		
//		��� �κ�
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
		req.setAttribute("jsp", "../Admin/board/NoticeBoardInfo.jsp");
		return "pages/main/main.jsp";
	}

}
