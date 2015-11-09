package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyAdViewListDAO {
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
    
    public static List<AdGraphDTO> adListData(String id){
    	SqlSession session=ssf.openSession();
    	List<AdGraphDTO> list=session.selectList("myadviewlist", id);
    	session.close();
    	return list;
    }
    
    public static String getDescription(int adno){
    	SqlSession session=ssf.openSession();
    	String desc=session.selectOne("getDescription", adno);
    	session.close();
    	return desc;
    }
}
