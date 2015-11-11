package model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MyAdViewListDAO;

public class ExchangeModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String ex=req.getParameter("exchange");
		int exchange=Integer.parseInt(ex);
		
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		
		Map map=new HashMap();
		map.put("id", id);
		map.put("exchange", exchange);
		
		MyAdViewListDAO.exchange(map);
		
		return "myadviewlist.do";
	}

}
