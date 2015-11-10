package model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdvertiseDAO;
import dao.AdvertiseDTO;
import dao.*;

public class AdListModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		
		List<AdvertiseDTO> list=
				AdvertiseDAO.adListData();
		for(AdvertiseDTO d:list){
			System.out.println(d.getAdno());
		}
		System.out.println();
		HttpSession session = req.getSession();
		//session.setAttribute("count", list);
		req.setAttribute("count", list);
		
		req.setAttribute("jsp", "/pages/adview/slidebanner.jsp");
		return "pages/main/main.jsp";
	}

}
