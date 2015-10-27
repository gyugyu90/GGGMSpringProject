package com.controller;

import java.util.*;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class HandlerMapping extends DefaultHandler {
	Map map = new HashMap();
	
	// �Ľ� ����� applicationContext.xml�Դϴ�.
	// ����� �Ľ̿� �ʿ��� startElement()�� ������ �ϴ� �κ��Դϴ�. 
	// qName�� �±��̸�, Attribute�� �Ӽ� ��
	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		try {
			if (qName.equals("bean")) {//bean �±׸� ã�Ƽ�
				String id = attributes.getValue("id");//id��
				String cls = attributes.getValue("class");//class �Ӽ��� �����ɴϴ�.
				Class clsName = Class.forName(cls);//Ŭ������ �����ؼ�
				Object obj = clsName.newInstance();//�޸� �Ҵ� ��
				map.put(id, obj);//�ش� ������ �ʿ� �����մϴ�.
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}

	}

}
