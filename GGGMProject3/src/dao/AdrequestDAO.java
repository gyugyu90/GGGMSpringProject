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

	static {
		try {
			Reader reader = Resources.getResourceAsReader("common/Config.xml");
			// XML 파일 읽기
			// 파싱 요청 ==> id , data (Map)
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());

		}
	}

	public void adRequestInsert(AdrequestDTO dto) {
		SqlSession session = ssf.openSession(true);
		session.insert("adRequestInsert", dto);
		System.out.println("INSERT OK");
		session.close();
	}

	public List<AdrequestDTO> adRequestList() {
		SqlSession session = ssf.openSession();
		List<AdrequestDTO> list = session.selectList("adRequestList");
		session.close();
		return list;
	}

	public AdrequestDTO adReqInfo(String adid) {
		SqlSession session = ssf.openSession();
		AdrequestDTO d = session.selectOne("adRequestInfo", adid);
		session.close();
		return d;
	}

	public void adInsert(AdvertiseDTO dto) {
		SqlSession session = ssf.openSession(true);
		session.insert("adrequestInsert", dto);
		System.out.println("INSERT OK");
		session.close();
	}

	public void adReqDelete(String adid) {
		SqlSession session = ssf.openSession(true);
		session.delete("adReqDelete", adid);
		session.close();
		System.out.println("DELETE OK");
	}

}
