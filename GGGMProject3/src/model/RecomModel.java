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
		
		//�ϴ� �� ���̵� �޾ƾ� ��
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		//�׸��� �� ������ ������
		memberDTO myinfo=memberDAO.getMyInfo(id);
		
				
		System.out.println("�ּ�:"+myinfo.getPost());
		System.out.println("����:"+myinfo.getAge());
		System.out.println("����:"+myinfo.getSex());
		System.out.println("��ȥ����:"+myinfo.getAdd().getIsmarried());
		System.out.println("���ɺо�:"+myinfo.getAdd().getInterest());
		System.out.println("����:"+myinfo.getAdd().getJob());
		System.out.println("�ҵ����:"+myinfo.getAdd().getSalary());
		
//		�ּ�:100-100
//		����:25
//		����:����
//		��ȥ����:��ȥ
//		���ɺо�:������|����
//		����:�л�
//		�ҵ����:100~200

		int mySex=(myinfo.getSex()=="����"?1:2);
		int myAge=myinfo.getAge();
		int myMaritalStt=(myinfo.getAdd().getIsmarried()=="��ȥ"?1:2);
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
		case "�л�":
			myJob = 1;
			break;
		case "�����":
			myJob =2;
			break;
		case "�����":
			myJob =4;
			break;
		case "�ֺ�":
			myJob =8;
			break;
		case "ȸ���":
			myJob =16;
			break;
		case "��Ƽ��Ʈ":
			myJob =32;
			break;
		case "��Ÿ":
			myJob =64;
			break;
		}
		
		StringTokenizer tknTemp=new StringTokenizer(myinfo.getAdd().getInterest(), "|");
		int myInterest=0;
		if(tknTemp.hasMoreTokens()){
			switch(tknTemp.nextToken()){
				case "������":
					myInterest +=1;
					if(!tknTemp.hasMoreTokens())
						break;
				case "����":
					myInterest +=2;
					if(!tknTemp.hasMoreTokens())
						break;
				case "���ͳ�":
					myInterest +=4;
					if(!tknTemp.hasMoreTokens())
						break;
				case "����":
					myInterest +=8;
					if(!tknTemp.hasMoreTokens())
						break;
				case "����":
					myInterest +=16;
					if(!tknTemp.hasMoreTokens())
						break;
				case "��ȭ����":
					myInterest +=32;
					if(!tknTemp.hasMoreTokens())
						break;
				case "���ǰ���":
					myInterest +=64;
					if(!tknTemp.hasMoreTokens())
						break;
				case "����":
					myInterest +=128;
					if(!tknTemp.hasMoreTokens())
						break;
				case "����":
					myInterest +=256;
						break;
			}
		}
	
		
		List<RecomDTO> list=memberDAO.getWeightData();
		
		System.out.println("�𵨿��� For�� ����");
		int checkval=0;
		for(RecomDTO rdto:list){
			//�� ���� ���� ���ؼ�
			double score=0; 
			 
			String data1=rdto.getData1();
			String data2=rdto.getData1();
			String weight=rdto.getWeight();
			
			StringTokenizer st1=new StringTokenizer(data1, "|");
			StringTokenizer st2=new StringTokenizer(data2, "|");
			StringTokenizer w=new StringTokenizer(weight, "|");
			
			//�� �߶����
			//����
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
			
			//�� (Masking���� �������)
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
			System.out.println(checkval++ + " ����: "+score);
			
		}//for�� ��
		System.out.println("��: for����. ���� ���� ��");
		for(int i=0;i<list.size();i++){
			System.out.print(list.get(i).getAdno()+" ");
		}
		System.out.println();
				
		//��������
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
		System.out.println("���� ���� �Ϸ�");
		
		//top 6 �� �����...
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
