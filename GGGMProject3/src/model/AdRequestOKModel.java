package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

		//전체 수치로 변경 - data1, data2, wgt
		String adsubject=mr.getParameter("adsubject");
		String url=mr.getOriginalFileName("url");
		System.out.println(url);
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
		String min_sal= mr.getParameter("min_sal");
		String max_sal= mr.getParameter("max_sal");
		String[] interest = mr.getParameterValues("interest");
		System.out.println(maj_category);
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

		double[] wgt  = new double[7];
		try {
			for(int i=1;i<=7;i++){
				wgt[i-1]=Double.parseDouble(mr.getParameter(("wgt"+i)));
				System.out.println(wgt[i-1]);
			}
		} catch (Exception e) {
			System.out.println("parsedouble:"+e.getMessage());
			//되돌리기
		}
		
		AdrequestDTO d = new AdrequestDTO();
		
		
		d.setAdid((String)req.getSession().getAttribute("id"));
//		private int adno;===자동증가
//		private String adid;===불러오기 세션
//		private String adsubject;
		d.setAdsubject(adsubject);
//		private double adtime; === 관리자 증가
//		private String msg;
		d.setMsg(msg);

//		private String maj_category;
		d.setMaj_category(maj_category);
		System.out.println(d.getMaj_category());
//		private String sub_category;
		d.setSub_category(sub_category);
//		private String url;
		d.setUrl(url);
//		private String img;
		d.setImg(img);
//		private int ppc;
		try {
			d.setPpc(Integer.parseInt(ppc));
		} catch (Exception e) {
			System.out.println("setppc:"+e.getMessage());
			//되돌려 주기...
		}
		
//		private int hit; ==== 자동증가
//		private String data1;
		
		String data1="";
		String data2="";
		String weight="";
		
		int jTotal=0;
		for(String j:job){
			jTotal=jTotal+Integer.parseInt(j);
		}
		
		int iTotal=0;
		for(String i:interest){
			iTotal=iTotal+Integer.parseInt(i);
		}
		
		data1=sex+"|"+min_age+"|"+addr+"|"+marry+"|"+jTotal+"|"+min_sal+"|"+iTotal;
		data2=sex+"|"+max_age+"|"+addr+"|"+marry+"|"+jTotal+"|"+max_sal+"|"+iTotal;
		for(int i=0;i<7;i++){
			weight=weight+wgt[i];
			if(i<6)
				weight=weight+"|";
		}
		
		
		d.setData1(data1);
		d.setData2(data2);
		d.setWeight(weight);
		
		
		AdrequestDAO dao = new AdrequestDAO();
		dao.adRequestInsert(d);
		
		return "adboard.do";
		

//		BoardDTO d = new BoardDTO();
//		d.setName(name);
//		BoardDAO.qnaWrite(d);
//		return "qna_list.do";
	}

}
