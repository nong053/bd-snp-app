<%@page import="java.sql.*"%>
<%@page import="connectionPackage.*"%>
<%@ page language="java" import="net.sf.json.JSONArray"%>
<%
ConnectionDb mysqlConn = new ConnectionDb();


/*

	mysqlConn.setDriver("oracle.jdbc.driver.OracleDriver");
	mysqlConn.setUrl("jdbc:oracle:thin:@172.18.88.205:1525:prod");
	mysqlConn.setUser("apps");
	mysqlConn.setPass("apps");
*/
	
	mysqlConn.setDriver("com.mysql.jdbc.Driver");
	mysqlConn.setUrl("jdbc:mysql://localhost:3306/snp-dwh?characterEncoding=UTF-8");
	//mysqlConn.setUrl("jdbc:mysql://10.14.199.199:3306/SNP-DWH?characterEncoding=UTF-8");
	//mysqlConn.setUrl("jdbc:mysql://gjserver:3306/snp-dwh?characterEncoding=UTF-8");
	mysqlConn.setUser("root");
	mysqlConn.setPass("root");
	
    Connection conn;
    ResultSet rs=null;
    conn=mysqlConn.testConnect();
    
    if(!conn.isClosed()){
    	//out.print("ok connect database is sucessfully");
  	
    }
    
%>