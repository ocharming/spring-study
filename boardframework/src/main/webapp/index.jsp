<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bit.member.model.MemberDto"%>
<%@ include file="/WEB-INF/views/common/public.jsp" %>
<%
MemberDto memberDto = new MemberDto();

memberDto.setId("min");
memberDto.setName("오창민");
memberDto.setEmail("ocm3323@gmail.com");

session.setAttribute("userInfo", memberDto);
%>

<%
response.sendRedirect(request.getContextPath() + "/badmin/boardmenu.bit");
%>