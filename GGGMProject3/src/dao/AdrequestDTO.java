/*	
	adno		광고 번호			: 자동 증가
	adid		광고주 id			: 광고 등록시 session값 불러들임.

	adsubject	광고 제목			: 광고 등록시 기재	
	adtime		동영상 플레이 시간		: 관리자가 등록 혹은 작성자가 등록

	msg		광고 설명			: 광고 등록시 기재
	maj_category	광고 카테고리(대분류)		: 광고 등록시 기재
	sub_category	광고 카테고리(소분류)		: 광고 등록시 기재

	url		동영상				: 광고 등록시 기재
	img		스틸 컷				: 광고 등록시 기재

	ppc		클릭 당 포인트			: 광고 등록시 기재

	hit		조회수				: 기본값 0, 클릭 시 증가
	
	data1		추천광고를 위한 최소값 모음	: 광고 등록시 기재
	data2		추천광고를 위한 최대값 모음	: 광고 등록시 기재
	weight		추천광고를 위한 가중치 모음	: 광고 등록시 기재

   adno NUMBER,
   adid VARCHAR2(20) CONSTRAINT ad_nn_adid NOT NULL,
   adsubject VARCHAR2(50) CONSTRAINT ad_nn_subject NOT NULL,
   adtime VARCHAR(20),
   msg CLOB CONSTRAINT ad_nn_msg NOT NULL,
   maj_category VARCHAR2(20) CONSTRAINT ad_nn_maj NOT NULL,
   sub_category VARCHAR2(20) CONSTRAINT ad_nn_sub NOT NULL,
   url VARCHAR2(200),
   img VARCHAR2(200) CONSTRAINT ad_nn_img NOT NULL,
   ppc NUMBER CONSTRAINT ad_nn_prange NOT NULL, 
   hit NUMBER DEFAULT 0,
   data1 VARCHAR2(60) CONSTRAINT ad_nn_dt1 NOT NULL,
   data2 VARCHAR2(60) CONSTRAINT ad_nn_dt2 NOT NULL,
   weight VARCHAR2(50) CONSTRAINT ad_nn_wgt NOT NULL,

   CONSTRAINT ad_pk_adno PRIMARY KEY(adno)
*/
package dao;

import java.util.Date;

public class AdrequestDTO {
	
	private int adno;
	private String adid;
	private String adsubject;
	private double adtime;
	private String msg;
	private String maj_category;
	private String sub_category;
	private String url;
	private String img;
	private int ppc;
	private int hit;
	private String data1;
	private String data2;
	private String weight;
	private String dbday; 
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public int getAdno() {
		return adno;
	}
	public void setAdno(int adno) {
		this.adno = adno;
	}
	public String getAdid() {
		return adid;
	}
	public void setAdid(String adid) {
		this.adid = adid;
	}
	public String getAdsubject() {
		return adsubject;
	}
	public void setAdsubject(String adsubject) {
		this.adsubject = adsubject;
	}
	public double getAdtime() {
		return adtime;
	}
	public void setAdtime(double adtime) {
		this.adtime = adtime;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getMaj_category() {
		return maj_category;
	}
	public void setMaj_category(String maj_category) {
		this.maj_category = maj_category;
	}
	public String getSub_category() {
		return sub_category;
	}
	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getPpc() {
		return ppc;
	}
	public void setPpc(int ppc) {
		this.ppc = ppc;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getData1() {
		return data1;
	}
	public void setData1(String data1) {
		this.data1 = data1;
	}
	public String getData2() {
		return data2;
	}
	public void setData2(String data2) {
		this.data2 = data2;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	
	
	
	

}
	
/*   ---이전 DTO 
private String adno;
private String adid;
private String adsubject;
private String msg;
private String pointrange;
private String url;
private String maj_category;
private String sub_category;
private String img;
private Date regdate;
public String getAdno() {
	return adno;
}
public void setAdno(String adno) {
	this.adno = adno;
}
public String getAdid() {
	return adid;
}
public void setAdid(String adid) {
	this.adid = adid;
}
public String getAdsubject() {
	return adsubject;
}
public void setAdsubject(String adsubject) {
	this.adsubject = adsubject;
}
public String getMsg() {
	return msg;
}
public void setMsg(String msg) {
	this.msg = msg;
}
public String getPointrange() {
	return pointrange;
}
public void setPointrange(String pointrange) {
	this.pointrange = pointrange;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}
public String getMaj_category() {
	return maj_category;
}
public void setMaj_category(String maj_category) {
	this.maj_category = maj_category;
}
public String getSub_category() {
	return sub_category;
}
public void setSub_category(String sub_category) {
	this.sub_category = sub_category;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public Date getRegdate() {
	return regdate;
}
public void setRegdate(Date regdate) {
	this.regdate = regdate;
}
*/

