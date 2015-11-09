package dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

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
  //���� ī��Ʈ��
    public static int AdNoOverlapCount(int adno){
    	SqlSession session=ssf.openSession();
    	int NoOverlapCount = session.selectOne("AdNoOverlapCount", adno);
    	session.close();
    	return NoOverlapCount;
    }
    // ��������Ʈ������
    public static int Point(int adno){
    	SqlSession session=ssf.openSession();
    	int point=session.selectOne("Point", adno);
    	session.close();
    	return point;
    	
    }

 // ADID�� ��� ADNO������
    public static List<AdvertiseDTO> ListOfAdno(String adid){
    		SqlSession session=ssf.openSession();
    		List<AdvertiseDTO> list=session.selectList("ListOfAdno", adid);
    		session.close();
    		return list;
    }

    public static AdvertiseDTO AllOfAdno(int adno){
    	SqlSession session=ssf.openSession();
    	AdvertiseDTO list=session.selectOne("AllOfAdno", adno);
    	session.close();
    	return list;
    }
    public static List<AdvertiseDTO> alldataofuser(String id){
    	SqlSession session=ssf.openSession();
    	List<AdvertiseDTO> list=session.selectList("alldataofuser", id);
		session.close();
		return list;
    }
    public static List<String> idOfAdno(int adno){
    	SqlSession session=ssf.openSession();
    	List<String> list=session.selectList("idOfAdno", adno);
    	
    	session.close();
    	return list;
    }
    public static int manofadno(int adno){
    	SqlSession session=ssf.openSession();
    	int mancount=session.selectOne("manofadno", adno);
    	session.close();
    	return mancount;
    }
    public static int womanofadno(int adno){
    	SqlSession session=ssf.openSession();
    	int womancount=session.selectOne("womanofadno", adno);
    	session.close();
    	return womancount;
    }
    public static int age0(int adno){
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("age0", adno);
    	session.close();
    	return count;
    }
    public static int age1(int adno){
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("age1", adno);
    	session.close();
    	return count;
    }
    public static int age2(int adno){
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("age2", adno);
    	session.close();
    	return count;
    }
    public static int age3(int adno){
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("age3", adno);
    	session.close();
    	return count;
    }
    public static int age4(int adno){
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("age4", adno);
    	session.close();
    	return count;
    }
    public static int age5(int adno){
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("age5", adno);
    	session.close();
    	return count;
    }
    public static int age6(int adno){
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("age6", adno);
    	session.close();
    	return count;
    }
    public static int age7(int adno){
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("age7", adno);
    	session.close();
    	return count;
    }
    public static int age8(int adno){
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("age8", adno);
    	session.close();
    	return count;
    }
   
    
}
