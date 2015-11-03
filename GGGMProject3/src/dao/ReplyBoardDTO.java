package dao;
/*
 *      ���� : session vs cookie�� ������
 *           Model1 vs Model2 (����)
 *           MVC����  (Front Controller)
 *   1) MVC (Model - View - Controller)
 *      Model : �ڹ�(.java) =>  ��û�� ���� ó�� 
 *              => MainModel <% �ҽ� %>
 *              => DTO , DAO
 *      View : JSP(.jsp) => ��û ó���� ���� ȭ�� 
 *      Controller : ��ü�� ���� (Model�� View�� ����)
 *                   ��û�� �޾Ƽ� ó�� (����)
 *           ***** ���������� ��û => jsp,servlet
 *   2) ���� 
 *      1. JSP/Java�� �и� 
 *         Model �ۼ�
 *         JSP �ۼ� 
 *      2. ��� ( XML , CSV , Properties )
 *      3. ���� (Controller)
 *         = XML�� ��ϵ� Ŭ���� �б� (�Ľ�) : init()
 *         = ��û�ø��� ���� ( doGet,doPost,service )
 *         = ������ JSP �б� ���� (forward)
 *      4. ���ο� ��� �߰�,���� => XML�� Model,JSP
 *         (��������)
 */
import java.util.*;
public class ReplyBoardDTO {
    private int no;
    private String name;
    private String subject;
    private String content;
    private String pwd;
    private Date regdate;
    private String dbday;
    private int hit;
    private int replyCount;
    
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	   
}



