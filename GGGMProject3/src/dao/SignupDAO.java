package dao;

import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
public class SignupDAO {
   private static SqlSessionFactory ssf;
   static{//들어가자마자 초기화가 되는 블록.. 생성자를 호출하지 않아도 자동으로 메모리 할당이 됨
      try{
         Reader reader=Resources.getResourceAsReader("common/Config.xml");
         //XML 파일 읽기
         //Parsing 요청 ==> id, data를 맵에 저장하고 불러들임
         ssf=new SqlSessionFactoryBuilder().build(reader);//build 안에 SAXParsing이 됨
      }catch(Exception ex){
         System.out.println(ex.getMessage());
      }
   }
   
   public static int idcheck(String id){
	   int count=ssf.openSession().selectOne("memberIdCount", id);
	   return count;//0이면 사용가능, 1이면 사용불가
   }

   
   
}