package dao;

import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
import java.sql.ResultSet;
public class SignupDAO {
   private static SqlSessionFactory ssf;
   static{//���ڸ��� �ʱ�ȭ�� �Ǵ� ���.. �����ڸ� ȣ������ �ʾƵ� �ڵ����� �޸� �Ҵ��� ��
      try{
         Reader reader=Resources.getResourceAsReader("common/Config.xml");
         //XML ���� �б�
         //Parsing ��û ==> id, data�� �ʿ� �����ϰ� �ҷ�����
         ssf=new SqlSessionFactoryBuilder().build(reader);//build �ȿ� SAXParsing�� ��
      }catch(Exception ex){
         System.out.println(ex.getMessage());
      }
   }
   
   public static int idcheck(String id){
	   SqlSession session=ssf.openSession();
	   int count=session.selectOne("memberIdCount", id);
	   session.close();
	   return count;//0�̸� ��밡��, 1�̸� ���Ұ�
   }
   
   public static int postFindCount(String dong){
	   SqlSession session = ssf.openSession();
	   int count=session.selectOne("PostFindCount", dong);
	   session.close();
	   return count;
   }
   
   public static List<ZipcodeDTO> postFindData(String dong){
	   SqlSession session=ssf.openSession();
	   Map<String, Object> map=new HashMap<String, Object>();
	   map.put("dong", dong);
	   session.selectList("postFindData", map);
	   List<ZipcodeDTO> list=(List<ZipcodeDTO>)map.get("result");
	   session.close();
	   return list;
   }
   
   public static void memberJoin(memberDTO d){
	   SqlSession session=ssf.openSession(true);
	   session.insert("memberJoin", d);
	   session.close();
   }
   public static void admemberJoin(memberDTO d){
	   SqlSession session=ssf.openSession(true);
	   session.insert("AdmemberJoin", d);
	   session.close();
   }
   public static void memberAddData(memberAddDTO add){
	   SqlSession session=ssf.openSession(true);
	   session.insert("memberAddData", add);
	   session.close();
   }
   
}