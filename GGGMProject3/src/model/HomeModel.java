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

public class HomeModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		List<AdvertiseDTO> list=
				AdvertiseDAO.aadListData();
		
		
		
		req.setAttribute("count", list);
		req.setAttribute("url", "[미미월드 TV광고] 미미 화장핸드백");
		req.setAttribute("jsp", "/pages/main/home.jsp");
		return "pages/main/main.jsp";
		
	}

}
