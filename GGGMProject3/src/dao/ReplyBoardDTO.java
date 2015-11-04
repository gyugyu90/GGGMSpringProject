package dao;
/*
 *      면접 : session vs cookie의 차이점
 *           Model1 vs Model2 (장점)
 *           MVC구조  (Front Controller)
 *   1) MVC (Model - View - Controller)
 *      Model : 자바(.java) =>  요청에 대한 처리 
 *              => MainModel <% 소스 %>
 *              => DTO , DAO
 *      View : JSP(.jsp) => 요청 처리에 대한 화면 
 *      Controller : 전체를 관리 (Model과 View를 연결)
 *                   요청을 받아서 처리 (서블릿)
 *           ***** 브라우저에서 요청 => jsp,servlet
 *   2) 구동 
 *      1. JSP/Java를 분리 
 *         Model 작성
 *         JSP 작성 
 *      2. 등록 ( XML , CSV , Properties )
 *      3. 연결 (Controller)
 *         = XML에 등록된 클래스 읽기 (파싱) : init()
 *         = 요청시마다 연결 ( doGet,doPost,service )
 *         = 구현된 JSP 읽기 시작 (forward)
 *      4. 새로운 기능 추가,수정 => XML과 Model,JSP
 *         (유지보수)
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



