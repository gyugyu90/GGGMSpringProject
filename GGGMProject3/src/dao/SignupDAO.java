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
	   SqlSession session=ssf.openSession();
	   int count=session.selectOne("memberIdCount", id);
	   session.close();
	   return count;//0이면 사용가능, 1이면 사용불가
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