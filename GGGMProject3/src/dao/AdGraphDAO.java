package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class AdGraphDAO {
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
    public static void ViewListInsert(AdGraphDTO d){
    	SqlSession session=ssf.openSession();
    	session.update("ViewListUpdate",d);
    	session.close();
    	
    }
    // 현재날 -30일 가져오는 메소드
    public static List<AdGraphDTO> AdViewChart(String adid){
    	SqlSession session=ssf.openSession();
    	List<AdGraphDTO> list = session.selectList("AdViewChart", adid);
    	session.close();
    	return list;
    }
    // 중복카운트값
    
    //단일 카운트값
    
    
    
}
