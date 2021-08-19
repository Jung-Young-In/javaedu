<%@page import="kr.or.ddit.mission.vo.missionVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

[
<%
//서블릿에서 조회결과를 "list"라는 key로 request에 담아줬음
List<missionVO> missionList = (List<missionVO>)request.getAttribute("missionList");
for(int i=0 ; i<missionList.size() ; i++) {
	missionVO vo = missionList.get(i);
	String exerMission1 = vo.getExerMission1();
	String exerMission2 = vo.getExerMission2();
	String exerMission3 = vo.getExerMission3();
	
	//json 타입으로 만들어야 하는 부분 ==> {name : "~", id : "~"}
	
	//번호, id, 이름, 생년월일, 전화번호, 직업
	//번호, id, 이름, 비밀번호, 생년월일, 전화번호, 메일, 직업
	if(i > 0) {
		%>,<%
	}
	
	%>
	{
		"exerMission1" : "<%=exerMission1 %>"
		, "exerMission2" : "<%=exerMission2 %>"
		, "exerMission3" : "<%=exerMission3 %>"
	}
	<%
}
%>

]

