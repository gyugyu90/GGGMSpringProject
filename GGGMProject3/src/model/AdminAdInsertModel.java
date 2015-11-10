package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdrequestDAO;
import dao.AdrequestDTO;
import dao.AdvertiseDTO;

public class AdminAdInsertModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String adno=req.getParameter("adno");
		System.out.println(adno);
		AdrequestDAO dao=new AdrequestDAO();
		AdrequestDTO d=dao.adReqInfo(adno);
		dao.adInsert(d);		
		dao.adReqDelete(Integer.parseInt(adno));
		
		return "adboard.do";
	}

}
