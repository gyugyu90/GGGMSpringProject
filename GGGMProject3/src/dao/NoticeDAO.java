package dao;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import java.io.*;

public class NoticeDAO {
	private static SqlSessionFactory ssf;
	static{
		try {
			Reader reader=Resources.getResourceAsReader("common/Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {System.out.println(e.getMessage());}
	}
	public static List<NoticeDTO> noticeListData(Map map){
		SqlSession session=ssf.openSession();
		List<NoticeDTO> noticelist=session.selectList("noticeListData",map);
		session.close();
		return noticelist;
	}
//	총페이지 수 
	public static int noticeTotalPage(){
		SqlSession session=ssf.openSession();
		int count=session.selectOne("noticeRowCount");
		int total=(int)(Math.ceil(count/10.0));
		session.close();
		return total;
	}
//	내용 보기
	public static NoticeDTO noticeContentData(int no){
		SqlSession session=ssf.openSession(true);
		session.update("noticeHitIncrement",no);
		NoticeDTO dto = session.selectOne("noticeContentData",no);
		session.close();
		return dto;
	}
	
//글쓰기
	public static void noticeWrite(NoticeDTO d){
		SqlSession session=ssf.openSession(true);
		session.insert("noticeWrite",d);
		session.close();
	}
	
	
//	글 수정
	public static void noticeModify(NoticeDTO d){
		SqlSession session=ssf.openSession(true);
		session.update("noticeModify",d);
		session.close();
	}
	
//	글삭제
	public static void noticeDelete(int no){
		SqlSession session = ssf.openSession(true);
		session.delete("noticeDelete",no);
		session.close();
	}
	
//	댓글 부분
//	페이지당 댓글모두 불러오 
	public static List<NoticeReplyDTO> replyListData(int bno){
		SqlSession session = ssf.openSession();
		List<NoticeReplyDTO> list=session.selectList("replyListData",bno);
		session.close();
		return list;
	}
	
//	총 댓글page 수 가져오기 / 5/page
    public static int replyTotalPage(int bno)
    {
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("replyTotalPage",bno);
    	session.close();
    	return (int)(Math.ceil(count/5.0));
    }
	
	
}
