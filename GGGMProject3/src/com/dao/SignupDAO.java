package com.dao;

import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
public class SignupDAO {
   private static SqlSessionFactory ssf;
   static{//���ڸ��� �ʱ�ȭ�� �Ǵ� ���.. �����ڸ� ȣ������ �ʾƵ� �ڵ����� �޸� �Ҵ��� ��
      try{
         Reader reader=Resources.getResourceAsReader("com/common/Config.xml");
         //XML ���� �б�
         //Parsing ��û ==> id, data�� �ʿ� �����ϰ� �ҷ�����
         ssf=new SqlSessionFactoryBuilder().build(reader);//build �ȿ� SAXParsing�� ��
      }catch(Exception ex){
         System.out.println(ex.getMessage());
      }
   }
   
   public static int idcheck(String id){
	   int count=ssf.openSession().selectOne("idcheck", id);
	   return count;//0�̸� ��밡��, 1�̸� ���Ұ�
   }
//   //return���� List�̸� selectList�� �ǰ� �׳� DTO��� selectOne
//   public static List<MemberDTO> boardListData(Map map){
//      return ssf.openSession().selectList("boardListData", map);
//   }
//   
//   public static int boardTotalPage(){
//      int count=ssf.openSession().selectOne("boardRowCount");
//      return (int)(Math.ceil(count/10.0));
//   }
//   
//   public static void boardInsert(MemberDTO d){
//      ssf.openSession(true).insert("boardInsert", d);//true�� Auto-commit
//      //�ƴϸ�
//      //ssf.openSession().insert("boardInsert",d);
//      //ssf.openSession().commit();
//   }
//   
//   public static MemberDTO boardContentData(int no){
//      ssf.openSession(true).update("boardHitIncrement", no);
//      return ssf.openSession().selectOne("boardContentData", no);
//   }
//   
//   public static MemberDTO boardUpdateData(int no){
//      return ssf.openSession().selectOne("boardContentData", no);
//   }
   
   
}