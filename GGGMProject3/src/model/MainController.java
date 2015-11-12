package model;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.RequestMapping;
import dao.AdvertiseDAO;
import dao.AdvertiseDTO;
import dao.SignupDAO;
import dao.ZipcodeDTO;
import dao.memberAddDTO;
import dao.memberDTO;

@Controller("mc")
public class MainController {
	
	   @RequestMapping("fullpageMain.do")
	   public String fullpageMain(HttpServletRequest req, HttpServletResponse res){
		   return "fullpageMain.jsp";
	   }

	   @RequestMapping("home.do")
	   public String home(HttpServletRequest req, HttpServletResponse res){
		 //handlerRequest부분
		   List<AdvertiseDTO> list=
					AdvertiseDAO.aadListData();
			req.setAttribute("count", list);
			req.setAttribute("url", "[미미월드 TV광고] 미미 화장핸드백");
			req.setAttribute("jsp", "/pages/main/home.jsp");
			return "pages/main/main.jsp";
	   }
	
	   @RequestMapping("idcheck.do")
	   public String idcheck(HttpServletRequest req, HttpServletResponse res){
		 //handlerRequest부분
		  /* req.setCharacterEncoding("EUC-KR");*/
			String id=req.getParameter("id");
			
			int bcheck=SignupDAO.idcheck(id);
			System.out.println("bcheck:"+bcheck);
			req.setAttribute("idcheck", 2-bcheck);
			req.setAttribute("usableId", id);
			return "pages/member/idcheck.jsp";
	   }
	   @RequestMapping("join.do")
	   public String join(HttpServletRequest req, HttpServletResponse res){
		 //handlerRequest부분
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
			memberAddDTO add=new memberAddDTO();
			
			int sum=0;
			for(int i=0;i<hobby.length;i++){
				sum=sum+Integer.parseInt(hobby[i]);
			}
			String interest=Integer.toString(sum);
			add.setJob(job);
			add.setInterest(interest);
			add.setIsmarried(marry);
			add.setSalary(sal);
			add.setAccountno(bankname+account1+account2+account3);
			add.setId(id);
			SignupDAO.memberAddData(add);
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
			
			return "pages/member/join_ok.jsp";
	   }
	   @RequestMapping("main.do")
	   public String main(HttpServletRequest req, HttpServletResponse res){
		 //handlerRequest부분
		   req.setAttribute("jsp", "home.jsp");
			return "pages/main/main.jsp";
		   
	   }
	   @RequestMapping("postfind.do")
	   public String postfind(HttpServletRequest req, HttpServletResponse res){
		 //handlerRequest부분
		   String dong=req.getParameter("dong");
		    
		    int count=SignupDAO.postFindCount(dong);
		    
		    List<ZipcodeDTO> list=SignupDAO.postFindData(dong);
		    req.setAttribute("count", count);
		    req.setAttribute("list", list);
		    System.out.println("size:"+list.size());
			return "pages/member/postfind_result.jsp";
	   }	  
}
