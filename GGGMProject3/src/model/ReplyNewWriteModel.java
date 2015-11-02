package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.*;


public class ReplyNewWriteModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("EUC-KR");
		
		String msg=req.getParameter("rmsg");
		
		
		String bno=req.getParameter("bno");
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		System.out.println(bno);
		// DB연동
		ReplyDTO d=new ReplyDTO();
		d.setBno(Integer.parseInt(bno));
		d.setId(id);
		d.setName(name);
		d.setMsg(msg);
		
		ReplyBoardDAO.replyNewWrite(d);
		//Insert완료
		int strNo=Integer.parseInt(req.getParameter("adno"));
		List<ReplyDTO> list = ReplyBoardDAO.replyListData(strNo);
		
		req.setAttribute("no", bno);
		req.setAttribute("list", list);
		req.setAttribute("jsp", "../adview/ad_index.jsp?adno="+strNo);
		return "pages/main/main.jsp";
		
		
	}

}
