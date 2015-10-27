package com.mybatis;

import java.lang.reflect.Method;

import jdk.internal.org.xml.sax.Attributes;
import jdk.internal.org.xml.sax.SAXException;
import jdk.internal.org.xml.sax.helpers.DefaultHandler;

//SAXParsing
public class XMLHandler extends DefaultHandler{
	Class clsName;
	Object obj;
	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		try{
			if(qName.equals("dataSource")){//dataSource�� Config.xml�� ����
				String type=attributes.getValue("type");//type�Ӽ��� ������ �����com.mybatis.DataSource
				clsName=Class.forName(type);
				obj=clsName.newInstance();
			}
			// TODO: �� DTO�� dataSource�� �ش���
			// if(qName.equals("xxxDTO")){...}�� ¥����
			if(qName.equals("property")){
				String name=attributes.getValue("name");
				String value=attributes.getValue("value");
				
				Method[] method=clsName.getDeclaredMethods();
				for(Method m:method){
					String methodName=m.getName();
					if(methodName.equalsIgnoreCase("set"+name)){//DataSource Ŭ������ �ش��ϴ� set�޼ҵ带 ã�Ƽ�
						m.invoke(obj, value);//�ش� �޼ҵ忡 ���� ä��
					}
				}
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	//�Ľ��� ���� startElement������
	
	
	
}
