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
		System.out.println("설정완료 이전");
		String sex="무관";
		if(dt1[0]=="1")
			sex="남자";
		else if(dt1[0]=="2")
			sex="여자";
		
		
		String min_age=dt1[1];
		String max_age=(""+Integer.parseInt(dt2[1])+9);
		
		String addr=dt1[2];
		switch(dt1[2]){
			case"1": addr="강원"; break;
			case"2": addr="경기"; break;
			case"3": addr="경남"; break;
			case"4": addr="경북"; break;
			case"5": addr="광주"; break;
			case"6": addr="대구"; break;
			case"7": addr="대전"; break;
			case"8": addr="부산"; break;
			case"9": addr="서울"; break;
			case"10": addr="세종"; break;
			case"11": addr="울산"; break;
			case"12": addr="인천"; break;
			case"13": addr="전남"; break;
			case"14": addr="전북"; break;
			case"15": addr="제주"; break;
			case"16": addr="충남"; break;
			case"17": addr="충북"; break;
		}
		
		String marry="무관";
		if(dt1[3]=="1")
			marry="미혼";
		else if(dt1[3]=="2")
			marry="기혼";
		
		int jtotal=Integer.parseInt(dt1[4]);
	
		String tgtJob="";
		
		if(jtotal>=64){
			jtotal-=64;
			tgtJob+="기타 ";
		}
		if(jtotal>=32){
			jtotal-=32;
			tgtJob+="아티스트 ";
		}
		if(jtotal>=16){
			jtotal-=16;
			tgtJob+="회사원 ";
		}
		if(jtotal>=8){
			jtotal-=8;
			tgtJob+="주부 ";
		}
		if(jtotal>=4){
			jtotal-=4;
			tgtJob+="운동선수 ";
		}
		if(jtotal>=2){
			jtotal-=2;
			tgtJob+="사업가 ";
		}
		if(jtotal>=1){
			jtotal-=1;
			tgtJob+="학생";
		}
	
		
		String min_sal=dt1[5];
		String max_sal=dt2[5];
		
		int itotal=Integer.parseInt(dt1[6]);
		String tgtInterest="";
		
		if(itotal>=256){
			itotal-=256;
			tgtInterest+="공연 ";
		}
		if(itotal>=128){
			itotal-=128;
			tgtInterest+="게임 ";
		}
		if(itotal>=64){
			itotal-=64;
			tgtInterest+="음악감상 ";
		}
		if(itotal>=32){
			itotal-=32;
			tgtInterest+="영화감상 ";
		}
		if(itotal>=16){
			itotal-=16;
			tgtInterest+="독서 ";
		}
		if(itotal>=8){
			itotal-=8;
			tgtInterest+="여행 ";
		}
		if(itotal>=4){
			itotal-=4;
			tgtInterest+="인터넷 ";
		}
		if(itotal>=2){
			itotal-=2;
			tgtInterest+="쇼핑 ";
		}
		if(itotal>=1){
			itotal-=1;
			tgtInterest+="스포츠";
		}
		
		req.setAttribute("d", d);
//		풀어서 보낸다.
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
		System.out.println("설정완료");
		return "pages/main/main.jsp";
	}

}
