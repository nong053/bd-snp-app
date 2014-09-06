<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="config.jsp"%>
<%
	//GET PARAMETER START
	String paramRequest = request.getParameter("paramRequest");
	String paramCountry = request.getParameter("paramCountry");
	//GET PARAMETER END
%>
<%
//DEFAULT PARAMATER 
	//location Type Start
	if(paramRequest.equals("")){
	String queryLocationType="CALL ParameterLocationType('Thailand')";
	String locationTypeHTML="";
	rs=mysqlConn.selectData(queryLocationType);
		locationTypeHTML+="<ul>";
		int i=0;
	while(rs.next()){
		locationTypeHTML+="<li>";
		locationTypeHTML+="<a href=\"#\" class=\"locationType\" id=\"locationTypeId"+i+"\">";
		locationTypeHTML+=rs.getString(1);
		locationTypeHTML+="</li>";
		i++;
	}
	
	conn.close();
	locationTypeHTML+="</ul>";

	//LandlordGroup End
	}

	//LandlordGroup Start
	if(paramRequest.equals("")){
	String queryLandlordGroup="CALL ParameterLandlordGroup('Thailand')";
	String LandlordGroupHTML="";
	rs=mysqlConn.selectData(queryLandlordGroup);
	LandlordGroupHTML+="<ul>";
		int i=0;
	while(rs.next()){
		LandlordGroupHTML+="<li>";
		LandlordGroupHTML+="<a href=\"#\" class=\"landlordGroup\" id=\"landlordGroupTypeId"+i+"\">";
		LandlordGroupHTML+=rs.getString(1);
		LandlordGroupHTML+="</li>";
		i++;
	};
	conn.close();
	LandlordGroupHTML+="</ul>";

	//location Type End
	}
%>