package model;

import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdrequestDAO;
import dao.AdrequestDTO;

public class AdminAdBoardInfoModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String adid=req.getParameter("adid");
		AdrequestDAO dao=new AdrequestDAO();
		AdrequestDTO d=dao.adReqInfo(adid);
		StringTokenizer st=new StringTokenizer(d.getWeight(), "|");
		String[] weight=new String[7];
		int k=0;
		while(st.hasMoreTokens()){
			weight[k]=st.nextToken();			
			k++;
		}
		System.out.println(d.getData1());
		System.out.println(d.getData2());
		st=new StringTokenizer(d.getData1(), "|");
		StringTokenizer st2=new StringTokenizer(d.getData2(), "|");
		String[] dt1=new String[7];
		String[] dt2=new String[7];
		
		k=0;
		System.out.println("1");
		while(st.hasMoreTokens()&&st2.hasMoreTokens()&&(k<7)){
			dt1[k]=st.nextToken();
			dt2[k]=st2.nextToken();
			k++;
		}
		System.out.println("�����Ϸ� ����");
		String sex="����";
		if(dt1[0]=="1")
			sex="����";
		else if(dt1[0]=="2")
			sex="����";
		
		
		String min_age=dt1[1];
		String max_age=(""+Integer.parseInt(dt2[1])+9);
		
		String addr=dt1[2];
		switch(dt1[2]){
			case"1": addr="����"; break;
			case"2": addr="���"; break;
			case"3": addr="�泲"; break;
			case"4": addr="���"; break;
			case"5": addr="����"; break;
			case"6": addr="�뱸"; break;
			case"7": addr="����"; break;
			case"8": addr="�λ�"; break;
			case"9": addr="����"; break;
			case"10": addr="����"; break;
			case"11": addr="���"; break;
			case"12": addr="��õ"; break;
			case"13": addr="����"; break;
			case"14": addr="����"; break;
			case"15": addr="����"; break;
			case"16": addr="�泲"; break;
			case"17": addr="���"; break;
		}
		
		String marry="����";
		if(dt1[3]=="1")
			marry="��ȥ";
		else if(dt1[3]=="2")
			marry="��ȥ";
		
		int jtotal=Integer.parseInt(dt1[4]);
	
		String tgtJob="";
		
		if(jtotal>=64){
			jtotal-=64;
			tgtJob+="��Ÿ ";
		}
		if(jtotal>=32){
			jtotal-=32;
			tgtJob+="��Ƽ��Ʈ ";
		}
		if(jtotal>=16){
			jtotal-=16;
			tgtJob+="ȸ��� ";
		}
		if(jtotal>=8){
			jtotal-=8;
			tgtJob+="�ֺ� ";
		}
		if(jtotal>=4){
			jtotal-=4;
			tgtJob+="����� ";
		}
		if(jtotal>=2){
			jtotal-=2;
			tgtJob+="����� ";
		}
		if(jtotal>=1){
			jtotal-=1;
			tgtJob+="�л�";
		}
	
		
		String min_sal=dt1[5];
		String max_sal=dt2[5];
		
		int itotal=Integer.parseInt(dt1[6]);
		String tgtInterest="";
		
		if(itotal>=256){
			itotal-=256;
			tgtInterest+="���� ";
		}
		if(itotal>=128){
			itotal-=128;
			tgtInterest+="���� ";
		}
		if(itotal>=64){
			itotal-=64;
			tgtInterest+="���ǰ��� ";
		}
		if(itotal>=32){
			itotal-=32;
			tgtInterest+="��ȭ���� ";
		}
		if(itotal>=16){
			itotal-=16;
			tgtInterest+="���� ";
		}
		if(itotal>=8){
			itotal-=8;
			tgtInterest+="���� ";
		}
		if(itotal>=4){
			itotal-=4;
			tgtInterest+="���ͳ� ";
		}
		if(itotal>=2){
			itotal-=2;
			tgtInterest+="���� ";
		}
		if(itotal>=1){
			itotal-=1;
			tgtInterest+="������";
		}
		
		req.setAttribute("d", d);
//		Ǯ� ������.
		req.setAttribute("sex", sex);
		req.setAttribute("min_age", min_age);
		req.setAttribute("max_age", max_age);
		req.setAttribute("addr", addr);
		req.setAttribute("marry", marry);
		req.setAttribute("min_sal", min_sal);
		req.setAttribute("max_sal", max_sal);
		req.setAttribute("tgtJob", tgtJob);
		req.setAttribute("tgtInterest", tgtInterest);
		
		
		req.setAttribute("weight", weight);
		req.setAttribute("jsp", "../Admin/board/AdminAdBoardInfo.jsp");
		System.out.println("�����Ϸ�");
		return "pages/main/main.jsp";
	}

}
