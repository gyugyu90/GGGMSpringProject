<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String adno=request.getParameter("no");
request.setAttribute("adno", adno); %>
<c:redirect url="ad_index.do"/>