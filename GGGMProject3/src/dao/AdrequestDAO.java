package dao;

import java.io.Reader;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sun.activation.registries.MailcapParseException;

public class AdrequestDAO {
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
    public List<AdrequestDTO> adRequestList(){
    	SqlSession session=ssf.openSession();
    	List<AdrequestDTO> list = session.selectList("adReqList");
    	return list;
    }
}
