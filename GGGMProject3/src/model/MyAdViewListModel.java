package model;

import java.text.SimpleDateFormat;
import java.util.List;

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
		
		//날짜 바꾸기
		List<AdGraphDTO> list=MyAdViewListDAO.adListData(id);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		for(AdGraphDTO dto:list){
			String date=sdf.format(dto.getViewtime());
			dto.setSdfviewtime(date);
		}
		
		//보유 포인트
		
		
		req.setAttribute("myadviewlist", list);
		req.setAttribute("jsp", "../myinfo/point.jsp");
		
		return "pages/main/main.jsp";
	}

}
