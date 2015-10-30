package dao;

import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
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
	   int count=ssf.openSession().selectOne("memberIdCount", id);
	   return count;//0�̸� ��밡��, 1�̸� ���Ұ�
   }

   
   
}