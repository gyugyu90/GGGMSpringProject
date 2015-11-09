package dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

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
    
    public static List<AdGraphDTO> adListData(Map map){
    	SqlSession session=ssf.openSession();
    	List<AdGraphDTO> list=session.selectList("myadviewlist", map);
    	session.close();
    	return list;
    }
    
    public static String getDescription(int adno){
    	SqlSession session=ssf.openSession();
    	String desc=session.selectOne("getDescription", adno);
    	session.close();
    	return desc;
    }
    public static int boardTotalPage(String id)
    {
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("myboardRowCount", id);
    	int total=(int)(Math.ceil(count/5.0));
    	session.close();
    	return total;
    }
}
