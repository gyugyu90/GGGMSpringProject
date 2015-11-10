package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import dao.AdGraphDTO;
import dao.RecomDTO;
import dao.memberAddDTO;
import dao.memberDAO;
import dao.memberDTO;

import java.util.*;
public class RecomModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
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

}
