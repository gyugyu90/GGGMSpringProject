package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdrequestDAO;
import dao.AdrequestDTO;
import dao.AdvertiseDTO;

public class AdminAdInsertModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String adid=req.getParameter("adid");
		System.out.println(adid);
		AdrequestDAO dao=new AdrequestDAO();
		AdrequestDTO d=dao.adReqInfo(adid);
		AdvertiseDTO dto=new AdvertiseDTO();
		dto.setAdid(d.getAdid());
		dto.setAdsubject(d.getAdsubject());
		dto.setUrl(d.getUrl());
		dto.setImg(d.getImg());
		dto.setMsg(d.getMsg());
		dto.setMaj_category(d.getMaj_category());
		dto.setSub_category(d.getSub_category());
		dao.adInsert(dto);
		dao.adReqDelete(adid);
		return "adboard.do";
	}

}
