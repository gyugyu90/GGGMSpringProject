package dao;

import java.util.Date;

public class AdrequestDTO {
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

}
