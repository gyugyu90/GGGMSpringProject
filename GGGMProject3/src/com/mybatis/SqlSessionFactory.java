package com.mybatis;

import java.util.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import java.io.*;

//DOM Parsing �ӵ��� �������� ���� ������ ������
public class SqlSessionFactory {
	private Map map=new HashMap();
	
	public SqlSessionFactory(){
		try{
			DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
			DocumentBuilder db=dbf.newDocumentBuilder(); //������ �Ľ����ִ� ��
			String path="C:\\Users\\hong\\git\\GGGMProject2\\GGGMProject2\\src\\com\\dao\\mapper.xml";
			Document doc=db.parse(new File(path));//�Ľ��� ��û��
			Element root=doc.getDocumentElement();//�ֻ��� �±׿��� ���� ������
			NodeList list=root.getElementsByTagName("select");
			for(int i=0;i<list.getLength();i++){
				Element selectElement=(Element)list.item(i);//i��° �±��� ���� �о��
				String id=selectElement.getAttribute("id");//empAllData, empFindData
				String sql=list.item(i).getFirstChild().getNodeValue();
				map.put(id, sql);
			}
			
		}catch(Exception ex){
			
		}
	}
	
	public String getSQL(String key){
		String sql=(String)map.get(key); //get()�� Object�� ������
		int no=sql.indexOf('#');
		if(no>0){
			sql=sql.substring(0, sql.lastIndexOf('#')+1);
			sql=sql.replace('#', '?');
		}
		
		return sql;
	}
	
}
