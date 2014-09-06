<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="connectionPackage.*"%>

<%
//GET PARAMETER START
connectionPackage.connectionJNDI jndi = new connectionPackage.connectionJNDI();

String paramRequest = request.getParameter("paramRequest");
String paramBranchCode = request.getParameter("paramBranchCode");
String paramBranchKey = request.getParameter("paramBranchKey");

String paramValueList = request.getParameter("paramValueList");
String paramYear = request.getParameter("paramYear");
String paramMonthFrom = request.getParameter("paramMonthFrom");
String paramMonthTo = request.getParameter("paramMonthTo");
String paramBrand = request.getParameter("paramBrand");
String paramCountry = request.getParameter("paramCountry");
String paramRegion = request.getParameter("paramRegion");
String paramProvince = request.getParameter("paramProvince");
String paramArea = request.getParameter("paramArea");
//StoreFactsContract

/*
	sesParamBrand
	sesParamCountry
	sesParamRegion
	sesParamProvince
	sesParamArea
	*/
if(paramRequest.equals("optionBrach")){
	
	
	jndi.setOptionBranch("CALL ParameterBranch('"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"' )");
	out.println(jndi.getOptionBranch());
	
}
if(paramRequest.equals("StoreFactsContract")){
	/*
	[["415","2010-10-01","2011-09-30","1 ปี","1","106800.00","80000.00","35600.00","20000.00","22.00","12.99","12.00","2310.00","103"]]
	*/
	jndi.setStoreFactsContract("CALL StoreFactsContract("+paramBranchCode+")",""+paramBranchCode+"","2,3,4,5,6,7,8,9,10,11,12,13,1");
	out.println(jndi.getData());
/*
	String queryStoreFactsContract="CALL StoreFactsContract("+paramBranchCode+")";
	rs=mysqlConn.selectData(queryStoreFactsContract);
	JSONArray objData= new JSONArray();
	while(rs.next()){
		JSONArray subObjData= new JSONArray();
		subObjData.add(paramBranchCode);//Branch code
		
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
		subObjData.add(rs.getString(1));//Branch key
		objData.add(subObjData);
	}
	out.print(objData);
	conn.close();
*/	
	
}
//General
if(paramRequest.equals("General")){
	
	//jndi.setStoreFactsContractName("CALL StoreFactsContract("+paramBranchCode+")","Address,TelNo,FaxNo,MobileNo,OpenDate,RentType,LocationType,LandlordGroup,BrandName,FormatName,TableQty,TotalSeatQty,RevenueSeatQty");
	jndi.setStoreFactsContractIndex("CALL StoreFactsContract("+paramBranchCode+")","14,15,16,17,18,19,20,21,22,23,24,25,26");
	out.println(jndi.getData());
	
	//13,14,15,16,17,18
	/*
	String queryStoreFactsContract="CALL StoreFactsContract("+paramBranchCode+")";
	rs=mysqlConn.selectData(queryStoreFactsContract);
	JSONArray objData= new JSONArray();
	JSONArray subObjData= new JSONArray();
	while(rs.next()){
		*/
		
		/*
		subObjData.add(rs.getString(13));//Address, 
		subObjData.add(rs.getString(14));//TelNo, 
		subObjData.add(rs.getString(15));//FaxNo, 
		subObjData.add(rs.getString(16));//MobileNo, 
		subObjData.add(rs.getString(17));//OpenDate, 
		subObjData.add(rs.getString(18));//RentType, 
		subObjData.add(rs.getString(19));//LocationType, 
		subObjData.add(rs.getString(20));//LandlordGroup, 
		subObjData.add(rs.getString(21));//BrandName, 
		subObjData.add(rs.getString(22));//FormatName, 
		subObjData.add(rs.getString(23));//TableQty, 
		subObjData.add(rs.getString(24));//TotalSeatQty, 
		subObjData.add(rs.getString(25));//RevenueSeatQty, 
		*/
		/*
		subObjData.add(rs.getString("Address"));//Address, 
		subObjData.add(rs.getString("TelNo"));//TelNo, 
		subObjData.add(rs.getString("FaxNo"));//FaxNo, 
		subObjData.add(rs.getString("MobileNo"));//MobileNo, 
		subObjData.add(rs.getString("OpenDate"));//OpenDate, 
		subObjData.add(rs.getString("RentType"));//RentType, 
		subObjData.add(rs.getString("LocationType"));//LocationType, 
		subObjData.add(rs.getString("LandlordGroup"));//LandlordGroup, 
		subObjData.add(rs.getString("BrandName"));//BrandName, 
		subObjData.add(rs.getString("FormatName"));//FormatName, 
		subObjData.add(rs.getString("TableQty"));//TableQty, 
		subObjData.add(rs.getString("TotalSeatQty"));//TotalSeatQty, 
		subObjData.add(rs.getString("RevenueSeatQty"));//RevenueSeatQty, 
		//objData.add(subObjData);
	}
	out.print(subObjData);
	conn.close();
	*/
}
//StoreFactsFeasibilityData Start
if(paramRequest.equals("StoreFactsFeasibilityData")){
	
	jndi.selectByIndex("CALL StoreFactsFeasibilityData("+paramBranchKey+")","1,2,3,4");
	out.println(jndi.getData());
	
	//out.print("General Here");
	/*
	String queryStoreFactsContract="CALL StoreFactsFeasibilityData("+paramBranchKey+")";
	rs=mysqlConn.selectData(queryStoreFactsContract);
	JSONArray objData= new JSONArray();
	
	while(rs.next()){
		JSONArray subObjData= new JSONArray();
		subObjData.add(rs.getString(1));// 
		subObjData.add(rs.getString(2));//
		subObjData.add(rs.getString(3));//
		subObjData.add(rs.getString(4));//
		

		objData.add(subObjData);
	}
	out.print(objData);
	conn.close();
	*/
}
//StoreFactsFeasibilityData End
%>