package model;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;

public class JoinModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("EUC-KR");		
		memberDTO d=new memberDTO();
		System.out.println("model0");
		String grade=req.getParameter("grade");
		if(grade==null){
		String id=req.getParameter("id");
		d.setId(id);
		
		String pwd=req.getParameter("pwd");
		d.setPwd(pwd);
		
		String name=req.getParameter("name");
		d.setName(name);
		
		String sex=req.getParameter("sex");
		d.setSex(sex);
		System.out.println("model1");
		String bday=req.getParameter("bday");
		d.setBirth(Date.valueOf(bday));
		System.out.println("bday:"+bday);
		
		String post=req.getParameter("post");
		d.setPost(post);
		
		String addr1=req.getParameter("addr1");
		String addr2=req.getParameter("addr2");
		d.setAddr1(addr1);
		d.setAddr2(addr2);
		
		String tel1=req.getParameter("tel1");
		String tel2=req.getParameter("tel2");
		String tel3=req.getParameter("tel3");
		d.setTel(tel1+"-"+tel2+"-"+tel3);
		System.out.println("model2");
		String email=req.getParameter("email");
		String email2=req.getParameter("email2");
		d.setEmail(email+"@"+email2);
		
		String emailreceive=req.getParameter("emailreceive");
		d.setEmailreceive(emailreceive);
		
		String job=req.getParameter("job");
		String marry=req.getParameter("marry");
		String[] hobby=req.getParameterValues("hobby");
		String sal=req.getParameter("sal");
		String bankname=req.getParameter("bankname");
		String account1=req.getParameter("account1");
		String account2=req.getParameter("account2");
		String account3=req.getParameter("account3");
		System.out.println("model3");
		SignupDAO.memberJoin(d);
		System.out.println("model4");
		}else{
			String id=req.getParameter("id");
			d.setId(id);
			
			String pwd=req.getParameter("pwd");
			d.setPwd(pwd);
			
			String name=req.getParameter("name");
			d.setName(name);
			
			String sex=req.getParameter("sex");
			d.setSex(sex);
			System.out.println("model1");
			String bday=req.getParameter("bday");
			d.setBirth(Date.valueOf(bday));
			System.out.println("bday:"+bday);
			
			String post=req.getParameter("post");
			d.setPost(post);
			
			String addr1=req.getParameter("addr1");
			String addr2=req.getParameter("addr2");
			d.setAddr1(addr1);
			d.setAddr2(addr2);
			
			String tel1=req.getParameter("tel1");
			String tel2=req.getParameter("tel2");
			String tel3=req.getParameter("tel3");
			d.setTel(tel1+"-"+tel2+"-"+tel3);
			System.out.println("model2");
			String email=req.getParameter("email");
			String email2=req.getParameter("email2");
			d.setEmail(email+"@"+email2);
			
			String emailreceive=req.getParameter("emailreceive");
			System.out.println(emailreceive);
			d.setEmailreceive(emailreceive);
			d.setGrade(Integer.parseInt(grade));
			
			String companyname=req.getParameter("companyname");
			
			d.setCompanyname(companyname);
			SignupDAO.admemberJoin(d);
		}
		
		return "join_ok.jsp";
	}

}
