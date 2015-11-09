package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.memberAddDTO;
import dao.memberDAO;
import dao.memberDTO;

public class myInfoUpdateModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("EUC-KR");
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
		System.out.println("����"+emailreceive);
		memberDAO dao=new memberDAO();
		dao.myInfoUpdate(d);
		memberAddDTO adto=new memberAddDTO();
		// ?name=""&tel=""&interest=""&interest=""
		String[] strinterest=req.getParameterValues("interest");
		int interest=0;
		for(int i=0;i<strinterest.length;i++){
			if(strinterest[i].equals("�")){
				interest+=1;
			}else if(strinterest[i].equals("����")){
				interest+=2;
			}else if(strinterest[i].equals("���ͳ�")){
				interest+=4;
			}else if(strinterest[i].equals("����")){
				interest+=8;
			}else if(strinterest[i].equals("����")){
				interest+=16;
			}else if(strinterest[i].equals("��ȭ����")){
				interest+=32;
			}else if(strinterest[i].equals("���ǰ���")){
				interest+=64;
			}else if(strinterest[i].equals("����")){
				interest+=128;
			}else if(strinterest[i].equals("����")){
				interest+=256;
			}
		}
		adto.setId(id);
		adto.setJob(job);
		adto.setIsmarried(marry);
		adto.setSalary(sal);//
		
		adto.setAccountno(bankname+"���� "+account1);
		dao.myAddInfoUpdate(adto);
		return "mypage.do";
	}

}
