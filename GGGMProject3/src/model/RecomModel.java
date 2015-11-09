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
		
		
		List<RecomDTO> list=memberDAO.getWeightData();
		
		for(RecomDTO rdto:list){
			//한 개의 광고에 대해서
			int point=0; 
			 
			String data1=rdto.getData1();
			String data2=rdto.getData1();
			String weight=rdto.getWeight();
			StringTokenizer st1=new StringTokenizer(data1, "|");
			StringTokenizer st2=new StringTokenizer(data2, "|");
			StringTokenizer w=new StringTokenizer(weight, "|");
			//성별
			int sex1=Integer.parseInt(st1.nextToken());//여기는 최소 최대가 없음
			int sex2=Integer.parseInt(st2.nextToken());
			int sexweight=Integer.parseInt(w.nextToken());
			
			if(myinfo.getSex().equals("남자")){
				if(sex1==1 || sex1==3){
					point+=sexweight;
				}
			}
			else if(myinfo.getSex().equals("여자")){
				if(sex1==2 || sex1==3){
					point+=sexweight;
				}
			}
			
			//나이
			int agemin=Integer.parseInt(st1.nextToken());
			int agemax=Integer.parseInt(st2.nextToken());
			int ageweight=Integer.parseInt(w.nextToken());
			
			if(myinfo.getAge()>=agemin && myinfo.getAge()<=agemax){
				point+=ageweight;
			}
			
			
			/**2진법으로 바꿔야함*/
			//지역
			int region1=Integer.parseInt(st1.nextToken());//여기는 최소 최대가 없음
			int region2=Integer.parseInt(st2.nextToken());
			int regionweight=Integer.parseInt(w.nextToken());
			
			int myregion=Integer.parseInt(myinfo.getPost());
			if(myregion==region1){
				point+=regionweight;
			}
			
			//결혼여부
			int ismarried1=Integer.parseInt(st1.nextToken());//여기는 최소 최대가 없음
			int ismarried2=Integer.parseInt(st2.nextToken());
			int ismarriedweight=Integer.parseInt(w.nextToken());
			
			if(myinfo.getAdd().getIsmarried().equals("미혼")){
				if(ismarried1==1 || ismarried1==3){//미혼, 무관
					point+=regionweight;
				}
			}else if(myinfo.getAdd().getIsmarried().equals("기혼")){
				if(ismarried1==2 || ismarried1==3){//기혼, 무관
					point+=regionweight;
				}
			}
			
			//직업
			int job1=Integer.parseInt(st1.nextToken());//여기는 최소 최대가 없음
			int job2=Integer.parseInt(st2.nextToken());
			int jobweight=Integer.parseInt(w.nextToken());
			
			String myjob=myinfo.getAdd().getJob();
			
			String[] jobform=new String[]{
				"학생", "사업가", "운동선수", "주부", "직장인", "아티스트", "기타"
			};
			for(int i=0;i<jobform.length;i++){
				job1=job1%2;//2씩 나눈 나머지
				if(job1==1){//광고주가 타겟 직업을 설정하고
					if(myjob.equals(jobform[i])){//내 직업이 해당되면
						point+=jobweight;//점수를 올림
					}
				}
			}
			
			//소득수준
			int salarymin=Integer.parseInt(st1.nextToken());
			int salarymax=Integer.parseInt(st2.nextToken());
			int salaryweight=Integer.parseInt(w.nextToken());
			
			StringTokenizer st=new StringTokenizer(myinfo.getAdd().getSalary(),"~");
			int mysalmin=Integer.parseInt(st.nextToken());
			int mysalmax=Integer.parseInt(st.nextToken());
			
			int mysal=(mysalmin+mysalmax)/2;
			if(salarymin<=mysal && mysal<=salarymax){
				point+=salaryweight;
			}
			
			//관심분야
			int interest1=Integer.parseInt(st1.nextToken());//여기는 최소 최대가 없음
			int interest2=Integer.parseInt(st2.nextToken());
			int interestweight=Integer.parseInt(w.nextToken());
			
			String myinterest=myinfo.getAdd().getInterest();
			StringTokenizer ist=new StringTokenizer(myinterest, "|");
			ArrayList<String> iarr=new ArrayList<String>();
			while(ist.hasMoreTokens()){
				iarr.add(ist.nextToken());
			}
			int hasone=0;
			if(interest1%256==1){
				for(String s:iarr){
					if(s.equals("공연")){
						hasone+=1;
					}
				}
			}
			if(interest1%128==1){
				for(String s:iarr){
					if(s.equals("게임")){
						hasone+=1;
					}
				}
			}
			if(interest1%64==1){
				for(String s:iarr){
					if(s.equals("음악감상")){
						hasone+=1;
					}
				}
			}
			if(hasone>0){
				point+=interestweight;
			}
			rdto.setPoint(point);
		}//for문 끝
		
		//버블정렬
		for(int i=0;i<list.size()-1;i++){
			for(int j=0;j<list.size()-1-i;j++){
				if(list.get(j).getPoint()>list.get(j+1).getPoint()){
					RecomDTO temp;
					temp=list.get(j);
					list.set(j, list.get(j+1));
					list.set(j+1, temp);
				}
			}
		}
		
		req.setAttribute("recomlist", list);
		return null;
	}

}
