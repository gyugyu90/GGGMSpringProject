package dao;

import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import java.io.*;

public class memberDAO {
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

	public static int memberIdCount(String id) {
		SqlSession session = ssf.openSession();
		int count = session.selectOne("memberIdCount", id);
		session.close();
		return count;
	}

	public static memberDTO getMemberInfo(String id) {
		SqlSession session = ssf.openSession();
		memberDTO d = session.selectOne("getMemberInfo", id);
		session.close();
		return d;
	}

	public static List<memberDTO> getADMemberAllData(Map map) {
		SqlSession session = ssf.openSession();
		List<memberDTO> list = session.selectList("getADMemberAllData", map);
		session.close();// 반환
		return list;
	}

	public static List<memberDTO> getNormalMemberAllData(Map map) {
		SqlSession session = ssf.openSession();
		List<memberDTO> list = session.selectList("getNormalMemberAllData", map);
		session.close();// 반환
		return list;
	}

	public static List<memberDTO> getAdminMemberAllData(Map map) {
		SqlSession session = ssf.openSession();
		List<memberDTO> list = session.selectList("getAdminMemberAllData", map);
		session.close();// 반환
		return list;
	}

	public static List<memberDTO> memberListData(Map map) {

		SqlSession session = ssf.openSession();
		List<memberDTO> list = session.selectList("memberListData", map);
		session.close();// 반환
		return list;
	}

	public static int memberTotalPage() {
		System.out.println("dao안쪽");
		SqlSession session = ssf.openSession();
		int count = session.selectOne("memberRowCount");
		int total = (int) (Math.ceil(count / 10.0));
		session.close();
		return total;
	}
	public static int memberTotalPoint() {
		System.out.println("dao안쪽");
		SqlSession session = ssf.openSession();
		int point = session.selectOne("memberTotalPoint");		
		session.close();
		return point;
	}
	public static int normalmemberTotalPage() {
		System.out.println("dao안쪽");
		SqlSession session = ssf.openSession();
		int count = session.selectOne("normalmemberRowCount");
		int total = (int) (Math.ceil(count / 10.0));
		session.close();
		return total;
	}
	public static int admemberTotalPage() {
		System.out.println("dao안쪽");
		SqlSession session = ssf.openSession();
		int count = session.selectOne("admemberRowCount");
		int total = (int) (Math.ceil(count / 10.0));
		session.close();
		return total;
	}public static int adminmemberTotalPage() {
		System.out.println("dao안쪽");
		SqlSession session = ssf.openSession();
		int count = session.selectOne("adminmemberRowCount");
		int total = (int) (Math.ceil(count / 10.0));
		session.close();
		return total;
	}
	public static void myInfoUpdate(memberDTO d){
		SqlSession session=ssf.openSession(true);
		session.update("myInfoUpdate",d);
		session.close();
	}
	public static void myAddInfoUpdate(memberAddDTO d){
		SqlSession session=ssf.openSession(true);
		session.update("myAddInfoUpdate",d);
		session.close();
	}
}

