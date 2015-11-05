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
		
		//���� (url, image)�� ���� ����
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


		

		return adsubject;
		

//		BoardDTO d = new BoardDTO();
//		d.setName(name);
//		BoardDAO.qnaWrite(d);
//		return "qna_list.do";
	}

}

/*




���� �̹��� name="img"

���� ���� name="msg"

Ŭ�� �� ����Ʈ name="ppc

ī�װ�  name="maj_category"
����, �Ƿ�, ����
ī�װ�  name="sub_category"
��ǻ��, �޴���, ��Ʈ��
������, ������, �Ƶ���
�ѽ�, �߽�, ���

 ���� name="sex"
 ����,����,����
����ġ = wgt1

���� min_age 
		a10,a20,a30,a40,a50,a60
	max_age
����ġ = wgt2

�ּ��� addr
����, ���, �泲, ���, ����, �뱸, ����, �λ�, ����, ����, ���, ��õ, ����, ����, ����, �泲, ���
 ����ġ = wgt3

��ȥ���� marry
��ȥ, ��ȥ, ����
 ����ġ = wgt4

���� job

�л�, �����, �����, �ֺ�, ȸ���,��Ƽ��Ʈ, ��Ÿ
 ����ġ = wgt5

�ҵ�
�ּ� min_sal
s100, s200, s300, s400, s500, s600
   ����ġ = wgt6
�ִ� max_sal

 ���ɺо� interest
������, ����, ���ͳ�, ����, ����, ��ȭ����, ���ǰ���, ����, ����
����ġ = wgt7
*/