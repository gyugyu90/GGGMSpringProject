package com.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//���� ���� Ŭ������ ��� �����ϱ� ���� Model Interface
public interface Model {
	
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception;
	
}
