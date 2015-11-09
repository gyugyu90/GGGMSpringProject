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
		
		
		List<RecomDTO> list=memberDAO.getWeightData();
		
		for(RecomDTO rdto:list){
			//�� ���� ���� ���ؼ�
			int point=0; 
			 
			String data1=rdto.getData1();
			String data2=rdto.getData1();
			String weight=rdto.getWeight();
			StringTokenizer st1=new StringTokenizer(data1, "|");
			StringTokenizer st2=new StringTokenizer(data2, "|");
			StringTokenizer w=new StringTokenizer(weight, "|");
			//����
			int sex1=Integer.parseInt(st1.nextToken());//����� �ּ� �ִ밡 ����
			int sex2=Integer.parseInt(st2.nextToken());
			int sexweight=Integer.parseInt(w.nextToken());
			
			if(myinfo.getSex().equals("����")){
				if(sex1==1 || sex1==3){
					point+=sexweight;
				}
			}
			else if(myinfo.getSex().equals("����")){
				if(sex1==2 || sex1==3){
					point+=sexweight;
				}
			}
			
			//����
			int agemin=Integer.parseInt(st1.nextToken());
			int agemax=Integer.parseInt(st2.nextToken());
			int ageweight=Integer.parseInt(w.nextToken());
			
			if(myinfo.getAge()>=agemin && myinfo.getAge()<=agemax){
				point+=ageweight;
			}
			
			
			/**2�������� �ٲ����*/
			//����
			int region1=Integer.parseInt(st1.nextToken());//����� �ּ� �ִ밡 ����
			int region2=Integer.parseInt(st2.nextToken());
			int regionweight=Integer.parseInt(w.nextToken());
			
			int myregion=Integer.parseInt(myinfo.getPost());
			if(myregion==region1){
				point+=regionweight;
			}
			
			//��ȥ����
			int ismarried1=Integer.parseInt(st1.nextToken());//����� �ּ� �ִ밡 ����
			int ismarried2=Integer.parseInt(st2.nextToken());
			int ismarriedweight=Integer.parseInt(w.nextToken());
			
			if(myinfo.getAdd().getIsmarried().equals("��ȥ")){
				if(ismarried1==1 || ismarried1==3){//��ȥ, ����
					point+=regionweight;
				}
			}else if(myinfo.getAdd().getIsmarried().equals("��ȥ")){
				if(ismarried1==2 || ismarried1==3){//��ȥ, ����
					point+=regionweight;
				}
			}
			
			//����
			int job1=Integer.parseInt(st1.nextToken());//����� �ּ� �ִ밡 ����
			int job2=Integer.parseInt(st2.nextToken());
			int jobweight=Integer.parseInt(w.nextToken());
			
			String myjob=myinfo.getAdd().getJob();
			
			String[] jobform=new String[]{
				"�л�", "�����", "�����", "�ֺ�", "������", "��Ƽ��Ʈ", "��Ÿ"
			};
			for(int i=0;i<jobform.length;i++){
				job1=job1%2;//2�� ���� ������
				if(job1==1){//�����ְ� Ÿ�� ������ �����ϰ�
					if(myjob.equals(jobform[i])){//�� ������ �ش�Ǹ�
						point+=jobweight;//������ �ø�
					}
				}
			}
			
			//�ҵ����
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
			
			//���ɺо�
			int interest1=Integer.parseInt(st1.nextToken());//����� �ּ� �ִ밡 ����
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
					if(s.equals("����")){
						hasone+=1;
					}
				}
			}
			if(interest1%128==1){
				for(String s:iarr){
					if(s.equals("����")){
						hasone+=1;
					}
				}
			}
			if(interest1%64==1){
				for(String s:iarr){
					if(s.equals("���ǰ���")){
						hasone+=1;
					}
				}
			}
			if(hasone>0){
				point+=interestweight;
			}
			rdto.setPoint(point);
		}//for�� ��
		
		//��������
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
