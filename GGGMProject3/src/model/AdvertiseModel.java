package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdvertiseDAO;
import dao.AdvertiseDTO;
import dao.memberDAO;
import dao.memberDTO;

public class AdvertiseModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		
		List<AdvertiseDTO> list=AdvertiseDAO.adListData();	
		req.setAttribute("list", list);
		req.setAttribute("jsp", "pages/Admin/member/AdminMember.jsp");
		
		return "main/main.jsp";
	}

}
