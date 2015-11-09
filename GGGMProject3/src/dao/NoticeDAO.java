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
	 public static int noticeReplyCount(int no)
	    {
	    	SqlSession session=ssf.openSession();
	    	int count=session.selectOne("noticeReplyCount",no);
	    	session.close();
	    	return count;
	    }
//	�������� �� 
	public static int noticeTotalPage(){
		SqlSession session=ssf.openSession();
		int count=session.selectOne("noticeRowCount");
		int total=(int)(Math.ceil(count/10.0));
		session.close();
		return total;
	}
//	���� ����
	public static NoticeDTO noticeContentData(int no){
		SqlSession session=ssf.openSession(true);
		session.update("noticeHitIncrement",no);
		NoticeDTO dto = session.selectOne("noticeContentData",no);
		session.close();
		return dto;
	}
	
//�۾���
	public static void noticeWrite(NoticeDTO d){
		SqlSession session=ssf.openSession(true);
		session.insert("noticeWrite",d);
		session.close();
	}
	
	
//	�� ����
	public static void noticeModify(NoticeDTO d){
		SqlSession session=ssf.openSession(true);
		session.update("noticeModify",d);
		session.close();
	}
	
//	�ۻ���
	public static void noticeDelete(int no){
		SqlSession session = ssf.openSession(true);
		session.delete("noticeDelete",no);
		session.close();
	}
	
//	��� �κ�
//	�������� ��۸�� �ҷ��� 
	public static List<NoticeReplyDTO> replyListData(int bno){
		SqlSession session = ssf.openSession();
		List<NoticeReplyDTO> list=session.selectList("noticeReplyListData",bno);
		session.close();
		return list;
	}
	
//	�� ���page �� �������� / 5/page
    public static int noticeReplyTotalPage(int bno)
    {
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("noticeReplyTotalPage",bno);
    	session.close();
    	return (int)(Math.ceil(count/5.0));
    }
//��� �߰���
    public static void noticeReplyNewWrite(ReplyDTO d)
    {
    	SqlSession session=ssf.openSession(true);
    	session.insert("noticeReplyNewWrite",d);
    	session.close();
    }

    public static ReplyDTO noticeReplyParentInfo(int no)
    {
    	SqlSession session=ssf.openSession();
    	ReplyDTO list=
    		session.selectOne("noticeReplyParentInfo",no);
    	session.close();
    	return list;
    }
    public static void noticeReplyStepIncrement(ReplyDTO d)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("noticeReplyStepIncrement",d);
    	session.close();
    }
    public static void noticeReplyReplyWrite(ReplyDTO d)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("noticeReplyReplyWrite",d);
    	session.close();
    }
    public static ReplyDTO noticeReplyDataInfo(int no)
    {
    	SqlSession session=ssf.openSession();
    	ReplyDTO list=
    		session.selectOne("noticeReplyDataInfo",no);
    	session.close();
    	return list;
    }
    public static void noticeReplyDepthIncrement(int no)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("noticeReplyDepthIncrement",no);
    	session.close();
    }
//��� ������
    public static void noticeReplyMsgUpdate(int no)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("noticeReplyMsgUpdate",no);
    	session.close();
    }
    public static void noticeReplyDelete(int no)
    {
    	SqlSession session=ssf.openSession(true);
    	session.delete("noticeReplyDelete",no);
    	session.close();
    }
    public static void noticeReplyDepthDecrement(int no)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("noticeReplyDepthDecrement",no);
    	session.close();
    }
    public static void noticeReplyUpdate(ReplyDTO d)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("noticeReplyUpdate",d);
    	session.close();
    }
	
	
}
