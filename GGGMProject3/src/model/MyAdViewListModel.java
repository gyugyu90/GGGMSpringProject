package model;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MyAdViewListDAO;
import dao.MyAdViewListDTO;

public class MyAdViewListModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		//id°¡ °°Àº 
		
		List<MyAdViewListDTO> list=MyAdViewListDAO.adListData(id);
		
		
		req.setAttribute("myadviewlist", list);
		req.setAttribute("jsp", "../myinfo/point.jsp");
		
		return "pages/main/main.jsp";
	}

}
