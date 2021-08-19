<%@page import="kr.or.ddit.exerciseNotice.vo.ExerciseNoticeVO"%>
<%@page import="kr.or.ddit.mission.vo.missionVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

[
<%
//서블릿에서 조회결과를 "list"라는 key로 request에 담아줬음
List<ExerciseNoticeVO> exerciseNoticeList = (List<ExerciseNoticeVO>)request.getAttribute("exerciseNoticeList");
for(int i=0 ; i<exerciseNoticeList.size() ; i++) {
	ExerciseNoticeVO vo = exerciseNoticeList.get(i);
	String exercise = vo.getExercise();
	String food = vo.getFood();
	String memDate = vo.getMemDate();
	
	//json 타입으로 만들어야 하는 부분 ==> {name : "~", id : "~"}
	
	//번호, id, 이름, 생년월일, 전화번호, 직업
	//번호, id, 이름, 비밀번호, 생년월일, 전화번호, 메일, 직업
	if(i > 0) {
		%>,<%
	}
	
	%>
	{
		"exercise" : "<%=exercise %>"
		, "food" : "<%=food %>"
		, "memDate" : "<%=memDate %>"
	}
	<%
}
%>

]

