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
		
		//���� (url, image)�� ���� ����
		String path="c:\\download";
		int size=1024*1024*500;
		String enctype="EUC-KR";
		MultipartRequest mr=new MultipartRequest(req,path,size,enctype,new DefaultFileRenamePolicy());

		//��ü ��ġ�� ���� - data1, data2, wgt
		String adsubject=mr.getParameter("adsubject");
		String url=mr.getOriginalFileName("url");
		String img=mr.getOriginalFileName("img");
		String msg = mr.getParameter("msg");
		String ppc = mr.getParameter("ppc");	//���� ����
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
		
		if(adsubject==null)
			adsubject="�ȵ���.";
		if(url==null)
			url="�ȵ���.";
		if(img==null)
			img="�ȵ���.";
		if(msg==null)
			msg="�ȵ���.";
		if(ppc==null)
			ppc="�ȵ���.";
		if(maj_category==null)
			maj_category="�ȵ���.";
		if(sub_category==null)
			sub_category="�ȵ���.";
		if(sex==null)
			sex="�ȵ���.";
		if(min_age==null)
			min_age="�ȵ���.";
		if(max_age==null)
			max_age="�ȵ���.";
		if(addr==null)
			addr="�ȵ���.";
		if(marry==null)
			marry="�ȵ���.";
//		if(job==null)
//			job="�ȵ���.";
		if(min_sal==null)
			min_sal="�ȵ���.";
		if(max_sal==null)
			max_sal="�ȵ���.";
//		if(interest==null)
//			interest="�ȵ���.";

		double[] wgt  = new double[7];
		try {
			for(int i=1;i<=7;i++){
				wgt[i-1]=Double.parseDouble(mr.getParameter(("wgt"+i)));
				System.out.println(wgt[i-1]);
			}
		} catch (Exception e) {
			System.out.println("parsedouble:"+e.getMessage());
			//�ǵ�����
		}
		
		AdrequestDTO d = new AdrequestDTO();
		
		
		d.setAdid((String)req.getSession().getAttribute("id"));
//		private int adno;===�ڵ�����
//		private String adid;===�ҷ����� ����
//		private String adsubject;
		d.setAdsubject(adsubject);
//		private double adtime; === ������ ����
//		private String msg;
		d.setMsg(msg);

//		private String maj_category;
		d.setMaj_category(maj_category);
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
			//�ǵ��� �ֱ�...
		}
		
//		private int hit; ==== �ڵ�����
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
		
		return "main.do";
		

//		BoardDTO d = new BoardDTO();
//		d.setName(name);
//		BoardDAO.qnaWrite(d);
//		return "qna_list.do";
	}

}