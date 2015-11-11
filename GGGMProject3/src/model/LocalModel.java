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
public class LocalModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
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

}
