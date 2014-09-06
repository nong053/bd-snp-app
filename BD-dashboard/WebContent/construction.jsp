<%@page contentType="text/html" pageEncoding="utf-8"%>
<!--
<link href="styles/dashboardConstruction.css" rel="stylesheet">
-->
<script type="text/javascript" src="Controller/construction_engine.js"
	type="text/javascript"></script>
<%@ include file="config.jsp"%>


<%
// DropDown NetSalses Start
String optionNetSales="";
String queryNetSales="CALL DropDown();";
rs=mysqlConn.selectData(queryNetSales);
optionNetSales+="<select class=\"listSelect1\" id=\"investment\">";
while(rs.next()){
	optionNetSales+="<option>"+rs.getString(1)+"</option>";
}
optionNetSales+="</select>";
conn.close();
//DropDown NetSalses End
%>

<div id="dashboard1Box">
	<div class="mainRow">
		<div class="box">
			<div class="title">

				<div class="tile_l" style='width: 170px;'>Investment by</div>
				<div class="tile_r">
					<!--
				<select class="listSelect1">
						 <option>Formant</option>
				</select>
				-->
					<%=optionNetSales%>
				</div>
				<br style="clear: both">
			</div>

			<div class="content">
				<div id="barChart"></div>
			</div>
		</div>
		<div class="box">
			<div class="title">

				<div class="tile_l">Top 10 ROI (Year 3) :</div>
				<div class="tile_r"></div>
				<br style="clear: both">

			</div>
			<div class="content">
				<table class="grid" id='topROIGrid'>
					<thead>
						<tr>

							<th data-field="field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="field2"><center>
									<b>EBIT
								</center></th>
							<th data-field="field3"><center>
									<b>New Store <br> Investment
									</b>
								</center></th>
							<th data-field="field4"><center>
									<b>ROI</b>
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
		<div class="box">
			<div class="title">
				<div class="tile_l">Bottom 10 ROI (Year 3) :</div>

				<br style="clear: both">
			</div>
			<div class="content">
				<table class="grid" id='bottomROIGrid'>
					<thead>
						<tr>

							<th data-field="field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="field2"><center>
									<b>EBIT
								</center></th>
							<th data-field="field3"><center>
									<b>New Store<br>Investment
									</b>
								</center></th>
							<th data-field="field4"><center>
									<b>ROI</b>
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

				<div class="tile_l">Investment by Construction Type :</div>
				<div class="tile_r"></div>
				<br style="clear: both">
			</div>

			<div class="content">
				<div class="chart"></div>
			</div>
		</div>
		<div class="box">
			<div class="title">

				<div class="tile_l">Top 10 Investment/SqM :</div>
				<div class="tile_r"></div>
				<br style="clear: both">

			</div>
			<div class="content">

				<table class="grid" id='topInvestmentGrid'>
					<thead>
						<tr>

							<th data-field="field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="field2"><center>
									<b>New Store<br> Investment
								</center></th>
							<th data-field="field3"><center>
									<b>Sqm</b>
								</center></th>
							<th data-field="field4"><center>
									<b>Ratio</b>
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
		<div class="box">
			<div class="title">
				<div class="tile_l">Bottom 10 Investment/Sqm :</div>

				<br style="clear: both">
			</div>
			<div class="content">
				<table class="grid" id='bottomInvestmentGrid'>
					<thead>
						<tr>

							<th data-field="field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="field2"><center>
									<b>New Store <br>Investment
								</center></th>
							<th data-field=field3><center>
									<b>Sqm</b>
								</center></th>
							<th data-field="field4"><center>
									<b>Ratio</b>
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