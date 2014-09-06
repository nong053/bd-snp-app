<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="connectionPackage.*"%>
<%
//GET PARAMETER START
String paramRequest = request.getParameter("paramRequest");
String paramValueList = request.getParameter("paramValueList");
String paramYear = request.getParameter("paramYear");
String paramMonthFrom = request.getParameter("paramMonthFrom");
String paramMonthTo = request.getParameter("paramMonthTo");
String paramBrand = request.getParameter("paramBrand");
String paramCountry = request.getParameter("paramCountry");
String paramRegion = request.getParameter("paramRegion");
String paramProvince = request.getParameter("paramProvince");
String paramArea = request.getParameter("paramArea");
/*
<option value="BrandName">BrandName</option>
<option value="FormatName">FormatName</option>
<option value="LandlordGroup">LandlordGroup</option>
<option value="LocationType">LocationType</option>
<option value="RentType">RentType</option>
*/

connectionPackage.connectionJNDI jndi = new connectionPackage.connectionJNDI();

//Stack Bar BrandName Start
if(paramRequest.equals("BrandName")){
	jndi.selectByIndex("CALL StackBarChart_BrandName('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')","1,2,3");
	out.println(jndi.getData());
	
	/*
	String queryStackBar="CALL StackBarChart_BrandName('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')";
	rs=mysqlConn.selectData(queryStackBar);
	JSONArray  objData= new JSONArray();
	while(rs.next()){
		JSONArray  subObjData= new JSONArray();
		subObjData.add(rs.getString(1));
		subObjData.add(rs.getString(2));
		subObjData.add(rs.getString(3));
		objData.add(subObjData);
	}
	out.println(objData);
	conn.close();
	*/
	
}
//Stack Bar BrandName End


//Stack Bar FormatName Start
if(paramRequest.equals("FormatName")){
	jndi.selectByIndex("CALL StackBarChart_FormatName('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')","1,2,3");
	out.println(jndi.getData());
/*
	String queryStackBar="CALL StackBarChart_FormatName('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')";
	rs=mysqlConn.selectData(queryStackBar);
	JSONArray  objData= new JSONArray();
	while(rs.next()){
		JSONArray  subObjData= new JSONArray();
		subObjData.add(rs.getString(1));
		subObjData.add(rs.getString(2));
		subObjData.add(rs.getString(3));
		objData.add(subObjData);
	}
	out.println(objData);
	conn.close();
	
*/
}
//Stack Bar FormatName End

//Stack Bar LandlordGroup Start
if(paramRequest.equals("LandlordGroup")){
	jndi.selectByIndex("CALL StackBarChart_LandlordGroup('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')","1,2,3");
	out.println(jndi.getData());
/*
	String queryStackBar="CALL StackBarChart_LandlordGroup('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')";
	rs=mysqlConn.selectData(queryStackBar);
	JSONArray  objData= new JSONArray();
	while(rs.next()){
		JSONArray  subObjData= new JSONArray();
		subObjData.add(rs.getString(1));
		subObjData.add(rs.getString(2));
		subObjData.add(rs.getString(3));
		objData.add(subObjData);
	}
	out.println(objData);
	conn.close();
	
*/	
}
//Stack Bar LandlordGroup End

//Stack Bar LocationType Start
if(paramRequest.equals("LocationType")){
	jndi.selectByIndex("CALL StackBarChart_LocationType('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')","1,2,3");
	out.println(jndi.getData());
/*
	String queryStackBar="CALL StackBarChart_LocationType('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')";
	rs=mysqlConn.selectData(queryStackBar);
	JSONArray  objData= new JSONArray();
	while(rs.next()){
		JSONArray  subObjData= new JSONArray();
		subObjData.add(rs.getString(1));
		subObjData.add(rs.getString(2));
		subObjData.add(rs.getString(3));
		objData.add(subObjData);
	}
	out.println(objData);
	conn.close();
	
*/	
}
//Stack Bar LocationType End


//Stack Bar RentType Start
if(paramRequest.equals("RentType")){
	jndi.selectByIndex("CALL StackBarChart_RentType('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')","1,2,3");
	out.println(jndi.getData());
/*
	String queryStackBar="CALL StackBarChart_RentType('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')";
	rs=mysqlConn.selectData(queryStackBar);
	JSONArray  objData= new JSONArray();
	while(rs.next()){
		JSONArray  subObjData= new JSONArray();
		subObjData.add(rs.getString(1));
		subObjData.add(rs.getString(2));
		subObjData.add(rs.getString(3));
		objData.add(subObjData);
	}
	out.println(objData);
	conn.close();
	
*/	
}
//Stack Bar RentType End


//InvestmentByConstructionType Pie Start
if(paramRequest.equals("InvestmentByConstructionType")){
	jndi.selectByIndex("CALL InvestmentByConstructionType('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')","1,2");
	out.println(jndi.getData());
	
/*	
	
	
	//'BrandName','2012','01','12','ALL','Thailand','ภาคกลาง','กรุงเทพ','ALL'
	String queryStackBar="CALL InvestmentByConstructionType('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')";
	rs=mysqlConn.selectData(queryStackBar);
	
	JSONArray  objData= new JSONArray();
	while(rs.next()){
		JSONArray  subObjData= new JSONArray();
		subObjData.add(rs.getString(1));
		subObjData.add(rs.getString(2));
		objData.add(subObjData);
	
	}
	out.println(objData);
	conn.close();
*/	
}

//InvestmentByConstructionType Pie End

//ROITop Start
if(paramRequest.equals("ROITop")){
	jndi.selectByIndex("CALL ROITop('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')","1,2,3,4");
	out.println(jndi.getData());
	
/*	
	
	
	//'BrandName','2012','01','12','ALL','Thailand','ภาคกลาง','กรุงเทพ','ALL'
	String queryStackBar="CALL ROITop('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')";
	rs=mysqlConn.selectData(queryStackBar);
	
	JSONArray  objData= new JSONArray();
	while(rs.next()){
		JSONArray  subObjData= new JSONArray();
		subObjData.add(rs.getString(1));//Branch
		subObjData.add(rs.getString(2));//sum(EBIT)
		subObjData.add(rs.getString(3));//sum(NewStoreInvestment)
		subObjData.add(rs.getString(4));//ROI
		objData.add(subObjData);
	
	}
	out.println(objData);
	conn.close();
*/	
}
//ROITop End
//ROIBottom Start
if(paramRequest.equals("ROIBottom")){
	jndi.selectByIndex("CALL ROIBottom('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')","1,2,3,4");
	out.println(jndi.getData());
/*	
	
	
	//'BrandName','2012','01','12','ALL','Thailand','ภาคกลาง','กรุงเทพ','ALL'
	String queryStackBar="CALL ROIBottom('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')";
	rs=mysqlConn.selectData(queryStackBar);
	
	JSONArray  objData= new JSONArray();
	while(rs.next()){
		JSONArray  subObjData= new JSONArray();
		subObjData.add(rs.getString(1));//Branch
		subObjData.add(rs.getString(2));//sum(EBIT)
		subObjData.add(rs.getString(3));//sum(NewStoreInvestment)
		subObjData.add(rs.getString(4));//ROI
		objData.add(subObjData);
	
	}
	out.println(objData);
	conn.close();
*/	
}
//ROIBottom End

//InvestmentSqM Start
if(paramRequest.equals("InvestmentSqM")){
	jndi.selectByIndex("CALL InvestmentSqM('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')","1,2,3,4");
	out.println(jndi.getData());
	
	/*
	
	//'BrandName','2012','01','12','ALL','Thailand','ภาคกลาง','กรุงเทพ','ALL'
	String queryStackBar="CALL InvestmentSqM('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')";
	rs=mysqlConn.selectData(queryStackBar);
	
	JSONArray  objData= new JSONArray();
	while(rs.next()){
		JSONArray  subObjData= new JSONArray();
		subObjData.add(rs.getString(1));//Branch
		subObjData.add(rs.getString(2));//sum(EBIT)
		subObjData.add(rs.getString(3));//sum(NewStoreInvestment)
		subObjData.add(rs.getString(4));//ROI
		objData.add(subObjData);
	
	}
	out.println(objData);
	conn.close();
	*/
}
//InvestmentSqM End

//LandlordGroup Start
if(paramRequest.equals("LandlordGroup2")){
	
	jndi.selectByIndex("CALL InvestmentSqM('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')","1,2,3,4");
	out.println(jndi.getData());
	/*
	
	String queryStackBar="CALL InvestmentSqM('"+paramYear+"','"+paramMonthFrom+"','"+paramMonthTo+"','"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')";
	rs=mysqlConn.selectData(queryStackBar);
	
	JSONArray  objData= new JSONArray();
	while(rs.next()){
		JSONArray  subObjData= new JSONArray();
		subObjData.add(rs.getString(1));//Branch
		subObjData.add(rs.getString(2));//sum(EBIT)
		subObjData.add(rs.getString(3));//sum(NewStoreInvestment)
		subObjData.add(rs.getString(4));//ROI
		objData.add(subObjData);
	
	}
	out.println(objData);
	conn.close();
	*/
}
//LandlordGroup End

%>