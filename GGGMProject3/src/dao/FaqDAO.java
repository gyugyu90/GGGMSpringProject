package dao;

import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;

public class FaqDAO{
	private static SqlSessionFactory ssf;
	
	static{
		try {
			Reader reader= Resources.getResourceAsReader("common/Config.xml");
			ssf= new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {System.out.println(e.getMessage());}
	}
	public static List<FaqDTO> faqAllData(){
		System.out.println("dao안쪽 접근");
		SqlSession session=ssf.openSession();
		List<FaqDTO> list=session.selectList("faqAllData");
		System.out.println("dao안쪽 벗어남");
		return list;
	}
	public static int faqRowCount()
	{		
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("faqRowCount");
    	int total=(int)(Math.ceil(count/5.0));
    	session.close();
		return total;
	}
    public static List<FaqDTO> faqListData(Map map)
    {
    	/*
    	 *   class A
    	 *   {
    	 *      selectList(){}
    	 *   }
    	 *   
    	 *   new A().selectList()
    	 *   new A().close()
    	 *   
    	 *   A a=new A();
    	 *   a.selectList();
    	 *   a.close()
    	 */
    	SqlSession session=ssf.openSession();
    	List<FaqDTO> list=
    			session.selectList("faqListData",map);
    	session.close();// 반환
    	return list;
    }
    public static FaqDTO faqData(int no){
		System.out.println("dao안쪽 접근");
		SqlSession session=ssf.openSession();
		FaqDTO list=session.selectOne("faqData",no);
		System.out.println("dao안쪽 벗어남");
		return list;
	}
}

