package model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdGraphDTO;
import dao.AdvertiseDAO;

public class GetPointModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
			
		req.setCharacterEncoding("EUC-KR");
		String adno=req.getParameter("adno");
		//String point=req.getParameter("point");
		//int adno=Integer.parseInt(req.getParameter("adno"));
		int point=Integer.parseInt(req.getParameter("point"));
		System.out.println("adno:"+adno);
		System.out.println("point:"+point);
		//point ¿Ã¸®±â
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		Map map=new HashMap();
		map.put("id", id);
		System.out.println("id:"+id);
		
		map.put("point", point);
		System.out.println("point:"+point);
		AdvertiseDAO.getpoint(map);
		
		AdGraphDTO mdto=new AdGraphDTO();
		mdto.setAdno(adno);
		mdto.setId(id);
		mdto.setPoint(point);
		AdvertiseDAO.insertMyadviewlist(mdto);
		
		return null;
	}

}
