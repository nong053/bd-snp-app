<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="config.jsp"%>
<%
String query1="CALL PieChartNetSalesBy('FormatName',2008,01,12,'Maisen','Thailand','ภาคกลาง','กรุงเทพมหานคร',8);";
rs=mysqlConn.selectData(query1);
while(rs.next()){
	out.println("col1"+rs.getString(1));
	out.println("col2"+rs.getString(2));
}
out.println("hello netSales");
conn.close();

%>