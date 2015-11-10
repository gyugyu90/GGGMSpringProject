package model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdrequestDAO;
import dao.AdrequestDTO;
import dao.BoardDAO;
import dao.BoardDTO;
import dao.FaqDAO;
import dao.FaqDTO;
import dao.NoticeDAO;
import dao.NoticeDTO;

public class AdminBoardModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {

		Map map = new HashMap();
		map.put("start", 1); // #{start}
		map.put("end", 5); // #{end}
		List<FaqDTO> faqlist = FaqDAO.faqListData(map);
		System.out.println(map.get("start")+" "+map.get("end"));

		AdrequestDAO dao = new AdrequestDAO();
		List<AdrequestDTO> adlist = dao.adRequestList();
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		List<NoticeDTO> noticelist= NoticeDAO.noticeListData(map);
		for(NoticeDTO d:noticelist){
			d.setDbday(sdf.format(d.getRegdate()));
			System.out.println(d.getNo());
			d.setReplyCount(NoticeDAO.noticeReplyCount(d.getNo()));
		}
		List<BoardDTO> qna = BoardDAO.qnaListData(map);
		

		req.setAttribute("notice", noticelist);
		req.setAttribute("ad", adlist);
		req.setAttribute("faq", faqlist);
		req.setAttribute("qna", qna);
		req.setAttribute("jsp", "../Admin/board/board.jsp");
		return "pages/main/main.jsp";
	}

}
