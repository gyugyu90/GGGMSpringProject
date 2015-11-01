package dao;

import java.util.Date;

public class AdGraphDTO {
	private String adid;
	private String adno;
	private String id;
	private int sumpoint;
	private Date viewtime;
	private int count;

	public String getAdid() {
		return adid;
	}
	public void setAdid(String adid) {
		this.adid = adid;
	}
	public String getAdno() {
		return adno;
	}
	public void setAdno(String adno) {
		this.adno = adno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSumpoint() {
		return sumpoint;
	}
	public void setSumpoint(int sumpoint) {
		this.sumpoint = sumpoint;
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
