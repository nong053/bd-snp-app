<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="connectionPackage.*"%>
<%
	connectionPackage.connectionJNDI jndi = new connectionPackage.connectionJNDI();
	String paramRequest = request.getParameter("paramRequest");
	String valueList = request.getParameter("valueList");
	String paramYear = request.getParameter("paramYear");
	String paramMonthFrom = request.getParameter("paramMonthFrom");
	String paramMonthTo = request.getParameter("paramMonthTo");
	String paramBrand = request.getParameter("paramBrand");
	String paramCountry = request.getParameter("paramCountry");
	String paramRegion = request.getParameter("paramRegion");
	String paramProvince = request.getParameter("paramProvince");
	String paramArea = request.getParameter("paramArea");
	/*
	out.println("paramRequest="+paramRequest+"<br>");
	out.println("paramNetSalesList="+paramNetSalesList+"<br>");
	out.println("paramYear="+paramYear+"<br>");
	out.println("paramMonthFrom="+paramMonthFrom+"<br>");
	out.println("paramMonthTo="+paramMonthTo+"<br>");
	out.println("paramBrand="+paramBrand+"<br>");
	out.println("paramCountry="+paramCountry+"<br>");
	out.println("paramRegion="+paramRegion+"<br>");
	out.println("paramProvince="+paramProvince+"<br>");
	out.println("paramArea="+paramArea+"<br>");
	*/
	
	//NetSales start
	if(paramRequest.equals("NetSales")){
		jndi.selectByIndex("CALL NetSales('"+paramYear+"' ,'"+paramMonthFrom+"' , '"+paramMonthTo+"', '"+paramBrand+"' , '"+paramCountry+"' , '"+paramRegion+"' , '"+paramProvince+"'  ,'"+paramArea+"')","1,2,3,4,5,6,7,8,9,10,11,12,13,14,15");
		out.println(jndi.getData());
		
		/*
		String queryNetSales="CALL NetSales('"+paramYear+"' ,'"+paramMonthFrom+"' , '"+paramMonthTo+"', '"+paramBrand+"' , '"+paramCountry+"' , '"+paramRegion+"' , '"+paramProvince+"'  ,'"+paramArea+"' )";
		rs=mysqlConn.selectData(queryNetSales);
		JSONArray  objData= new JSONArray();
		while(rs.next()){
			JSONArray  subObjData= new JSONArray();
			subObjData.add(rs.getString(1));
			subObjData.add(rs.getString(2));
			subObjData.add(rs.getString(3));
			subObjData.add(rs.getString(4));
			subObjData.add(rs.getString(5));
			subObjData.add(rs.getString(6));
			subObjData.add(rs.getString(7));
			subObjData.add(rs.getString(8));
			subObjData.add(rs.getString(9));
			subObjData.add(rs.getString(10));
			subObjData.add(rs.getString(11));
			subObjData.add(rs.getString(12));
			subObjData.add(rs.getString(13));
			subObjData.add(rs.getString(14));
			subObjData.add(rs.getString(15));
			
			objData.add(subObjData);
			
		}
		out.println(objData);
		conn.close();
		*/
	}
	//NetSales End
	//RentNetSales Start
	if(paramRequest.equals("RentNetSales")){
		jndi.selectByIndex("CALL RentNetSales('"+paramYear+"' ,'"+paramMonthFrom+"' , '"+paramMonthTo+"', '"+paramBrand+"' , '"+paramCountry+"' , '"+paramRegion+"' , '"+paramProvince+"'  ,'"+paramArea+"')","1,2,3,4,5,6,7,8,9,10,11,12,13,14,15");
		out.println(jndi.getData());
		/*
		String queryNetSales="CALL RentNetSales('"+paramYear+"' ,'"+paramMonthFrom+"' , '"+paramMonthTo+"', '"+paramBrand+"' , '"+paramCountry+"' , '"+paramRegion+"' , '"+paramProvince+"'  ,'"+paramArea+"'  )";
		rs=mysqlConn.selectData(queryNetSales);
		JSONArray  objData= new JSONArray();
		while(rs.next()){
			JSONArray  subObjData= new JSONArray();
			subObjData.add(rs.getString(1));
			subObjData.add(rs.getString(2));
			subObjData.add(rs.getString(3));
			subObjData.add(rs.getString(4));
			subObjData.add(rs.getString(5));
			subObjData.add(rs.getString(6));
			subObjData.add(rs.getString(7));
			subObjData.add(rs.getString(8));
			subObjData.add(rs.getString(9));
			subObjData.add(rs.getString(10));
			subObjData.add(rs.getString(11));
			subObjData.add(rs.getString(12));
			subObjData.add(rs.getString(13));
			subObjData.add(rs.getString(14));
			subObjData.add(rs.getString(15));
			
			objData.add(subObjData);
			
		}
		out.println(objData);
		conn.close();
		*/
	}
	//RentNetSales End
	
	//RentEBITDA Start
	if(paramRequest.equals("RentEBITDA")){
		jndi.selectByIndex("CALL RentEBITDA('"+paramYear+"' ,'"+paramMonthFrom+"' , '"+paramMonthTo+"', '"+paramBrand+"' , '"+paramCountry+"' , '"+paramRegion+"' , '"+paramProvince+"'  ,'"+paramArea+"')","1,2,3,4,5,6,7,8,9,10,11,12,13,14,15");
		out.println(jndi.getData());
		/*
		String queryNetSales="CALL RentEBITDA('"+paramYear+"' ,'"+paramMonthFrom+"' , '"+paramMonthTo+"', '"+paramBrand+"' , '"+paramCountry+"' , '"+paramRegion+"' , '"+paramProvince+"'  ,'"+paramArea+"'  )";
		rs=mysqlConn.selectData(queryNetSales);
		JSONArray  objData= new JSONArray();
		while(rs.next()){
			JSONArray  subObjData= new JSONArray();
			subObjData.add(rs.getString(1));
			subObjData.add(rs.getString(2));
			subObjData.add(rs.getString(3));
			subObjData.add(rs.getString(4));
			subObjData.add(rs.getString(5));
			subObjData.add(rs.getString(6));
			subObjData.add(rs.getString(7));
			subObjData.add(rs.getString(8));
			subObjData.add(rs.getString(9));
			subObjData.add(rs.getString(10));
			subObjData.add(rs.getString(11));
			subObjData.add(rs.getString(12));
			subObjData.add(rs.getString(13));
			subObjData.add(rs.getString(14));
			subObjData.add(rs.getString(15));
			
			objData.add(subObjData);
			
		}
		out.println(objData);
		conn.close();
		*/
	}
	//RentEBITDA End
	
	//EBIT Start
	if(paramRequest.equals("EBIT")){
		jndi.selectByIndex("CALL EBIT('"+paramYear+"' ,'"+paramMonthFrom+"' , '"+paramMonthTo+"', '"+paramBrand+"' , '"+paramCountry+"' , '"+paramRegion+"' , '"+paramProvince+"'  ,'"+paramArea+"')","1,2,3,4,5,6,7,8,9,10,11,12,13,14,15");
		out.println(jndi.getData());
		/*
		String queryNetSales="CALL EBIT('"+paramYear+"' ,'"+paramMonthFrom+"' , '"+paramMonthTo+"', '"+paramBrand+"' , '"+paramCountry+"' , '"+paramRegion+"' , '"+paramProvince+"'  ,'"+paramArea+"'  )";
		rs=mysqlConn.selectData(queryNetSales);
		JSONArray  objData= new JSONArray();
		while(rs.next()){
			JSONArray  subObjData= new JSONArray();
			subObjData.add(rs.getString(1));
			subObjData.add(rs.getString(2));
			subObjData.add(rs.getString(3));
			subObjData.add(rs.getString(4));
			subObjData.add(rs.getString(5));
			subObjData.add(rs.getString(6));
			subObjData.add(rs.getString(7));
			subObjData.add(rs.getString(8));
			subObjData.add(rs.getString(9));
			subObjData.add(rs.getString(10));
			subObjData.add(rs.getString(11));
			subObjData.add(rs.getString(12));
			subObjData.add(rs.getString(13));
			subObjData.add(rs.getString(14));
			subObjData.add(rs.getString(15));
			
			objData.add(subObjData);
			
		}
		out.println(objData);
		conn.close();
		*/
	}
	//EBIT End
	%>
