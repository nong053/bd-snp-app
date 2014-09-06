<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="connectionPackage.*"%>

<!--<link href="styles/dashboard1.css" rel="stylesheet">-->
<script type="text/javascript" src="devJs/overview_engine.js"
	type="text/javascript"></script>
<%

// DropDown NetSalses Start
	overviewService connJNDI = new overviewService();
	
	/*
String optionNetSales="";
String queryNetSales="CALL DropDown();";
rs=mysqlConn.selectData(queryNetSales);
optionNetSales+="<select class=\"listSelect1\" id=\"netSales\">";
while(rs.next()){
	optionNetSales+="<option>"+rs.getString(1)+"</option>";
}
optionNetSales+="</select>";
conn.close();
*/
//DropDown NetSalses End

//DropDown Rent Start
/*
String optionRent="";
String queryRent="CALL DropDown();";
rs=mysqlConn.selectData(queryRent);
optionRent+="<select class=\"listSelect1\" id=\"rent\">";
while(rs.next()){
	optionRent+="<option>"+rs.getString(1)+"</option>";
}
optionRent+="</select>";
conn.close();
*/
//DropDown Rent End

//DropDown Investment Start
/*
String optionInvestment="";
String queryInvestment="CALL DropDown();";
rs=mysqlConn.selectData(queryInvestment);
optionInvestment+="<select class=\"listSelect1\" id=\"investment\">";
while(rs.next()){
	optionInvestment+="<option>"+rs.getString(1)+"</option>";
}
optionInvestment+="</select>";
conn.close();
*/
//DropDown Investment End

//DropDown EBIT Start
/*
String optionEbit="";
String queryEbit="CALL DropDown();";
rs=mysqlConn.selectData(queryEbit);
optionEbit+="<select class=\"listSelect1\" id=\"ebit\">";
while(rs.next()){
	optionEbit+="<option>"+rs.getString(1)+"</option>";
}
optionEbit+="</select>";
conn.close();
*/
//DropDown EBIT End

%>



<div id="dashboard1Box">
	<div class="mainRow">
		<div class="box">
			<div class="title">

				<div class="tile_l">Net Sales by</div>
				<div class="tile_r">
					<% connJNDI.setOptionOverview("CALL DropDown()","netSales"); %>
					<%=connJNDI.getOptionOverview()%>
					<!--  
				<select class="listSelect1">
						<option>Location Type</option>
						
				</select>
				-->
				</div>
				<br style="clear: both">
			</div>

			<div class="content">
				<div id="chartNetSales" class="chart"></div>
			</div>
		</div>
		<div class="box">
			<div class="title">

				<div class="tile_l">Rent by</div>
				<div class="tile_r">
					<% connJNDI.setOptionOverview("CALL DropDown()","rent"); %>
					<%=connJNDI.getOptionOverview()%>
					<!--  
					<select class="listSelect1">
						<option>Location Type</option>
						
					</select>
				-->
				</div>
				<br style="clear: both">

			</div>
			<div class="content">
				<div id="chartRent" class="chart"></div>
			</div>
		</div>
		<div class="dataGrid">
			<div class="title">
				<div class="tile_l">Top 10 Rent /Net Sales</div>

				<br style="clear: both">
			</div>
			<div class="content">
				<table id="gridTopRentNet" class="grid">
					<thead>
						<tr>

							<th data-field="branch"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="rent"><center>
									<b>Rent
								</center></th>
							<th data-field="netSales"><center>
									<b>Net Sales</b>
								</center></th>
							<th data-field="rentNetSales"><center>
									<b>Rent/<br>NetSales</b>
								</center></th>

						</tr>
					</thead>
					<tbody>
						<tr>

							<td></td>
							<td></td>
							<td></td>
							<td></td>

						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="br"></div>
	</div>

	<div class="mainRow">
		<div class="box">
			<div class="title">

				<div class="tile_l">Investment by</div>
				<div class="tile_r">
					<% connJNDI.setOptionOverview("CALL DropDown()","investment"); %>
					<%=connJNDI.getOptionOverview()%>
					<!-- 
				<select class="listSelect1">
						<option>Location Type</option>
						
				</select>
				-->
				</div>
				<br style="clear: both">
			</div>

			<div class="content">
				<div id="chartInvestment" class="chart"></div>
			</div>
		</div>
		<div class="box">
			<div class="title">

				<div class="tile_l">EBIT by</div>
				<div class="tile_r">
					<% connJNDI.setOptionOverview("CALL DropDown()","ebit"); %>
					<%=connJNDI.getOptionOverview()%>
					<!-- 
				<select class="listSelect1">
						<option>Location Type</option>
						
				</select>
				-->
				</div>
				<br style="clear: both">

			</div>
			<div class="content">
				<div id="chartEbit" class="chart"></div>
			</div>
		</div>
		<div class="dataGrid">
			<div class="title">
				<div class="tile_l">Bottom 10 Rent/Net Sales</div>

				<br style="clear: both">
			</div>
			<div class="content">
				<table id="gridBottomRentNet" class="grid">
					<thead>
						<tr>

							<th data-field="branch"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="rent"><center>
									<b>Rent
								</center></th>
							<th data-field="netSales"><center>
									<b>Net Sales</b>
								</center></th>
							<th data-field="rentNetSales"><center>
									<b>Rent/<br>NetSales</b>
								</center></th>

						</tr>
					</thead>
					<tbody>
						<tr>

							<td></td>
							<td></td>
							<td></td>
							<td></td>

						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="br"></div>
	</div>
</div>
