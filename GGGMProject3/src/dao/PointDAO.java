package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class PointDAO {
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
    public static void ViewListInsert(PointDTO d){
    	SqlSession session=ssf.openSession();
    	session.update("ViewListUpdate",d);
    	session.close();
    	
    }
    
    public static void PointUpdate(PointDTO d){
    	SqlSession session=ssf.openSession();
    	session.update("PointUpdate", d);
    	session.close(); 	
    	
    }
    
    // ���� �Ⱦ�(�����ʿ�)
    public static void AllCountViewTime(PointDTO d){
    	SqlSession session=ssf.openSession();
    	session.update("ViewListUpdate",d);
    	session.close(); 	
    	
    }
    
    
    
}
