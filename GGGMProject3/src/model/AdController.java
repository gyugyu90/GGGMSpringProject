package model;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.Controller;
import controller.RequestMapping;
import dao.AdGraphDAO;
import dao.AdrequestDAO;
import dao.AdrequestDTO;
import dao.AdvertiseDAO;
import dao.AdvertiseDTO;
import dao.RecomDTO;
import dao.ReplyBoardDAO;
import dao.ReplyDTO;
import dao.memberDAO;
import dao.memberDTO;

@Controller("ac")
public class AdController {
	@RequestMapping("ad_index.do")
	public String ad_index(HttpServletRequest req, HttpServletResponse res){

	//handlerRequest부분
		int adno=Integer.parseInt(req.getParameter("adno"));
		System.out.println("adno:"+adno);
		AdvertiseDTO d=AdvertiseDAO.ad_info(adno);
		req.setAttribute("adinfo", d);
		
		int[] sideposter=getRand(adno);
		List<AdvertiseDTO> sidelist=new ArrayList<AdvertiseDTO>();
		for(int i=0;i<sideposter.length;i++){
			AdvertiseDTO side=AdvertiseDAO.side_info(sideposter[i]);
			sidelist.add(side);
		}
		req.setAttribute("sidelist", sidelist);
		
		List<ReplyDTO> list = ReplyBoardDAO.replyListData(adno);
		System.out.println("list size:"+list.size());
		
		String rcurpage=req.getParameter("rcurpage");
		if(rcurpage==null){
			rcurpage="1";
		}
		
		int rtotal=ReplyBoardDAO.replyTotalPage(adno);
		
		req.setAttribute("rcurpage", rcurpage);
		req.setAttribute("rtotal", rtotal);
		req.setAttribute("list", list);
		req.setAttribute("adno", adno);
		req.setAttribute("jsp", "../adview/ad_index.jsp?adno="+adno);
		return "pages/main/main.jsp";
	}
	
	public int[] getRand(int no){
		int[] temp=new int[5];
		int su=0;
		boolean bDash=false;
		for(int i=0;i<5;i++){
			bDash=true;
			while(bDash){
				su=(int)(Math.random()*30)+1;
				if(su==no){
					continue;
				}
				bDash=false;
				for(int j=0;j<i;j++){
					if(temp[j]==su){
						bDash=true;
						break;
					}
				}
			}
			temp[i]=su;
		}
		return temp;
	}
	
	@RequestMapping("adgraphlist.do")
	public String adgraphlist(HttpServletRequest req, HttpServletResponse res){
		HttpSession session=req.getSession();
		String adid=(String)session.getAttribute("id");
		
		List<AdvertiseDTO> list=AdGraphDAO.ListOfAdno(adid);
		System.out.println(list.size());
		req.setAttribute("list", list);
		req.setAttribute("jsp", "../adhost/ad_graph_list.jsp");
		return "pages/main/main.jsp";
	}
	
	@RequestMapping("adgraph.do")
	public String adgraph(HttpServletRequest req, HttpServletResponse res){
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		String adid=id;
		System.out.println("adgraphmodel접근");
		
		int adno=Integer.parseInt(req.getParameter("adno"));
		
		AdvertiseDTO list = AdGraphDAO.AllOfAdno(adno);
		
	/*	int count=AdGraphDAO.AdNoOverlapCount(adno);
		System.out.println(count);
		int nocount=AdGraphDAO.AdOverlapCount(adno);
		System.out.println(nocount);*/
	
		
			List<String> idlist= AdGraphDAO.idOfAdno(adno);
			
		
		
			
			int mancount=AdGraphDAO.manofadno(adno);
			int womancount=AdGraphDAO.womanofadno(adno);
			
			System.out.println(womancount);
			
			
		
			
			
			int age0 = AdGraphDAO.age0(adno);	
			int age1 = AdGraphDAO.age1(adno);
			int age2 = AdGraphDAO.age2(adno);
			int age3 = AdGraphDAO.age3(adno);
			int age4 = AdGraphDAO.age4(adno);
			int age5 = AdGraphDAO.age5(adno);
			int age6 = AdGraphDAO.age6(adno);
			int age7 = AdGraphDAO.age7(adno);
			int age8 = AdGraphDAO.age8(adno);
			
			req.setAttribute("age0", age0);
			req.setAttribute("age1", age1);
			req.setAttribute("age2", age2);
			req.setAttribute("age3", age3);
			req.setAttribute("age4", age4);
			req.setAttribute("age5", age5);
			req.setAttribute("age6", age6);
			req.setAttribute("age7", age7);
			req.setAttribute("age8", age8);
		
			req.setAttribute("mancount", mancount);
			req.setAttribute("womancount", womancount);
		
			/*req.setAttribute("fnocount", nocount);
			req.setAttribute("fcount", count);*/
			
			req.setAttribute("list", list);
			req.setAttribute("id", id);
			req.setAttribute("jsp", "../adhost/ad_graph.jsp");
			System.out.println("debug5");
			return "pages/main/main.jsp";
	}
	
	@RequestMapping("slidebanner.do")
	public String slidebanner(HttpServletRequest req, HttpServletResponse res){
		List<AdvertiseDTO> list=
				AdvertiseDAO.adListData();
		for(AdvertiseDTO d:list){
			System.out.println(d.getAdno());
		}
		System.out.println();
		HttpSession session = req.getSession();
		//session.setAttribute("count", list);
		req.setAttribute("count", list);
		
		req.setAttribute("jsp", "/pages/adview/slidebanner.jsp");
		return "pages/main/main.jsp";
	}
	
	@RequestMapping("admember.do")
	public String admember(HttpServletRequest req, HttpServletResponse res){
		List<AdvertiseDTO> list=
				AdvertiseDAO.adListData();
		for(AdvertiseDTO d:list){
			System.out.println(d.getAdno());
		}
		System.out.println();
		HttpSession session = req.getSession();
		//session.setAttribute("count", list);
		req.setAttribute("count", list);
		
		req.setAttribute("jsp", "/pages/adview/slidebanner.jsp");
		return "pages/main/main.jsp";
	}
	
	@RequestMapping("ad_request.do")
	public String ad_request(HttpServletRequest req, HttpServletResponse res){
		req.setAttribute("jsp","../adhost/adrequest.jsp");
		return "/pages/main/main.jsp";
	}
	
	@RequestMapping("ad_request_ok.do")
	public String ad_request_ok(HttpServletRequest req, HttpServletResponse res){
		try {
		req.setCharacterEncoding("EUC-KR");
		
		//파일 (url, image)를 위한 설정
		String path="c:\\download";
		int size=1024*1024*500;
		String enctype="EUC-KR";
		MultipartRequest mr;
		
			mr = new MultipartRequest(req,path,size,enctype,new DefaultFileRenamePolicy());
		

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
		
		
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return "adboard.do";
//		BoardDTO d = new BoardDTO();
//		d.setName(name);
//		BoardDAO.qnaWrite(d);
//		return "qna_list.do";
	}
	
	@RequestMapping("local.do")
	public String local(HttpServletRequest req, HttpServletResponse res){
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		memberDTO myinfo=memberDAO.getMyInfo(id);
		
//		주소:100-100
//		나이:25
//		성별:남자
//		결혼여부:미혼
//		관심분야:스포츠|쇼핑
//		직업:학생
//		소득수준:100~200

		int mySex=(myinfo.getSex()=="남자"?1:2);
		int myAge=myinfo.getAge();
		int myMaritalStt=(myinfo.getAdd().getIsmarried()=="미혼"?1:2);
		int mySal=Integer.parseInt(myinfo.getAdd().getSalary().substring(0, 3))+50;

		int myAddr=Integer.parseInt(myinfo.getPost().substring(0, 2));
		switch(myAddr){
			case 10: myAddr=9; break;
			case 11: myAddr=9; break;
			case 12: myAddr=9; break;
			case 13: myAddr=9; break;
			case 14: myAddr=9; break;
			case 15: myAddr=9; break;
			case 20: myAddr=1; break;
			case 21: myAddr=1; break;
			case 22: myAddr=1; break;
			case 23: myAddr=1; break;
			case 24: myAddr=1; break;
			case 25: myAddr=1; break;
			case 26: myAddr=1; break;
			case 30: myAddr=7; break;
			case 31: myAddr=16; break;
			case 32: myAddr=16; break;
			case 33: myAddr=16; break;
			case 34: myAddr=16; break;
			case 35: myAddr=16; break;
			case 36: myAddr=17; break;
			case 37: myAddr=17; break;
			case 38: myAddr=17; break;
			case 39: myAddr=17; break;
			case 40: myAddr=17; break;
			case 41: myAddr=2; break;
			case 42: myAddr=2; break;
			case 43: myAddr=2; break;
			case 44: myAddr=2; break;
			case 45: myAddr=2; break;
			case 46: myAddr=2; break;
			case 47: myAddr=2; break;
			case 48: myAddr=2; break;
			case 50: myAddr=2; break;
			case 51: myAddr=13; break;
			case 52: myAddr=13; break;
			case 53: myAddr=13; break;
			case 54: myAddr=13; break;
			case 55: myAddr=13; break;
			case 56: myAddr=14; break;
			case 57: myAddr=14; break;
			case 58: myAddr=14; break;
			case 59: myAddr=14; break;
			case 60: myAddr=8; break;
			case 61: myAddr=8; break;
			case 62: myAddr=3; break;
			case 63: myAddr=3; break;
			case 64: myAddr=3; break;
			case 65: myAddr=3; break;
			case 66: myAddr=3; break;
			case 67: myAddr=3; break;
			case 68: myAddr=3; break;
			case 69: myAddr=3; break;
			case 70: myAddr=3; break;
			case 71: myAddr=4; break;
			case 72: myAddr=4; break;
			case 73: myAddr=4; break;
			case 74: myAddr=4; break;
			case 75: myAddr=4; break;
			case 76: myAddr=4; break;
			case 77: myAddr=4; break;
			case 78: myAddr=4; break;
			case 79: myAddr=4; break;
		}
		
		System.out.println("내지역:"+myAddr);
		
		List<RecomDTO> list=memberDAO.getWeightData();
		
		System.out.println("모델에서 For문 직전");
		int checkval=0;
		for(RecomDTO rdto:list){
			//한 개의 광고에 대해서
			double score=0; 
			 
			String data1=rdto.getData1();
			String data2=rdto.getData1();
			String weight=rdto.getWeight();
			
			StringTokenizer st1=new StringTokenizer(data1, "|");
			StringTokenizer st2=new StringTokenizer(data2, "|");
			StringTokenizer w=new StringTokenizer(weight, "|");
			
			//값 잘라오기
			//성별
			int adSex=Integer.parseInt(st1.nextToken());
			adSex=Integer.parseInt(st2.nextToken());
			double wgtSex=Double.parseDouble(w.nextToken());
			//age
			int adMinAge=Integer.parseInt(st1.nextToken());
			int adMaxAge=Integer.parseInt(st2.nextToken());
			double wgtAge=Double.parseDouble(w.nextToken());
			//addr
			int adAddr=Integer.parseInt(st1.nextToken());
			adAddr=Integer.parseInt(st2.nextToken());
			
			System.out.println();
			
			double wgtAddr=Double.parseDouble(w.nextToken());
			//Marital Stt
			int adMaritalStt = Integer.parseInt(st1.nextToken());
			adMaritalStt = Integer.parseInt(st2.nextToken());
			double wgtMaritalStt=Double.parseDouble(w.nextToken());
			//Job
			int adJob = Integer.parseInt(st1.nextToken());
			adJob = Integer.parseInt(st2.nextToken());
			double wgtJob=Double.parseDouble(w.nextToken());
			//sal
			int adMinSal = Integer.parseInt(st1.nextToken());
			int adMaxSal = Integer.parseInt(st2.nextToken());
			double wgtSal=Double.parseDouble(w.nextToken());
			//interest
			int adInt = Integer.parseInt(st1.nextToken());
			adInt = Integer.parseInt(st2.nextToken());
			double wgtInt=Double.parseDouble(w.nextToken());
			
			if(myAddr==adAddr)
				score=1;

			rdto.setScore(score);
			System.out.println(checkval++ + " 점수: "+score);
			
		}//for문 끝

		for(int i=0;i<list.size();i++){
			System.out.print(list.get(i).getAdno()+" ");
		}
		System.out.println();
		
		//버블정렬
		for(int i=0;i<list.size()-1;i++){
			for(int j=0;j<list.size()-1-i;j++){
				if(list.get(j).getScore()<list.get(j+1).getScore()){
					RecomDTO temp;
					temp=list.get(j);
					list.set(j, list.get(j+1));
					list.set(j+1, temp);
				}
			}
		}
		for(int i=0;i<list.size();i++){
			System.out.print(list.get(i).getAdno()+" ");
		}
		System.out.println();
		System.out.println("정렬 시작 완료");
		
		int noOfAd=0;
		//top 6 만 남기기...
		for(int i=list.size()-1;i>=0;i--){
			if(list.get(i).getScore()<=.95)	
				list.remove(i);
			else{
				noOfAd=i+1;
			}
		}
		
		for(int i=0;i<list.size();i++){
			System.out.print(list.get(i).getAdno()+" ");
		}
		System.out.println();
				
		req.setAttribute("noa", noOfAd);
		req.setAttribute("count", list);
		req.setAttribute("jsp", "/pages/adview/local.jsp");
		return "pages/main/main.jsp";
	}
	
	@RequestMapping("recom.do")
	public String recom(HttpServletRequest req, HttpServletResponse res){
		//일단 내 아이디를 받아야 함
				HttpSession session=req.getSession();
				String id=(String)session.getAttribute("id");
				//그리고 내 정보를 가져옴
				memberDTO myinfo=memberDAO.getMyInfo(id);
				
						
				System.out.println("주소:"+myinfo.getPost());
				System.out.println("나이:"+myinfo.getAge());
				System.out.println("성별:"+myinfo.getSex());
				System.out.println("결혼여부:"+myinfo.getAdd().getIsmarried());
				System.out.println("관심분야:"+myinfo.getAdd().getInterest());
				System.out.println("직업:"+myinfo.getAdd().getJob());
				System.out.println("소득수준:"+myinfo.getAdd().getSalary());
				
//				주소:100-100
//				나이:25
//				성별:남자
//				결혼여부:미혼
//				관심분야:스포츠|쇼핑
//				직업:학생
//				소득수준:100~200

				int mySex=(myinfo.getSex()=="남자"?1:2);
				int myAge=myinfo.getAge();
				int myMaritalStt=(myinfo.getAdd().getIsmarried()=="미혼"?1:2);
				int mySal=Integer.parseInt(myinfo.getAdd().getSalary().substring(0, 3))+50;

				int myAddr=Integer.parseInt(myinfo.getPost().substring(0, 3));
				switch(myAddr){
					case 10: myAddr=9; break;
					case 11: myAddr=9; break;
					case 12: myAddr=9; break;
					case 13: myAddr=9; break;
					case 14: myAddr=9; break;
					case 15: myAddr=9; break;
					case 20: myAddr=1; break;
					case 21: myAddr=1; break;
					case 22: myAddr=1; break;
					case 23: myAddr=1; break;
					case 24: myAddr=1; break;
					case 25: myAddr=1; break;
					case 26: myAddr=1; break;
					case 30: myAddr=7; break;
					case 31: myAddr=16; break;
					case 32: myAddr=16; break;
					case 33: myAddr=16; break;
					case 34: myAddr=16; break;
					case 35: myAddr=16; break;
					case 36: myAddr=17; break;
					case 37: myAddr=17; break;
					case 38: myAddr=17; break;
					case 39: myAddr=17; break;
					case 40: myAddr=17; break;
					case 41: myAddr=2; break;
					case 42: myAddr=2; break;
					case 43: myAddr=2; break;
					case 44: myAddr=2; break;
					case 45: myAddr=2; break;
					case 46: myAddr=2; break;
					case 47: myAddr=2; break;
					case 48: myAddr=2; break;
					case 50: myAddr=2; break;
					case 51: myAddr=13; break;
					case 52: myAddr=13; break;
					case 53: myAddr=13; break;
					case 54: myAddr=13; break;
					case 55: myAddr=13; break;
					case 56: myAddr=14; break;
					case 57: myAddr=14; break;
					case 58: myAddr=14; break;
					case 59: myAddr=14; break;
					case 60: myAddr=8; break;
					case 61: myAddr=8; break;
					case 62: myAddr=3; break;
					case 63: myAddr=3; break;
					case 64: myAddr=3; break;
					case 65: myAddr=3; break;
					case 66: myAddr=3; break;
					case 67: myAddr=3; break;
					case 68: myAddr=3; break;
					case 69: myAddr=3; break;
					case 70: myAddr=3; break;
					case 71: myAddr=4; break;
					case 72: myAddr=4; break;
					case 73: myAddr=4; break;
					case 74: myAddr=4; break;
					case 75: myAddr=4; break;
					case 76: myAddr=4; break;
					case 77: myAddr=4; break;
					case 78: myAddr=4; break;
					case 79: myAddr=4; break;
				}
				
				int myJob=0;
				switch(myinfo.getAdd().getJob()){
				case "학생":
					myJob = 1;
					break;
				case "사업가":
					myJob =2;
					break;
				case "운동선수":
					myJob =4;
					break;
				case "주부":
					myJob =8;
					break;
				case "회사원":
					myJob =16;
					break;
				case "아티스트":
					myJob =32;
					break;
				case "기타":
					myJob =64;
					break;
				}
				
				StringTokenizer tknTemp=new StringTokenizer(myinfo.getAdd().getInterest(), "|");
				int myInterest=0;
				if(tknTemp.hasMoreTokens()){
					switch(tknTemp.nextToken()){
						case "스포츠":
							myInterest +=1;
							if(!tknTemp.hasMoreTokens())
								break;
						case "쇼핑":
							myInterest +=2;
							if(!tknTemp.hasMoreTokens())
								break;
						case "인터넷":
							myInterest +=4;
							if(!tknTemp.hasMoreTokens())
								break;
						case "여행":
							myInterest +=8;
							if(!tknTemp.hasMoreTokens())
								break;
						case "독서":
							myInterest +=16;
							if(!tknTemp.hasMoreTokens())
								break;
						case "영화감상":
							myInterest +=32;
							if(!tknTemp.hasMoreTokens())
								break;
						case "음악감상":
							myInterest +=64;
							if(!tknTemp.hasMoreTokens())
								break;
						case "게임":
							myInterest +=128;
							if(!tknTemp.hasMoreTokens())
								break;
						case "공연":
							myInterest +=256;
								break;
					}
				}
			
				
				List<RecomDTO> list=memberDAO.getWeightData();
				
				
				System.out.println("모델에서 For문 직전");
				int checkval=0;
				for(RecomDTO rdto:list){
					//한 개의 광고에 대해서
					double score=0; 
					 
					String data1=rdto.getData1();
					String data2=rdto.getData1();
					String weight=rdto.getWeight();
					
					StringTokenizer st1=new StringTokenizer(data1, "|");
					StringTokenizer st2=new StringTokenizer(data2, "|");
					StringTokenizer w=new StringTokenizer(weight, "|");
					
					//값 잘라오기
					//성별
					int adSex=Integer.parseInt(st1.nextToken());
					adSex=Integer.parseInt(st2.nextToken());
					double wgtSex=Double.parseDouble(w.nextToken());
					//age
					int adMinAge=Integer.parseInt(st1.nextToken());
					int adMaxAge=Integer.parseInt(st2.nextToken());
					double wgtAge=Double.parseDouble(w.nextToken());
					//addr
					int adAddr=Integer.parseInt(st1.nextToken());
					adAddr=Integer.parseInt(st2.nextToken());
					double wgtAddr=Double.parseDouble(w.nextToken());
					//Marital Stt
					int adMaritalStt = Integer.parseInt(st1.nextToken());
					adMaritalStt = Integer.parseInt(st2.nextToken());
					double wgtMaritalStt=Double.parseDouble(w.nextToken());
					//Job
					int adJob = Integer.parseInt(st1.nextToken());
					adJob = Integer.parseInt(st2.nextToken());
					double wgtJob=Double.parseDouble(w.nextToken());
					//sal
					int adMinSal = Integer.parseInt(st1.nextToken());
					int adMaxSal = Integer.parseInt(st2.nextToken());
					double wgtSal=Double.parseDouble(w.nextToken());
					//interest
					int adInt = Integer.parseInt(st1.nextToken());
					adInt = Integer.parseInt(st2.nextToken());
					double wgtInt=Double.parseDouble(w.nextToken());
					
					//비교 (Masking으로 점수계산)
					//		sex
					if(mySex==adSex)
						score+=wgtSex;
					//		age
					if(adMaxAge==60){
						if (myAge>60)
							score+=wgtAge;
					}else{
						if((myAge<adMaxAge+10)&&(myAge>=adMinAge))
							score+=wgtAge;
						else if((myAge<adMaxAge+10+((adMaxAge-adMinAge)/3))&&(myAge>=adMinAge-((adMaxAge-adMinAge)/3)))
							score+=wgtAge/2;
					}
					//		addr
					if(myAddr==adAddr)
						score+=wgtAddr;
					//		marital Status
					if(myMaritalStt==adMaritalStt)
						score+=wgtMaritalStt;
					//		job
					int adTemp=adJob;
					int myTemp=myJob;
					boolean sentinel = true;
					int i =6;
					
					while(i>=0 && sentinel ){
					
						if( adTemp >= (int)Math.pow(2, i)){
							for(int j=6;j>=i;j--){
								if( myTemp> (int)Math.pow(2, i+1) )
									myTemp-=(int)Math.pow(2, i+1);
								else if( myTemp >= (int)Math.pow(2, i)){
									score+=wgtInt;
									sentinel=false;
									break;
								}
							}
							adTemp-=(int)Math.pow(2, i);
						}
						i--;
					}
					
					//		sal
					if(adMaxSal==600){
						if (mySal>600)
							score+=wgtSal;
					}else{
						if((mySal<adMaxSal+100)&&(mySal>=adMinSal))
							score+=wgtSal;
						else if((myAge<adMaxSal+100+((adMaxSal-adMinSal)/3))&&(mySal>=adMinSal-((adMaxSal-adMinSal)/3)))
							score+=wgtSal/2;
					}
					//		Interest
					adTemp=adInt;
					myTemp=myInterest;
					sentinel = true;
					i =8;
					
					while(i>=0 && sentinel ){
					
						if( adTemp >= (int)Math.pow(2, i)){
							for(int j=8;j>=i;j--){
								if( myTemp> (int)Math.pow(2, i+1) )
									myTemp-=(int)Math.pow(2, i+1);
								else if( myTemp >= (int)Math.pow(2, i)){
									score+=wgtInt;
									sentinel=false;
									break;
								}
							}
							adTemp-=(int)Math.pow(2, i);
						}
						i--;
					}
					
					rdto.setScore(score);
					System.out.println(checkval++ + " 점수: "+score);
					
				}//for문 끝
				System.out.println("모델: for문끝. 정렬 시작 전");
				for(int i=0;i<list.size();i++){
					System.out.print(list.get(i).getAdno()+" ");
				}
				System.out.println();
						
				//버블정렬
				for(int i=0;i<list.size()-1;i++){
					for(int j=0;j<list.size()-1-i;j++){
						if(list.get(j).getScore()<list.get(j+1).getScore()){
							RecomDTO temp;
							temp=list.get(j);
							list.set(j, list.get(j+1));
							list.set(j+1, temp);
						}
					}
				}
				for(int i=0;i<list.size();i++){
					System.out.print(list.get(i).getAdno()+" ");
				}
				System.out.println();
				System.out.println("정렬 시작 완료");
				
				//top 6 만 남기기...
				for(int i=list.size()-1;i>6;i--){
						list.remove(i);
				}
				for(int i=0;i<list.size();i++){
					System.out.print(list.get(i).getAdno()+" ");
				}
				req.setAttribute("count", list);
				req.setAttribute("jsp", "/pages/adview/recom.jsp");
				return "pages/main/main.jsp";
	}
	
	@RequestMapping("reply_delete.do")
	public String reply_delete(HttpServletRequest req, HttpServletResponse res){
		String no=req.getParameter("no");
		String bno=req.getParameter("bno");
		String page=req.getParameter("page");
		
		//req.setAttribute("no", bno);
		//req.setAttribute("page", page);
		ReplyDTO d=ReplyBoardDAO.replyDataInfo(Integer.parseInt(no));
		if(d.getDepth()==0)
		{
			ReplyBoardDAO.replyDelete(Integer.parseInt(no));
		}
		else
		{
			ReplyBoardDAO.replyMsgUpdate(Integer.parseInt(no));
		}
		ReplyBoardDAO.replyDepthDecrement(d.getRoot());
		return "board_content.do?no="+bno+"&page="+page;
	}
	
	@RequestMapping("reply_new_write.do")
	public String reply_new_write(HttpServletRequest req, HttpServletResponse res){
try {
	req.setCharacterEncoding("EUC-KR");
} catch (UnsupportedEncodingException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
		
		String msg=req.getParameter("rmsg");
		
		
		String bno=req.getParameter("bno");
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		System.out.println(bno);
		// DB연동
		ReplyDTO d=new ReplyDTO();
		d.setBno(Integer.parseInt(bno));
		d.setId(id);
		d.setName(name);
		d.setMsg(msg);
		
		ReplyBoardDAO.replyNewWrite(d);
		//Insert완료
		int strNo=Integer.parseInt(req.getParameter("adno"));
		List<ReplyDTO> list = ReplyBoardDAO.replyListData(strNo);
		
		req.setAttribute("no", bno);
		req.setAttribute("list", list);
		req.setAttribute("jsp", "../adview/ad_index.jsp?adno="+strNo);
		return "ad_index.do?adno="+strNo;
	}
	
	@RequestMapping("reply_reply_update.do")
	public String reply_reply_update(HttpServletRequest req, HttpServletResponse res){
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String rmsg=req.getParameter("rmsg");
		String no=req.getParameter("no");
		String bno=req.getParameter("bno");
		String page=req.getParameter("page");
		// DB연동 
		ReplyDTO d=new ReplyDTO();
		d.setNo(Integer.parseInt(no));
		d.setMsg(rmsg);
		// DB
		ReplyBoardDAO.replyUpdate(d);
		// Insert완료 
		return "board_content.do?no="+bno+"&page="+page;
	}
	
	@RequestMapping("reply_reply_write.do")
	public String reply_reply_write(HttpServletRequest req, HttpServletResponse res){
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String rmsg=req.getParameter("rmsg");
		String root=req.getParameter("no");
		String bno=req.getParameter("bno");
		String page=req.getParameter("page");
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		// DB연동 
		ReplyDTO d=new ReplyDTO();
		d.setBno(Integer.parseInt(bno));
		d.setId(id);
		d.setName(name);
		d.setMsg(rmsg);
		// DB
		ReplyDTO parent=
		  ReplyBoardDAO.replyParentInfo(Integer.parseInt(root));
		ReplyBoardDAO.replyStepIncrement(parent);
		d.setGroup_id(parent.getGroup_id());
		d.setGroup_step(parent.getGroup_step()+1);
		d.setGroup_tab(parent.getGroup_tab()+1);
		d.setRoot(Integer.parseInt(root));
		ReplyBoardDAO.replyReplyWrite(d);
		ReplyBoardDAO.replyDepthIncrement(Integer.parseInt(root));
		// Insert완료 
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "board/reply_new_insert.jsp";
	}
	

}
