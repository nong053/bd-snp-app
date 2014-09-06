<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="config.jsp"%>
<% connectionPackage.connectionJNDI jndi = new connectionPackage.connectionJNDI(); %>

<!doctype html>
<html>
<head>
<title>SNP Dashboard</title>
<!-- load stylesheet แบบ external-->

<link href="styles/index.css" rel="stylesheet">

<link href="styles/kendo.common.min.css" rel="stylesheet">
<link href="styles/kendo.default.min.css" rel="stylesheet">
<!--<link href="jqueryUI/css/cupertino/jquery-ui-1.8.21.custom.css" rel="stylesheet">-->

<link href="jqueryUI/css/custom-theme/jquery-ui-1.9.2.custom.min.css"
	rel="stylesheet">

<link href="styles/kendo.dataviz.min.css" rel="stylesheet">


<!-- load stylesheet-->
<!-- กำหนด stylesheet แบบ embed-->
<!-- load javascript-->
<script src="js/jquery.min.js"></script>
<script src="js/kendo.all.min.js" type="text/javascript"></script>
<script src="js/kendo.dataviz.min.js" type="text/javascript"></script>
<!-- 
		<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js" type="text/javascript"></script>
		-->
<script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"
	type="text/javascript"></script>

<script type="text/javascript" src="js/jquery.sparkline.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="devJs/main_engine.js"
	type="text/javascript"></script>


<!-- load javascript-->

<style type="text/css">
html,body {
	background-color: white;
	color: black;
	font-size: 12px;
	font: Tahoma;
	margin: 0;
	padding: 0;
}

* {
	font: Tahoma;
}

#content {
	width: 975px;
	margin: auto;
}

#Detail-Panel {
	position: absolute;
	top: 80px;
	left: 0px;
	border-radius: 5px;
	/*border: 1px solid #dedede;
		background-color:#008EC3;*/
}

#loading {
	display: none;
	position: absolute;
	z-index: 10000;
	color: #000000;
	background: #ffffff;
	font-weight: bold;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #FFAF0F;
}

#loading #loadText {
	display: inline;
}

#loading #loadImage {
	display: inline;
}

table tbody tr td .toRight {
	text-align: right;
}

.tableTitileWidth {
	width: 200px;
}

.tableParamWidth {
	width: 200px;
}
</style>

<style scoped>
#Main-Panel {
	margin: 0px;
	margin-bottom: 2px;
	padding: 3px;
	/*border: 1px solid #dedede;*/
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	text-align: left;
	min-height: 30px;
	width: 1180px;
	position: relative;
	/*background-color:#008EC3;*/
	background-color: #8B4513;
	color: white;
	font-weight: bold;
}
</style>
<%
//################# Define Parameter Default Value ###########################
//Select Year start

String queryYear="CALL ParamYear();";
rs=mysqlConn.selectData(queryYear);
String optionYear="";
optionYear+="<select  name=\"paramYear\" id=\"paramYear\" class=\"listSelect\">";
while(rs.next()){
	
	optionYear+="<option>"+rs.getString(1)+"</option>";
	
}
conn.close();
optionYear+="</select>";

//out.println("optionYear"+optionYear);

//Year End
//################ Month From Start
String queryMonthFrom="CALL ParamMonthFrom();";
rs=mysqlConn.selectData(queryMonthFrom);
String optionMonthFrom="";
optionMonthFrom+="<select name=\"paramMonthFrom\" id=\"paramMonthFrom\" class=\"listSelect\">";
while(rs.next()){
	optionMonthFrom+="<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>";
}
conn.close();
optionMonthFrom+="</select>";

//out.println("option"+optionMonthFrom);
//################ Month From End

//################ Month To Start
   
 String currentMonth=new java.text.SimpleDateFormat("M").format(new java.util.Date());
//out.println("month"+currentMonth);  

String queryMonthTo="CALL ParamMonthTo()";
rs=mysqlConn.selectData(queryMonthTo);
String optionMonthTo="";
optionMonthTo+="<select name=\"paramMonthTo\" id=\"paramMonthTo\" class=\"listSelect\">";
while(rs.next()){
	if(currentMonth.equals(rs.getString(1))){
		optionMonthTo+="<option value='"+rs.getString(1)+"' selected>"+rs.getString(2)+"</option>";
	}else{
		optionMonthTo+="<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>";
	}
}
conn.close();
optionMonthTo+="</select>";

//out.println("option"+optionMonthTo);
//################ Month To End

//################ Brand Start
String queryBrand="CALL ParamBrand();";
rs=mysqlConn.selectData(queryBrand);
String optionBrand="";
optionBrand+="<select name=\"paramBrand\" id=\"paramBrand\" class=\"listSelect\">";
while(rs.next()){
	
	optionBrand+="<option>"+rs.getString(1)+"</option>";
	
}
conn.close();
optionBrand+="</select>";

//out.println("optionBrand"+optionBrand+"</br>");
//################ Brand End

//################ Country Start
String queryCountry="CALL ParamCountry();";
rs=mysqlConn.selectData(queryCountry);
String optionCountry="";
optionCountry+="<select name=\"paramCountry\" id=\"paramCountry\" class=\"listSelect\">";
while(rs.next()){
	optionCountry+="<option>"+rs.getString(1)+"</option>";
}
conn.close();
optionCountry+="</select>";

//out.println("optionCountry"+optionCountry+"</br>");
//################ Country End

%>
<script class="code" type="text/javascript">

$(document).ready(function(){
	//ajax Start
	$("#loading").ajaxStart(function(){
		
		/*
		var	width = $("body").width();
			width = (width/2)-20;
			hieght =18;
		*/
			var widthImg=(screen.availWidth/2)-50;
			var	hieghtImg=(screen.availHeight/2)-50;
		$(this).css({"top":hieghtImg+"px","left":widthImg}).show();
		});


	//ajax Stop
	$("#loading").ajaxStop(function(){
	$(this).hide();
	
	}); 
	
	
	
	//$("#areaparamYear").html(optionYear);
	//alert(optionYear);
	
	
	//Auto Click
	//$("#tabs").tabs();	
	//$("a[href=#tabs-1]").trigger("click");
	
	//#############load dashboard 1###############
	$("a[href=#tabs-1]").click(function(){
		$(".sessParamPage").remove();
		$("body").append("<input type='hidden' name='sessParamPage' class='sessParamPage'  value='tabs1'>");
		$.ajax({
			url:'overview.jsp',
			type:'get',
			dataType:'html',
			success:function(data){
				$(".allPage").empty();
				$("#tabs-1").html(data);
				$(".listSelect1").kendoDropDownList();
				
			}
		});
	});



	
	$("a[href=#tabs-2]").click(function(){
		$(".sessParamPage").remove();
		$("body").append("<input type='hidden' name='sessParamPage' class='sessParamPage'  value='tabs2'>");
		$.ajax({
			url:'rent.jsp',
			type:'get',
			dataType:'html',
			success:function(data){
				$(".allPage").empty();
				$("#tabs-2").html(data);
				$(".listSelect1").kendoDropDownList();
			}
		});
	});
	
	$("a[href=#tabs-3]").click(function(){
		$(".sessParamPage").remove();
		$("body").append("<input type='hidden' name='sessParamPage' class='sessParamPage'  value='tabs3'>");
		$.ajax({
			url:'construction.jsp',
			type:'get',
			dataType:'html',
			success:function(data){
				$(".allPage").empty();
				$("#tabs-3").html(data);
				$(".listSelect1").kendoDropDownList();
			}
		});
	});
	
	$("a[href=#tabs-4]").click(function(){
		$(".sessParamPage").remove();
		$("body").append("<input type='hidden' name='sessParamPage' class='sessParamPage'  value='tabs4'>");
		$.ajax({
			url:'storeFacts.jsp',
			type:'get',
			dataType:'html',
			success:function(data){
				$(".allPage").empty();
				$("#tabs-4").html(data);
				$(".listSelect1").kendoDropDownList();
			}
		});
	});
	
	$("a[href=#tabs-5]").click(function(){
		$(".sessParamPage").remove();
		$("body").append("<input type='hidden' name='sessParamPage' class='sessParamPage'  value='tabs5'>");
		$.ajax({
			url:'oldvsNew.jsp',
			type:'get',
			dataType:'html',
			success:function(data){
				$(".allPage").empty();
				$("#tabs-5").html(data);
				$(".listSelect1").kendoDropDownList();
			}
		});
	});
	
	$(".listSelect").kendoDropDownList();
});	
	
</script>

</head>
<body>
<!--
<a href="http://localhost:8080/pentaho/Home?name=BD.xaction&startup-url=%2Fpentaho%2FViewAction%3Fsolution%3DBD_Dashboard%26path%3D%26action%3DBD.xaction" target="_black">link test
</a>
-->
	<div id="mainCope">
		<!--  mainCope here-->
	</div>
	<!-- main scope end -->
	<div align="center">
		<!--------------------------- HEADER --------------------------->
		<div id="Main-Panel" class="k-content">

			<form method="GET" id="form">
				<table width=100%>
					<tr>
						<td class="tableTitileWidth"><label for="paramYear"><div
									class="toRight">Year :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></label></td>

						<td class="tableParamWidth" id="areaParamYear"><%=optionYear%>
							<!-- 
					<select name="paramYear" id="paramYear" class="listSelect">
						<option>2013</option>
						<option>2012</option>
						<option>2011</option>
					</select>
					--></td>

						<td class="tableTitileWidth"><label for="paramMonthFrom"><div
									class="toRight">From :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></label></td>
						<td class="tableParamWidth" id="areaParamMonthFrom"><%=optionMonthFrom%>
							<!--  
					<select name="paramMonthFrom" id="paramMonthFrom" class="listSelect">
						<option>Jan</option>
						<option>Feb</option>
						<option>Mar</option>
						<option>Apr</option>
						<option>May</option>
						<option>Jun</option>
						<option>Jul</option>
						<option>Aug</option>
						<option>Sep</option>
						<option>Oct</option>
						<option>Nov</option>
						<option>Dec</option>

					</select>
					--></td>

						<td class="tableTitileWidth"><label for="paramMonthTo"><div
									class="toRight">To :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></label></td>
						<td class="tableParamWidth" id="areaParamMonthTo"><%=optionMonthTo%>
							<!-- 
					<select name="paramMonthTo" id="paramMonthTo" class="listSelect">
						<option>Jan</option>
						<option>Feb</option>
						<option>Mar</option>
						<option>Apr</option>
						<option>May</option>
						<option>Jun</option>
						<option>Jul</option>
						<option>Aug</option>
						<option>Sep</option>
						<option>Oct</option>
						<option>Nov</option>
						<option selected>Dec</option>
					</select>
					--></td>

						<td class="tableTitileWidth"><label for="paramBrand"><div
									class="toRight">Brand :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></label></td>
						<td class="tableParamWidth" id="areaParamBrand"><%=optionBrand%>
							<!--  
					<select name="paramBrand" id="paramBrand" class="listSelect">
						
						<option>DESC</option>
						<option>ASC</option>
						
					</select>
					--></td>
						<td></td>


					</tr>
					<tr>
						<td class="tableTitileWidth"><label for="paramCountry"><div
									class="toRight">Country :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></label></td>
						<td class="tableParamWidth" id="areaParamCountry"><%=optionCountry%>
							<!-- 
					<select name="paramCountry" id="paramCountry" class="listSelect">
						<option>ไทย</option>
						<option>มาเลเซีย</option>
					</select>
					--></td>


						<td class="tableTitileWidth"><label for="paramRegion"><div
									class="toRight">Region :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></label></td>
						<td class="tableParamWidth" id="areaparamRegion"><select
							name="paramRegion" id="paramRegion" class="listSelect">
								<option value='ALL'>ALL</option>



						</select></td>
						<td class="tableTitileWidth"><label for="paramProvince"><div
									class="toRight">Province :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></label>
						</td>
						<td class="tableParamWidth" id="areaparamProvince">
							<!-- 
					<select name="paramProvince" id="paramProvince" class="listSelect">
						<option>กรุงเทพ</option>
						<option>กาฬสินธ์</option>
						<option>กาญจนบุรี</option>
					</select>
					-->
						</td>
						<td class="tableTitileWidth"><label for="paramArea"><div
									class="toRight">Area :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></label></td>
						<td class="tableParamWidth" id="areaparamArea">
							<!-- 
					<select name="paramArea" id="paramArea" class="listSelect">
					
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						
					</select>
					-->
						</td>
						<td><input type="submit" value="&nbsp;&nbsp;OK&nbsp;&nbsp;"
							class="k-button" id="submit"></td>
					</tr>
				</table>
			</form>

		</div>
		<!--------------------------- HEADER --------------------------->
		<!--------------------------- CONTENT --------------------------->
		<div id="mainBody">
			<div id="mainbox">

				<div id="tabs">
					<ul>
						<li><a href="#tabs-1">Overview</a></li>
						<li><a href="#tabs-2">Rent</a></li>
						<li><a href="#tabs-3">Construction</a></li>
						<li><a href="#tabs-4">Store Facts</a></li>
						<li><a href="#tabs-5">Old vs New</a></li>
					</ul>
					<div id="tabs-1" class="allPage"></div>
					<div id="tabs-2" class="allPage"></div>
					<div id="tabs-3" class="allPage"></div>
					<div id="tabs-4" class="allPage"></div>
					<div id="tabs-5" class="allPage"></div>
				</div>

			</div>
		</div>

		<!--------------------------- CONTENT --------------------------->
	</div>



	<div id="loading">
		<span id="loadText">Loading... </span>
		<div id="loadImage">
			<img src="images/loader.gif">
		</div>
	</div>
</body>
</html>
