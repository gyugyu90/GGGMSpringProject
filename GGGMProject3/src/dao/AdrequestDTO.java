/*	
	adno		���� ��ȣ			: �ڵ� ����
	adid		������ id			: ���� ��Ͻ� session�� �ҷ�����.

	adsubject	���� ����			: ���� ��Ͻ� ����	
	adtime		������ �÷��� �ð�		: �����ڰ� ��� Ȥ�� �ۼ��ڰ� ���

	msg		���� ����			: ���� ��Ͻ� ����
	maj_category	���� ī�װ�(��з�)		: ���� ��Ͻ� ����
	sub_category	���� ī�װ�(�Һз�)		: ���� ��Ͻ� ����

	url		������				: ���� ��Ͻ� ����
	img		��ƿ ��				: ���� ��Ͻ� ����

	ppc		Ŭ�� �� ����Ʈ			: ���� ��Ͻ� ����

	hit		��ȸ��				: �⺻�� 0, Ŭ�� �� ����
	
	data1		��õ���� ���� �ּҰ� ����	: ���� ��Ͻ� ����
	data2		��õ���� ���� �ִ밪 ����	: ���� ��Ͻ� ����
	weight		��õ���� ���� ����ġ ����	: ���� ��Ͻ� ����

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
	
/*   ---���� DTO 
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

