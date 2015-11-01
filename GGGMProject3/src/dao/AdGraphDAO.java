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
    		// XML ���� �б�
    		// �Ľ� ��û ==> id , data (Map)
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
    // ���糯 -30�� �������� �޼ҵ�
    public static List<AdGraphDTO> AdViewChart(String adid){
    	SqlSession session=ssf.openSession();
    	List<AdGraphDTO> list = session.selectList("AdViewChart", adid);
    	session.close();
    	return list;
    }
    // �ߺ�ī��Ʈ��
    public static int AdOverlapCount(int adno){
    	SqlSession session=ssf.openSession();
    	int OverlapCount = session.selectOne("AdOverlapCount", adno);
    	session.close();
    	return OverlapCount;
    	
    }
    public static int AdNoOverlapCount(int adno){
    	SqlSession session=ssf.openSession();
    	int NoOverlapCount = session.selectOne("AdNoOverlapCount", adno);
    	session.close();
    	return NoOverlapCount;
    }
    //���� ī��Ʈ��
    
    
    
}
