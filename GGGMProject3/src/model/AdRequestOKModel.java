package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.AdrequestDAO;
import dao.AdrequestDTO;
import model.Job;
import model.Interest;

public class AdRequestOKModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("EUC-KR");
		
		//파일 (url, image)를 위한 설정
		String path="c:\\download";
		int size=1024*1024*500;
		String enctype="EUC-KR";
		MultipartRequest mr=new MultipartRequest(req,path,size,enctype,new DefaultFileRenamePolicy());
		
		
//		private int adno;
//		private String adid;
//		private String adsubject;
//		private double adtime;
//		private String msg;
//		private String maj_category;
//		private String sub_category;
//		private String url;
//		private String img;
//		private int ppc;
//		private int hit;
//		private String data1;
//		private String data2;
//		private String weight;
//		private String dbday; 
		
//		AdrequestDTO
		
		
		
		//전체 수치로 변경 - data1, data2, wgt
		String adsubject=mr.getParameter("adsubject");
		String url=mr.getOriginalFileName("url");
		String img=mr.getOriginalFileName("img");
		String msg = mr.getParameter("msg");
		String ppc = mr.getParameter("ppc");	//숫자 변경
		String maj_category = mr.getParameter("maj_category");
		String sub_category = mr.getParameter("sub_category");
		String sex=mr.getParameter("sex");
		String min_age= mr.getParameter("min_age");
		String max_age = mr.getParameter("max_age");
		String addr = mr.getParameter("addr");
		String marry = mr.getParameter("marry");
		String[] job = mr.getParameterValues("job");
		for(String j:job){
			System.out.println(j);
		}
		String min_sal= mr.getParameter("min_sal");
		String max_sal= mr.getParameter("max_sal");
		String[] interest = mr.getParameterValues("interest");
		for(String i:interest){
			System.out.println(i);
		}
		
		
		if(adsubject==null)
			adsubject="안들어옴.";
		if(url==null)
			url="안들어옴.";
		if(img==null)
			img="안들어옴.";
		if(msg==null)
			msg="안들어옴.";
		if(ppc==null)
			ppc="안들어옴.";
		if(maj_category==null)
			maj_category="안들어옴.";
		if(sub_category==null)
			sub_category="안들어옴.";
		if(sex==null)
			sex="안들어옴.";
		if(min_age==null)
			min_age="안들어옴.";
		if(max_age==null)
			max_age="안들어옴.";
		if(addr==null)
			addr="안들어옴.";
		if(marry==null)
			marry="안들어옴.";
//		if(job==null)
//			job="안들어옴.";
		if(min_sal==null)
			min_sal="안들어옴.";
		if(max_sal==null)
			max_sal="안들어옴.";
//		if(interest==null)
//			interest="안들어옴.";


		

		return adsubject;
		

//		BoardDTO d = new BoardDTO();
//		d.setName(name);
//		BoardDAO.qnaWrite(d);
//		return "qna_list.do";
	}

}

/*




광고 이미지 name="img"

광고 설명 name="msg"

클릭 당 포인트 name="ppc

카테고리  name="maj_category"
가전, 의류, 음식
카테고리  name="sub_category"
컴퓨터, 휴대폰, 노트북
여성복, 남성복, 아동복
한식, 중식, 양식

 성별 name="sex"
 남자,여자,무관
가중치 = wgt1

나이 min_age 
		a10,a20,a30,a40,a50,a60
	max_age
가중치 = wgt2

주소지 addr
강원, 경기, 경남, 경북, 광주, 대구, 대전, 부산, 서울, 세종, 울산, 인천, 전남, 전북, 제주, 충남, 충북
 가중치 = wgt3

결혼여부 marry
미혼, 기혼, 무관
 가중치 = wgt4

직업 job

학생, 사업가, 운동선수, 주부, 회사원,아티스트, 기타
 가중치 = wgt5

소득
최소 min_sal
s100, s200, s300, s400, s500, s600
   가중치 = wgt6
최대 max_sal

 관심분야 interest
스포츠, 쇼핑, 인터넷, 여행, 독서, 영화감상, 음악감상, 게임, 공연
가중치 = wgt7
*/