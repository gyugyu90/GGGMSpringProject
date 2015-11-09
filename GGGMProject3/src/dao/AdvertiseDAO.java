package dao;

import java.io.Reader;
import java.sql.*;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dao.*;

public class AdvertiseDAO {
	private static SqlSessionFactory ssf;
    static
    {
    	try
    	{
    		Reader reader=Resources.getResourceAsReader("common/Config.xml");
    		// XML 파일 읽기
    		// 파싱 요청 ==> id , data (Map)
    		ssf=new SqlSessionFactoryBuilder().build(reader);
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    }
    public static List<AdvertiseDTO> adListData(){
    	SqlSession session=ssf.openSession();
    	List<AdvertiseDTO> count=session.selectList("adListData");
    	session.close();
    	return count;
    	
    }
    public static List<AdvertiseDTO> aadListData(){
    	SqlSession session=ssf.openSession();
    	List<AdvertiseDTO> count=session.selectList("aadListData");
    	session.close();
    	return count;
    	
    }
    public static AdvertiseDTO ad_info(int adno)
    {
    	SqlSession session=ssf.openSession();
    	AdvertiseDTO dto=new AdvertiseDTO();
    	dto=session.selectOne("ad_info", adno);
    	session.close();
    	return dto;
    }

	public static AdvertiseDTO side_info(int adno){
		SqlSession session=ssf.openSession();
		AdvertiseDTO dto=new AdvertiseDTO();
		dto=session.selectOne("side_info", adno);
		session.close();
		return dto;
	}
	
	public static void getpoint(Map map){
		SqlSession session=ssf.openSession(true);
		session.update("getpoint",map);
		session.close();
	}
	
	public static void insertMyadviewlist(AdGraphDTO d){
		SqlSession session=ssf.openSession(true);
		session.insert("insert_adviewlist", d);
		session.close();
	}
	
}
