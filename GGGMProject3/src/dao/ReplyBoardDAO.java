package dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
public class ReplyBoardDAO {
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
    public static List<ReplyBoardDTO> boardListData(Map map)
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
    	List<ReplyBoardDTO> list=
    			session.selectList("boardListData",map);
    	session.close();// 반환
    	return list;
    }
    public static int boardTotalPage()
    {
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("boardRowCount");
    	int total=(int)(Math.ceil(count/10.0));
    	session.close();
    	return total;
    }
    public static void boardInsert(ReplyBoardDTO d)
    {
    	SqlSession session=ssf.openSession(true);
    	session.insert("boardInsert",d);
    	session.close();
    	
    }
    public static ReplyBoardDTO boardContentData(int no)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("boardHitIncrement",no);
    	ReplyBoardDTO d=session.selectOne("boardContentData",no);
    	session.close();
    	return d;
    }
    public static ReplyBoardDTO boardUpdateData(int no)
    {
    	SqlSession session=ssf.openSession();
    	ReplyBoardDTO d=session.selectOne("boardContentData",no);
    	session.close();
    	return d;
    }
    public static String boardGetPwd(int no)
    {
    	SqlSession session=ssf.openSession();
    	String pwd=session.selectOne("boardGetPwd",no);
    	session.close();
    	return pwd;
    }
    public static void boardUpdate(ReplyBoardDTO d)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("boardUpdate",d);
    	session.close();
    }
    public static void boardDelete(int no)
    {
    	SqlSession session=ssf.openSession(true);
    	session.delete("boardReplyDelete",no);
    	session.delete("boardDelete",no);
    	session.close();
    }
    public static int boardReplyCount(int bno)
    {
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("boardReplyCount",bno);
    	session.close();
    	return count;
    }
    public static List<ReplyDTO> replyListData(int bno)
    {
    	SqlSession session=ssf.openSession();
    	List<ReplyDTO> list=
    		session.selectList("replyListData",bno);
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
    	session.insert("replyReplyWrite",d);
    	session.close();
    	
    }
    public static void replyDepthIncrement(int no)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("replyDepthIncrement",no);
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
    public static void replyDepthDecrement(int no)
    {
    	SqlSession session=ssf.openSession(true);
    	session.update("replyDepthDecrement",no);
    	session.close();
    }
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
    
    public static int replyTotalPage(int bno)
    {
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("replyTotalPage",bno);
    	session.close();
    	return (int)(Math.ceil(count/5.0));
    }
}









