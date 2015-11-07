package dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dao.ReplyDTO;

import oracle.jdbc.OracleTypes;

import java.io.*;
import java.sql.ResultSet;
public class BoardDAO {
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
   
    public static List<BoardDTO> qnaListData(Map map)
    {
    	/*
    	 *   class A
    	 *   {
    	 *      selectList(){}
    	 *   }
    	 *   
    	 *   new A().selectList()
    	 *   new A().close()
    	 *   
    	 *   A a=new A();
    	 *   a.selectList();
    	 *   a.close()
    	 */
    	SqlSession session=ssf.openSession();
    	List<BoardDTO> list=
    			session.selectList("qnaListData",map);
    	session.close();// ��ȯ
    	return list;
    }
    //�̸��˻�
    public static List<BoardDTO> qnaSearchListData(Map map)
    {
    	/*
    	 *   class A
    	 *   {
    	 *      selectList(){}
    	 *   }
    	 *   
    	 *   new A().selectList()
    	 *   new A().close()
    	 *   
    	 *   A a=new A();
    	 *   a.selectList();
    	 *   a.close()
    	 */
    	SqlSession session=ssf.openSession();
    	List<BoardDTO> list=
    			session.selectList("qnaSearchListData",map);
    	session.close();// ��ȯ
    	return list;
    }
    public static int qnaSearchTotalPage(Map map)
    {
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("qnaSearchRowCount",map);
    	int total=(int)(Math.ceil(count/10.0));
    	session.close();
    	return total;
    }
    public static int qnaSearchRowCount(Map map)
 	{
 		
     	SqlSession session=ssf.openSession();
     	int total =session.selectOne("qnaSearchRowCount",map);
     	session.close();
 		return total;
 	}
    //���� �˻�
    public static List<BoardDTO> qnaSearchSubjectListData(Map map)
    {
    	/*
    	 *   class A
    	 *   {
    	 *      selectList(){}
    	 *   }
    	 *   
    	 *   new A().selectList()
    	 *   new A().close()
    	 *   
    	 *   A a=new A();
    	 *   a.selectList();
    	 *   a.close()
    	 */
    	SqlSession session=ssf.openSession();
    	List<BoardDTO> list=
    			session.selectList("qnaSearchSubjectListData",map);
    	session.close();// ��ȯ
    	return list;
    }
    public static int qnaSearchSubjectTotalPage(Map map)
    {
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("qnaSearchSubjectRowCount",map);
    	int total=(int)(Math.ceil(count/10.0));
    	session.close();
    	return total;
    }
    public static int qnaSearchSubjectRowCount(Map map)
 	{
 		
     	SqlSession session=ssf.openSession();
     	int total =session.selectOne("qnaSearchSubjectRowCount",map);
     	session.close();
 		return total;
 	}
    // ����Ʈ
    public static int qnaRowCount()
	{
		
    	SqlSession session=ssf.openSession();
    	int total =session.selectOne("qnaRowCount");
    	session.close();
		return total;
	}

    public static int qnaTotalPage()
    {
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("qnaRowCount");
    	int total=(int)(Math.ceil(count/10.0));
    	session.close();
    	return total;
    }
 
    public static void qnaWrite(BoardDTO d)
    {
    	SqlSession session=ssf.openSession(true);
    	session.insert("qnaWrite",d);
    	session.close();
    	
    }
    public static String qnaAuthorizedData(int no)
    {
    	SqlSession session=ssf.openSession();
    	String pwd=session.selectOne("qnaAuthorizedData",no);
    	session.close();
    	return pwd;
    }
    public static BoardDTO qnaContentData(int no)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("qnaHitIncrement",no);
    	BoardDTO d=session.selectOne("qnaContentData",no);
    	session.close();
    	return d;
    }
   
    public static BoardDTO qnaContentData2(int no)
    {
    	SqlSession session=ssf.openSession();
    	BoardDTO d=session.selectOne("qnaContentData",no);
    	session.close();
    	return d;
    }

    public static BoardDTO qnaUpdateData(int no)
    {
    	SqlSession session=ssf.openSession();
    	BoardDTO d=session.selectOne("qnaContentData",no);
    	session.close();
    	return d;
    }
    public static void qnaUpdate(BoardDTO d)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("qnaUpdate",d);
    	session.close();
    }
    
    public static void qnaDelete(int no)
    {
    	SqlSession session=ssf.openSession(true);
    	session.delete("qnaReplyDelete",no);
    	session.delete("qnaDelete",no);
    	session.close();
    }
    public static int qnaReplyCount(int no)
    {
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("qnaReplyCount",no);
    	session.close();
    	return count;
    }
    public static List<ReplyDTO> replyListData(int bno)
    {
    	SqlSession session=ssf.openSession();
    	List<ReplyDTO> list = session.selectList("replyListData",bno);
    	session.close();
    	return list;
    }
    public static void replyNewWrite(ReplyDTO d)
    {
    	SqlSession session=ssf.openSession(true);
    	session.insert("replyNewWrite",d);
    	session.close();
    }

    public static ReplyDTO replyParentInfo(int no)
    {
    	SqlSession session=ssf.openSession();
    	ReplyDTO list=
    		session.selectOne("replyParentInfo",no);
    	session.close();
    	return list;
    }
    public static void replyStepIncrement(ReplyDTO d)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("replyStepIncrement",d);
    	session.close();
    }
    public static void replyReplyWrite(ReplyDTO d)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("replyReplyWrite",d);
    	session.close();
    }
    public static ReplyDTO replyDataInfo(int no)
    {
    	SqlSession session=ssf.openSession();
    	ReplyDTO list=
    		session.selectOne("replyDataInfo",no);
    	session.close();
    	return list;
    }
    public static void replyDepthIncrement(int no)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("replyDepthIncrement",no);
    	session.close();
    }
    public static int replyTotalPage(int bno)
    {
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("replyTotalPage",bno);
    	session.close();
    	return (int)(Math.ceil(count/5.0));
    }
 //��� ������
    public static void replyMsgUpdate(int no)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("replyMsgUpdate",no);
    	session.close();
    }
    public static void replyDelete(int no)
    {
    	SqlSession session=ssf.openSession(true);
    	session.delete("replyDelete",no);
    	session.close();
    }
    public static void replyUpdate(ReplyDTO d)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("replyUpdate",d);
    	session.close();
    }
    public static void replyDepthDecrement(int no)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("replyDepthDecrement",no);
    	session.close();
    }
    
}













