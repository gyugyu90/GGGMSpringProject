package model;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.RequestMapping;
import dao.AdGraphDTO;
import dao.AdvertiseDAO;
import dao.MyAdViewListDAO;
import dao.memberAddDTO;
import dao.memberDAO;
import dao.memberDTO;

@Controller("mic")
public class MyInfoController {
	@RequestMapping("exchange.do")
	public String exchange(HttpServletRequest req, HttpServletResponse res){

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
	@RequestMapping("getpoint.do")
	public String getpoint(HttpServletRequest req, HttpServletResponse res){
		
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//String adno=req.getParameter("adno");
		//String point=req.getParameter("point");
		int adno=Integer.parseInt(req.getParameter("adno"));
		int point=Integer.parseInt(req.getParameter("point"));
		System.out.println("adno:"+adno);
		System.out.println("point:"+point);
		//point 올리기
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
	@RequestMapping("myadviewlist.do")
	public String myadviewlist(HttpServletRequest req, HttpServletResponse res){

		
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
		List<Integer> balList=MyAdViewListDAO.getBalance(id);
		int balance=0;
		for(int i=balList.size()-1;i>=end;i--){
			balance+=balList.get(i);
			//list.get(i).setBalance(balance);
		}
		for(int i=list.size()-1;i>=0;i--){
			balance+=list.get(i).getPoint();
			list.get(i).setBalance(balance);
		}
		int totalpoint=MyAdViewListDAO.totalpoint(id);
		int totalpage=MyAdViewListDAO.boardTotalPage(id);
		req.setAttribute("curpage", curpage);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("point", totalpoint);
		req.setAttribute("myadviewlist", list);
		req.setAttribute("jsp", "../myinfo/point.jsp");
		return "pages/main/main.jsp";

	}
	@RequestMapping("myInfoUpdate.do")
	public String myInfoUpdate(HttpServletRequest req, HttpServletResponse res){
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		String post=req.getParameter("post");
		String addr1=req.getParameter("addr1");
		String addr2=req.getParameter("addr2");
		String tel=req.getParameter("tel");
		String email=req.getParameter("email");
		String email2=req.getParameter("email2");
		String emailreceive=req.getParameter("emailreceive");
		String job=req.getParameter("job");
		String marry=req.getParameter("marry");
		String hobby=req.getParameter("hobby");
		String sal=req.getParameter("sal");
		String bankname=req.getParameter("bankname");
		String account1=req.getParameter("account1");
		memberDTO d=new memberDTO();
		d.setId(id);
		d.setPwd(pwd);
		d.setPost(post);
		d.setAddr1(addr1);
		d.setAddr2(addr2);
		d.setTel(tel);
		d.setEmail(email+"@"+email2);
		d.setEmailreceive(emailreceive);
		System.out.println("수신"+emailreceive);
		memberDAO dao=new memberDAO();
		dao.myInfoUpdate(d);
		memberAddDTO adto=new memberAddDTO();
		// ?name=""&tel=""&interest=""&interest=""
		String[] strinterest=req.getParameterValues("interest");
		int interest=0;
		for(int i=0;i<strinterest.length;i++){
			if(strinterest[i].equals("운동")){
				interest+=1;
			}else if(strinterest[i].equals("쇼핑")){
				interest+=2;
			}else if(strinterest[i].equals("인터넷")){
				interest+=4;
			}else if(strinterest[i].equals("여행")){
				interest+=8;
			}else if(strinterest[i].equals("독서")){
				interest+=16;
			}else if(strinterest[i].equals("영화감상")){
				interest+=32;
			}else if(strinterest[i].equals("음악감상")){
				interest+=64;
			}else if(strinterest[i].equals("게임")){
				interest+=128;
			}else if(strinterest[i].equals("공연")){
				interest+=256;
			}
		}
		adto.setId(id);
		adto.setJob(job);
		adto.setIsmarried(marry);
		adto.setSalary(sal);//
		
		adto.setAccountno(bankname+"은행 "+account1);
		dao.myAddInfoUpdate(adto);
		return "mypage.do";
	}
	@RequestMapping("mypage.do")
	public String mypage(HttpServletRequest req, HttpServletResponse res){
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		System.out.println(id);
		memberDAO dao=new memberDAO();
		memberDTO d=dao.getMemberInfo(id);
		System.out.println(d.getEmail());
		System.out.println(d.getEmailreceive());
		StringTokenizer s=new StringTokenizer(d.getEmail(),"@");
		d.setEmail(s.nextToken());
		System.out.println(d.getEmail());
		req.setAttribute("d", d);
		if(d.getGrade()==1)
		req.setAttribute("jsp", "../myinfo/myPage_user.jsp");
		else if(d.getGrade()==2)
			req.setAttribute("jsp", "../myinfo/myPage_ad.jsp");
		return "pages/main/main.jsp";

	}

}

   