<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="config.jsp"%>
<%
	// Get Parameter From Client
	//request.setCharacterEncoding("UTF-8");
	String paramRequest = request.getParameter("paramRequest");
	String paramCountry = request.getParameter("paramCountry");
	String paramRegion = request.getParameter("paramRegion");
	String paramProvince = request.getParameter("paramProvince");
	
	//out.print("paramRequest"+paramRequest+"<br>");
	//out.print("paramCountry"+paramCountry+"<br>");
	
	
	
	
	
	if(paramRequest.equals("Region")){
		String queryRegion="CALL ParamRegion('"+paramCountry+"')";
		rs=mysqlConn.selectData(queryRegion);
		JSONArray objRegion = new JSONArray();
		while(rs.next()){
			objRegion.add(rs.getString(1));
		}
		out.println(objRegion);
		conn.close();
		
	}
	
	if(paramRequest.equals("Area")){
		String queryArea="CALL ParamArea('"+paramCountry+"');";
		rs=mysqlConn.selectData(queryArea);
		JSONArray objArea = new JSONArray();
		while(rs.next()){
			objArea.add(rs.getString(1));
		}
		out.println(objArea);
		conn.close();
	}
	
	if(paramRequest.equals("Province")){
		
		
		//out.println("paramCountry"+paramCountry);
		//out.println("paramRegion"+paramRegion);	
		String queryProvince="CALL ParamProvince('"+paramCountry+"','"+paramRegion+"')";
		rs=mysqlConn.selectData(queryProvince);
		JSONArray objProvince = new JSONArray();
		while(rs.next()){
			objProvince.add(rs.getString(1));
		}
		out.println(objProvince);
		conn.close();
		
		
	}
	
	
	
%>