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
	
	if(paramRequest.equals("netSales")){
		jndi.selectByIndex("CALL PieChartNetSalesBy('"+valueList+"',"+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')","1,2");
		out.println(jndi.getData());	
		/*
		String query="CALL PieChartNetSalesBy('"+valueList+"',"+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"');";
		rs=mysqlConn.selectData(query);
		JSONArray obj_json = new JSONArray();
		
		while(rs.next()){
			JSONArray obj_json_sub = new JSONArray();
			obj_json_sub.add(rs.getString(1));
			obj_json_sub.add(rs.getString(2));
			obj_json.add(obj_json_sub);
			
		}
		out.println(obj_json);
		conn.close();
		*/
	}
	
	if(paramRequest.equals("rent")){
		jndi.selectByIndex("CALL PieChartNetSalesBy('"+valueList+"',"+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')","1,2");
		out.println(jndi.getData());	
		/*
		String query="CALL PieChartRentBy('"+valueList+"',"+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"');";
		rs=mysqlConn.selectData(query);
		JSONArray obj_json = new JSONArray();
		
		while(rs.next()){
			JSONArray obj_json_sub = new JSONArray();
			obj_json_sub.add(rs.getString(1));
			obj_json_sub.add(rs.getString(2));
			obj_json.add(obj_json_sub);
			
		}
		out.println(obj_json);
		conn.close();
		*/
	}
	
	if(paramRequest.equals("investment")){
		jndi.selectByIndex("CALL PieChartNetSalesBy('"+valueList+"',"+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')","1,2");
		out.println(jndi.getData());	
		/*
		String query="CALL PieChartInvestmentBy('"+valueList+"',"+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"');";
		rs=mysqlConn.selectData(query);
		JSONArray obj_json = new JSONArray();
		
		while(rs.next()){
			JSONArray obj_json_sub = new JSONArray();
			obj_json_sub.add(rs.getString(1));
			obj_json_sub.add(rs.getString(2));
			obj_json.add(obj_json_sub);
			
		}
		out.println(obj_json);
		conn.close();
		*/
	}
	
	if(paramRequest.equals("ebit")){
		jndi.selectByIndex("CALL PieChartEBITBy('"+valueList+"',"+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')","1,2");
		out.println(jndi.getData());
		
		/*
		String query="CALL PieChartEBITBy('"+valueList+"',"+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"');";
		rs=mysqlConn.selectData(query);
		JSONArray obj_json = new JSONArray();
		
		while(rs.next()){
			JSONArray obj_json_sub = new JSONArray();
			obj_json_sub.add(rs.getString(1));
			obj_json_sub.add(rs.getString(2));
			obj_json.add(obj_json_sub);
		}
		out.println(obj_json);
		conn.close();
		*/
	}
	
	if(paramRequest.equals("topRentNet")){
		
		jndi.selectByIndex("CALL TopRentNet("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')","1,2,3,4");
		out.println(jndi.getData());
		
		/*
		String query="CALL TopRentNet("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"');";
		rs=mysqlConn.selectData(query);
		JSONArray obj_json = new JSONArray();
		
		while(rs.next()){
			JSONArray obj_json_sub = new JSONArray();
			obj_json_sub.add(rs.getString(1));
			obj_json_sub.add(rs.getString(2));
			obj_json_sub.add(rs.getString(3));
			obj_json_sub.add(rs.getString(4));
			obj_json.add(obj_json_sub);
		}
		out.println(obj_json);
		conn.close();
		*/
	}
	
	if(paramRequest.equals("bottomRentNet")){
		
		
		jndi.selectByIndex("CALL TopRentNet("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')","1,2,3,4");
		out.println(jndi.getData());
		
		
		/*
		String query="CALL BottomRentNet("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"');";
		rs=mysqlConn.selectData(query);
		JSONArray obj_json = new JSONArray();
		
		while(rs.next()){
			JSONArray obj_json_sub = new JSONArray();
			obj_json_sub.add(rs.getString(1));
			obj_json_sub.add(rs.getString(2));
			obj_json_sub.add(rs.getString(3));
			obj_json_sub.add(rs.getString(4));
			obj_json.add(obj_json_sub);
		}
		out.println(obj_json);
		conn.close();
		*/
		
	}
	
	
	
	
	
%>
