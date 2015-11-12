package model;

import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.http.*;
import controller.*;
import dao.*;

@Controller("qc")
public class QnaController {

	@RequestMapping("qna_authorized.do")
	public String qna_authorized(HttpServletRequest req, HttpServletResponse res) {

		// handlerRequest부분
		String rPage = req.getParameter("rPage");
		if (rPage == null) {
			rPage = "1";
		}
		int rcurpage = Integer.parseInt(rPage);
		String strNo = req.getParameter("no");
		String strPage = req.getParameter("page");
		String db_pwd = BoardDAO.qnaAuthorizedData(Integer.parseInt(strNo));
		int curpage = Integer.parseInt(strPage);
		BoardDTO d = new BoardDTO();
		if (db_pwd == null) {
			d = BoardDAO.qnaContentData(Integer.parseInt(strNo));
			List<ReplyDTO> temp = BoardDAO.replyListData(Integer.parseInt(strNo));
			List<ReplyDTO> list = new ArrayList<ReplyDTO>();
			int j = 0;
			int pagecnt = (rcurpage * 5) - 5;
			for (int i = 0; i < temp.size(); i++) {
				if (j < 5 && i >= pagecnt) {
					ReplyDTO dd = temp.get(i);
					list.add(dd);
					j++;
				}
			}
			int rtotal = BoardDAO.replyTotalPage(Integer.parseInt(strNo));
			req.setAttribute("strNo", strNo);
			req.setAttribute("strPage", strPage);
			req.setAttribute("d", d);
			req.setAttribute("curpage", curpage);
			req.setAttribute("db_pwd", db_pwd);
			req.setAttribute("jsp", "../board/qna_content.jsp");
		} else {
			d = BoardDAO.qnaContentData2(Integer.parseInt(strNo));
			req.setAttribute("strNo", strNo);
			req.setAttribute("strPage", strPage);
			req.setAttribute("d", d);
			req.setAttribute("curpage", curpage);
			req.setAttribute("title", "글쓰기");
			req.setAttribute("jsp", "../board/qna_authorized.jsp");
		}

		return "pages/main/main.jsp";
	}

	@RequestMapping("qna_authorized_ok.do")
	public String qna_authorized_ok(HttpServletRequest req, HttpServletResponse res) {
		String rPage = req.getParameter("rPage");
		if (rPage == null) {
			rPage = "1";
		}
		int rcurpage = Integer.parseInt(rPage);
		String pwd = req.getParameter("pwd");
		String no = req.getParameter("no");
		String strPage = req.getParameter("page");
		String db_pwd = BoardDAO.qnaAuthorizedData(Integer.parseInt(no));
		boolean bCheck = false;
		if (pwd.equals(db_pwd)) {
			bCheck = true;
			BoardDTO d = BoardDAO.qnaContentData(Integer.parseInt(no));
			List<ReplyDTO> temp = BoardDAO.replyListData(Integer.parseInt(no));
			List<ReplyDTO> list = new ArrayList<ReplyDTO>();
			int j = 0;
			int pagecnt = (rcurpage * 5) - 5;
			for (int i = 0; i < temp.size(); i++) {
				if (j < 5 && i >= pagecnt) {
					ReplyDTO dd = temp.get(i);
					list.add(dd);
					j++;
				}
			}
			int rtotal = BoardDAO.replyTotalPage(Integer.parseInt(no));

			req.setAttribute("rcurpage", rcurpage);
			req.setAttribute("rtotal", rtotal);
			req.setAttribute("rlist", list);
			req.setAttribute("d", d);
			req.setAttribute("no", no);
			req.setAttribute("strPage", strPage);
			req.setAttribute("title", "내용보기");
			req.setAttribute("jsp", "../board/qna_content.jsp");
		} else {
			bCheck = false;
			req.setAttribute("title", "글쓰기");
			return "qna_authorized.do?no=" + no + "&page=" + strPage;
		}

		System.out.println("444");
		return "pages/main/main.jsp";

	}

	@RequestMapping("qna_content.do")
	public String qna_content(HttpServletRequest req, HttpServletResponse res) {

		String rPage = req.getParameter("rPage");
		if (rPage == null) {
			rPage = "1";
		}
		int rcurpage = Integer.parseInt(rPage);
		String strNo = req.getParameter("no");
		String strPage = req.getParameter("page");

		BoardDTO d = BoardDAO.qnaContentData(Integer.parseInt(strNo));
		List<ReplyDTO> temp = BoardDAO.replyListData(Integer.parseInt(strNo));
		List<ReplyDTO> list = new ArrayList<ReplyDTO>();
		int j = 0;
		int pagecnt = (rcurpage * 5) - 5;
		for (int i = 0; i < temp.size(); i++) {
			if (j < 5 && i >= pagecnt) {
				ReplyDTO dd = temp.get(i);
				list.add(dd);
				j++;
			}
		}
		int rtotal = BoardDAO.replyTotalPage(Integer.parseInt(strNo));
		req.setAttribute("rcurpage", rcurpage);
		req.setAttribute("rtotal", rtotal);
		req.setAttribute("rlist", list);
		req.setAttribute("d", d);
		req.setAttribute("strNo", strNo);
		req.setAttribute("strPage", strPage);
		req.setAttribute("title", "내용보기");
		req.setAttribute("jsp", "../board/qna_content.jsp");
		return "pages/main/main.jsp";

	}

	@RequestMapping("qna_delete.do")
	public String qna_delete(HttpServletRequest req, HttpServletResponse res) {
		String strPage = req.getParameter("page");
		String strNo = req.getParameter("no");
		BoardDAO.qnaDelete(Integer.parseInt(strNo));
		req.setAttribute("strPage", strPage);
		return "pages/board/qna_delete_ok.jsp";
	}

	@RequestMapping("qna_list.do")
	public String qna_list(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String search = req.getParameter("search");
		System.out.println("search" + search);
		String strPage = req.getParameter("page");
		String searchCheck = req.getParameter("searchCheck");
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		int totalpage = 0;
		int count = 0;
		int block = 0;
		int fromPage = 0;
		int toPage = 0;

		if (strPage == null)
			strPage = "1";
		if (search == null)
			search = "";
		int curpage = Integer.parseInt(strPage);
		int rowSize = 10;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;
		System.out.println("search:" + search);
		Map map = new HashMap();
		map.put("start", start); // #{start}
		map.put("end", end); // #{end}
		map.put("search", search);
		map.put("searchCheck", searchCheck);
		if (search == "") {
			list = BoardDAO.qnaListData(map);
			for (BoardDTO d : list) {
				d.setDbday(sdf.format(d.getRegdate()));
				d.setReplyCount(BoardDAO.qnaReplyCount(d.getNo()));
			}
			totalpage = BoardDAO.qnaTotalPage();
			count = BoardDAO.qnaRowCount();
		} else {

			list = BoardDAO.qnaSearchListData(map);
			for (BoardDTO d : list) {
				d.setDbday(sdf.format(d.getRegdate()));
				d.setReplyCount(BoardDAO.qnaReplyCount(d.getNo()));
			}
			totalpage = BoardDAO.qnaSearchTotalPage(map);
			count = BoardDAO.qnaSearchRowCount(map);

		}
		count = count - ((curpage * 10) - 10);
		block = 5;
		fromPage = ((curpage - 1) / block * block) + 1;
		toPage = ((curpage - 1) / block * block) + block;
		if (toPage > totalpage) {
			toPage = totalpage;
		}
		req.setAttribute("toPage", toPage);
		req.setAttribute("fromPage", fromPage);
		req.setAttribute("block", block);
		req.setAttribute("count", count);
		req.setAttribute("today", sdf.format(new Date()));
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("list", list);
		req.setAttribute("curpage", curpage);
		req.setAttribute("title", "자유게시판");
		// ${title}
		req.setAttribute("jsp", "../board/qna_list.jsp");
		// ${jsp}
		return "pages/main/main.jsp";
	}

	@RequestMapping("qna_modify.do")
	public String qna_modify(HttpServletRequest req, HttpServletResponse res) {
		String strNo = req.getParameter("no");
		String strPage = req.getParameter("page");
		BoardDTO d = BoardDAO.qnaUpdateData(Integer.parseInt(strNo));
		req.setAttribute("d", d);
		req.setAttribute("strNo", strNo);
		req.setAttribute("strPage", strPage);
		req.setAttribute("title", "수정하기");
		req.setAttribute("jsp", "../board/qna_modify.jsp");
		return "pages/main/main.jsp";
	}

	@RequestMapping("qna_modify_ok.do")
	public String qna_modify_ok(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String name = req.getParameter("name");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String pwd = req.getParameter("pwd");
		String no = req.getParameter("no");
		String page = req.getParameter("page");
		BoardDTO d = new BoardDTO();
		d.setNo(Integer.parseInt(no));
		d.setName(name);
		d.setSubject(subject);
		d.setContent(content);
		d.setPwd(pwd);
		// DB연동

		BoardDAO.qnaUpdate(d);
		req.setAttribute("no", d.getNo());
		req.setAttribute("page", page);
		return "pages/board/qna_modify_ok.jsp";
	}

	@RequestMapping("qna_reply_content.do")
	public String qna_reply_content(HttpServletRequest req, HttpServletResponse res) {
		String rPage = req.getParameter("rPage");
		if (rPage == null)
			rPage = "1";
		int rcurpage = Integer.parseInt(rPage);

		String strNo = req.getParameter("no");
		String strPage = req.getParameter("page");

		BoardDTO d = BoardDAO.qnaContentData2(Integer.parseInt(strNo));
		List<ReplyDTO> temp = BoardDAO.replyListData(Integer.parseInt(strNo));
		List<ReplyDTO> list = new ArrayList<ReplyDTO>();
		int j = 0;
		int pagecnt = (rcurpage * 5) - 5;
		for (int i = 0; i < temp.size(); i++) {
			if (j < 5 && i >= pagecnt) {
				ReplyDTO dd = temp.get(i);
				list.add(dd);
				j++;
			}
		}
		int rtotal = BoardDAO.replyTotalPage(Integer.parseInt(strNo));
		req.setAttribute("rcurpage", rcurpage);
		req.setAttribute("rtotal", rtotal);
		req.setAttribute("rlist", list);
		req.setAttribute("d", d);
		req.setAttribute("strNo", strNo);
		req.setAttribute("strPage", strPage);
		req.setAttribute("title", "내용보기");
		req.setAttribute("jsp", "../board/qna_content.jsp");
		return "pages/main/main.jsp";
	}

	@RequestMapping("qna_reply_delete.do")
	public String qna_reply_delete(HttpServletRequest req, HttpServletResponse res) {
		String no = req.getParameter("no");
		String bno = req.getParameter("bno");
		String page = req.getParameter("page");
		HttpSession session = req.getSession();
		int grade = (int) session.getAttribute("grade");
		/*
		 * req.setAttribute("no", bno); req.setAttribute("page", page);
		 */
		ReplyDTO d = BoardDAO.replyDataInfo(Integer.parseInt(no));
		if (d.getDepth() == 0) {
			BoardDAO.replyDelete(Integer.parseInt(no));
			BoardDAO.replyDepthDecrement(d.getRoot());
		} else {
			if (grade == 3 && (d.getDepth() == 0)) {
				BoardDAO.replyDelete(Integer.parseInt(no));
				BoardDAO.replyDepthDecrement(d.getRoot());
			} else if (grade == 3 && (d.getDepth() != 0)) {
				BoardDAO.replyMsgUpdate(Integer.parseInt(no));
			}
		}
		return "qna_reply_content.do?no=" + bno + "&page=" + page;
	}

	@RequestMapping("qna_reply_modify.do")
	public String qna_reply_modify(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String rmsg = req.getParameter("umsg");
		String no = req.getParameter("no");
		String bno = req.getParameter("bno");
		String page = req.getParameter("page");
		// DB연동
		ReplyDTO d = new ReplyDTO();
		d.setNo(Integer.parseInt(no));
		d.setMsg(rmsg);
		// DB
		BoardDAO.replyUpdate(d);
		// Insert완료
		return "qna_reply_content.do?no=" + bno + "&page=" + page;
	}

	@RequestMapping("qna_reply_reply_write.do")
	public String qna_reply_reply_write(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String rmsg = req.getParameter("rrmsg");
		String root = req.getParameter("no");
		String bno = req.getParameter("bno");
		String page = req.getParameter("page");
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		// DB연동
		ReplyDTO d = new ReplyDTO();
		d.setBno(Integer.parseInt(bno));
		d.setId(id);
		d.setName(name);
		d.setMsg(rmsg);
		// DB
		ReplyDTO parent = BoardDAO.replyParentInfo(Integer.parseInt(root));
		BoardDAO.replyStepIncrement(parent);
		d.setGroup_id(parent.getGroup_id());
		d.setGroup_step(parent.getGroup_step() + 1);
		d.setGroup_tab(parent.getGroup_tab() + 1);
		d.setRoot(Integer.parseInt(root));
		BoardDAO.replyReplyWrite(d);
		BoardDAO.replyDepthIncrement(Integer.parseInt(root));
		// Insert완료
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "pages/board/qna_reply_reply_write.jsp";
	}

	@RequestMapping("qna_reply_write.do")
	public String qna_reply_write(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String msg = req.getParameter("msg");
		System.out.println("msg:" + msg);
		String root = req.getParameter("no");
		String bno = req.getParameter("bno");
		System.out.println("bno:" + bno);
		String page = req.getParameter("page");
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		// DB연동
		ReplyDTO d = new ReplyDTO();
		d.setBno(Integer.parseInt(bno));
		d.setId(id);
		d.setName(name);
		d.setMsg(msg);
		BoardDAO.replyNewWrite(d);
		// Insert완료
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "pages/board/qna_reply_write.jsp";
	}

	@RequestMapping("qna_write.do")
	public String qna_write(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("title", "글쓰기");
		req.setAttribute("jsp", "../board/qna_write.jsp");
		return "pages/main/main.jsp";
	}

	@RequestMapping("qna_write_ok.do")
	public String qna_write_ok(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String name = req.getParameter("name");
		System.out.println("name:" + name);
		String subject = req.getParameter("subject");
		String subject2 = req.getParameter("subject2");
		String content = req.getParameter("content");
		String pwd = req.getParameter("pwd");
		BoardDTO d = new BoardDTO();
		d.setName(name);
		d.setSubject(subject);
		d.setSubject2(subject2);
		d.setContent(content);
		d.setPwd(pwd);
		BoardDAO.qnaWrite(d);
		return "qna_list.do";
	}

	@RequestMapping("adminqnainfo.do")
	public String adminqnainfo(HttpServletRequest req, HttpServletResponse res) {
		String rPage = req.getParameter("rPage");
		if (rPage == null) {
			rPage = "1";
		}
		int rcurpage = Integer.parseInt(rPage);
		String strNo = req.getParameter("no");
		String strPage = req.getParameter("page");

		BoardDTO d = BoardDAO.qnaContentData(Integer.parseInt(strNo));
		List<ReplyDTO> temp = BoardDAO.replyListData(Integer.parseInt(strNo));
		List<ReplyDTO> list = new ArrayList<ReplyDTO>();
		int j = 0;
		int pagecnt = (rcurpage * 5) - 5;
		for (int i = 0; i < temp.size(); i++) {
			if (j < 5 && i >= pagecnt) {
				ReplyDTO dd = temp.get(i);
				list.add(dd);
				j++;
			}
		}
		int rtotal = BoardDAO.replyTotalPage(Integer.parseInt(strNo));
		req.setAttribute("rcurpage", rcurpage);
		req.setAttribute("rtotal", rtotal);
		req.setAttribute("rlist", list);
		req.setAttribute("d", d);
		req.setAttribute("strNo", strNo);
		req.setAttribute("strPage", strPage);
		req.setAttribute("title", "내용보기");
		req.setAttribute("jsp", "../Admin/board/QnABoardInfo.jsp");
		return "pages/main/main.jsp";
	}

	@RequestMapping("adminqnaboard.do")
	public String adminqnaboard(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String search = req.getParameter("search");
		System.out.println("search" + search);
		String strPage = req.getParameter("page");
		String searchCheck = req.getParameter("searchCheck");
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		int totalpage = 0;
		int count = 0;
		int block = 0;
		int fromPage = 0;
		int toPage = 0;

		if (strPage == null)
			strPage = "1";
		if (search == null)
			search = "";
		int curpage = Integer.parseInt(strPage);
		int rowSize = 10;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;
		System.out.println("search:" + search);
		Map map = new HashMap();
		map.put("start", start); // #{start}
		map.put("end", end); // #{end}
		map.put("search", search);
		map.put("searchCheck", searchCheck);
		if (search == "") {
			list = BoardDAO.qnaListData(map);
			for (BoardDTO d : list) {
				d.setDbday(sdf.format(d.getRegdate()));
				d.setReplyCount(BoardDAO.qnaReplyCount(d.getNo()));
			}
			totalpage = BoardDAO.qnaTotalPage();

		} else {

			list = BoardDAO.qnaSearchListData(map);
			for (BoardDTO d : list) {
				d.setDbday(sdf.format(d.getRegdate()));
				d.setReplyCount(BoardDAO.qnaReplyCount(d.getNo()));
			}
			totalpage = BoardDAO.qnaSearchTotalPage(map);

		}

		req.setAttribute("totalpage", totalpage);
		req.setAttribute("qna", list);
		req.setAttribute("curpage", curpage);

		req.setAttribute("jsp", "../Admin/board/QnABoard.jsp");
		return "pages/main/main.jsp";
	}
	/*
	@RequestMapping("adminqnaboard.do")
	public String adminqnaboard(HttpServletRequest req, HttpServletResponse res){

		//handlerRequest부분

	}
	*/
}
