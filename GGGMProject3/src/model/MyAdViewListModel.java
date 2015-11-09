package model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdGraphDTO;
import dao.MyAdViewListDAO;

public class MyAdViewListModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		//id가 같은 
		String strPage=req.getParameter("page");
		if(strPage==null)
			strPage="1";
		int curpage=Integer.parseInt(strPage);
		int rowSize=5;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		Map map=new HashMap();
		map.put("start", start); // #{start}
		map.put("end", end); // #{end}
		map.put("id", id);
		
		//날짜 바꾸기
		List<AdGraphDTO> list=MyAdViewListDAO.adListData(map);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		for(AdGraphDTO dto:list){
			String date=sdf.format(dto.getViewtime());
			dto.setSdfviewtime(date);
			String description=MyAdViewListDAO.getDescription(dto.getAdno());
			dto.setDescription(description);
		}
		
		//잔고
		int balance=0;
		for(int i=list.size()-1;i>=0;i--){
			balance+=list.get(i).getPoint();
			list.get(i).setBalance(balance);
		}
		
		
		
		
		int totalpage=MyAdViewListDAO.boardTotalPage(id);
		req.setAttribute("curpage", curpage);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("point", balance);
		req.setAttribute("myadviewlist", list);
		req.setAttribute("jsp", "../myinfo/point.jsp");
		
		return "pages/main/main.jsp";
	}

}
