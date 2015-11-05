package dao;

import java.util.Date;

public class AdGraphDTO {
	private String adid;
	private int adno;
	private String id;
	private int point;
	private Date viewtime;
	private int count;
	private String sdfviewtime;
	public String getSdfviewtime() {
		return sdfviewtime;
	}
	public void setSdfviewtime(String sdfviewtime) {
		this.sdfviewtime = sdfviewtime;
	}
	public String getAdid() {
		return adid;
	}
	public void setAdid(String adid) {
		this.adid = adid;
	}
	public int getAdno() {
		return adno;
	}
	public void setAdno(int adno) {
		this.adno = adno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Date getViewtime() {
		return viewtime;
	}
	public void setViewtime(Date viewtime) {
		this.viewtime = viewtime;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
		
}
