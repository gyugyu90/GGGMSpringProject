package com.controller;

import java.util.*;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import com.model.Model;
import java.io.File;

public class WebApplicationContext {

	Map clsMap = new HashMap();

	public WebApplicationContext(String path) {
		try {
			SAXParserFactory spf = SAXParserFactory.newInstance();
			SAXParser sp = spf.newSAXParser();
			HandlerMapping hm = new HandlerMapping();
			// �������� startElement()�� ���� �ʿ� �����մϴ�.
			sp.parse(new File(path), hm);
			clsMap = hm.map;// hm���� ������ �ʰ� ���� �ּҸ� �Ҵ��ϸ鼭 �޸𸮸� �����մϴ�.

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	// �ش� Ŭ������ �Ѱ���
	public Model getBean(String key) {
		return (Model) clsMap.get(key);
	}

}
