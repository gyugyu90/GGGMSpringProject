package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdvertiseDAO;
import dao.AdvertiseDTO;
import dao.ReplyBoardDAO;
import dao.ReplyDTO;

public class Ad_IndexModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int adno=Integer.parseInt(req.getParameter("adno"));
		System.out.println("adno:"+adno);
		AdvertiseDTO d=AdvertiseDAO.ad_info(adno);
		req.setAttribute("adinfo", d);
		
		List<ReplyDTO> list = ReplyBoardDAO.replyListData(adno);
		System.out.println("list size:"+list.size());
		req.setAttribute("list", list);
		req.setAttribute("curpage", adno);
		req.setAttribute("jsp", "../adview/ad_index.jsp?adno="+adno);
		return "pages/main/main.jsp";
	}


}