<%@page contentType="text/html" pageEncoding="utf-8"%>

<!--<link href="styles/dashboard_rent.css" rel="stylesheet">-->
<script type="text/javascript" src="Controller/rent_engine.js"
	type="text/javascript"></script>
<script>

var $titleJ =[
              {
                  field: "Field1",
				   width: 60
              },
              {
                  field: "Field2",
				  width: 60
			 }];

	var $dataJ =[
                  {
                	  Field1: "&nbsp;",
                	  Field2: "",
                  },
                  {
                	  Field1: "&nbsp;",
                	  Field2: "",
                	
				  },
                  {
					   Field1: "&nbsp;",
                	   Field2: "",
                	
				  },
                  {
					  Field1: "&nbsp;",
                	  Field2: "",
                	
				  },
                  {
					  Field1: "&nbsp;",
                	  Field2: "",
                	
				  }
				  
				  ]; 	
	// ################ Genarate GRID #################1 //
	var gridTopBottom = function(objDataGrid,paramGridName){

	
	//Create gird
	/*
	<table id="gridRentSqM">
					  <thead>
					      <tr>
							  
					          <th data-field="Field1" ><center><b>Branch</b></center></th>
							  <th  data-field="Fild2"><center><b>Rent/SqM</center></th>
							  

						  </tr>
					  </thead>
					  <tbody>
					      <tr>
					        
					          <td></td>
							  <td></td>
					          

						</tr>	
					  </tbody>
			  </table>
	*/
	$("#"+paramGridName).remove();
	
	var tableGridHTML="";
	tableGridHTML+="<table id="+paramGridName+">";
	tableGridHTML+="<thead>";
		tableGridHTML+="<tr>";
		var titleRentType="";
		/*
		Rent/SqM
		Net Sales/SqM
		Rent/Net Sales 	 
		*/
		
			if(paramGridName=="gridRentSqM"){
				titleRentType="Rent/SqM";
			}else if(paramGridName=="gridNetSalesSqM"){
				titleRentType="Net Sales/SqM";
			}else if(paramGridName=="gridRentNetSales"){
				titleRentType="Rent/Net Sales";
			}
		
			if(paramGridName=="gridLandlordGroupRentSqM"){
				titleRentType="Rent/SqM";
			}else if(paramGridName=="gridLandlordGroupNetSalesSqM"){
				titleRentType="Net Sales/SqM";
			}else if(paramGridName=="gridLandlordGroupRentNetSales"){
				titleRentType="Rent/Net Sales";
			}
			
			if(paramGridName=="gridBrandRentSqM"){
				titleRentType="Rent/SqM";
			}else if(paramGridName=="gridBrandNetSalesSqM"){
				titleRentType="Net Sales/SqM";
			}else if(paramGridName=="gridBrandRentNetSales"){
				titleRentType="Rent/Net Sales";
			}
			
			if(paramGridName=="gridRegionProvinceRentSqM"){
				titleRentType="Rent/SqM";
			}else if(paramGridName=="gridRegionProvinceNetSalesSqM"){
				titleRentType="Net Sales/SqM";
			}else if(paramGridName=="gridRegionProvinceRentNetSales"){
				titleRentType="Rent/Net Sales";
			}
			
			if(paramGridName=="gridAreaRentSqM"){
				titleRentType="Rent/SqM";
			}else if(paramGridName=="gridAreaNetSalesSqM"){
				titleRentType="Net Sales/SqM";
			}else if(paramGridName=="gridAreaRentNetSales"){
				titleRentType="Rent/Net Sales";
			}
			
			if(paramGridName=="gridFormatRentSqM"){
				titleRentType="Rent/SqM";
			}else if(paramGridName=="gridFormatSalesSqM"){
				titleRentType="Net Sales/SqM";
			}else if(paramGridName=="gridFormatRentNetSales"){
				titleRentType="Rent/Net Sales";
			}
		
		
			tableGridHTML+="<th data-field=\"Field1\" ><center><b>Branch</b></center></th>";
			tableGridHTML+="<th  data-field=\"Fild2\"><center><b>"+titleRentType+"</center></th>";
		tableGridHTML+="</tr>";
	tableGridHTML+="</thead>";
	tableGridHTML+="<tbody>";
		tableGridHTML+="<tr>";
			tableGridHTML+="<td></td>";
			tableGridHTML+="<td></td>";
		tableGridHTML+="</tr>";
	tableGridHTML+="</tbody>";
	tableGridHTML+="</table>";
	
	//alert("dddddddddddddddddddd"+tableGridHTML);
	
	$("#"+paramGridName+"Content").html(tableGridHTML);
	var $height=0;
	if(("gridRegionProvinceRentSqM"==paramGridName) || ("gridRegionProvinceNetSalesSqM"==paramGridName) || ("gridRegionProvinceRentNetSales" == paramGridName)){
		$height=430;
	}else{
		$height=190;
	}
	$("#"+paramGridName).kendoGrid({
		
		  height:$height,
          columns: $titleJ,//[{"filed":"Filed1",width:100},{"filed":"Filed2","width":200}]
          dataSource: {
          data: objDataGrid,//[{"Filed1":"content1"},{"Filed2":"content2"}]
			// pageSize: 3,
			
          }
   	});
	};
	var gridTopBottom2 = function(objDataGrid,paramLocationTypeName){
		
		$("#"+paramLocationTypeName).kendoGrid({
			  height:260,
	          columns: $titleJ,//[{"filed":"Filed1",width:100},{"filed":"Filed2","width":200}]
	          dataSource: {
	          data: objDataGrid,//[{"Filed1":"content1"},{"Filed2":"content2"}]
				// pageSize: 3,
				
	          }
	          
	   	});
		};
	
	gridTopBottom();
	// ################ Genarate GRID #################1 //
	
	
	
var $titleJ2 =[
              {
                  field: "Field1",
				   width: 100
              },
              {
                  field: "Field2",
				  width: 60
			 },
             {
                 field: "Field3",
				  width: 60
			 },
             {
                 field: "Field4",
				  width: 60
			 },
             {
                 field: "Field5",
				  width: 60
			 },
             {
                 field: "Field6",
				  width: 60
			 },
             {
                 field: "Field7",
                 width: 60
			 }];

	var $dataJ2 =[
                  {
                	  Field1: "ปตท.รามอินทรา",
                	  Field2: "31/12/20122",
                	  Field3: "<div class='text_number'>200,000</div>",
                	  Field4: "<div class='text_number'>53.5</div>",
                	  Field5: "<div class='text_number'>3,738.32</div>",
                	  Field6: "<center><span class='inlinesparkline'>1,4,4,7,5,9,10</span></center>",
                	  Field7: "<center><span class='inlinesparkline'>1,4,4,7,5,9,10</span></center>",
                  },
                  {
                	  Field1: "&nbsp;",
                	  Field2: "",
                	  Field3: "",
                	  Field4: "",
                	  Field5: "",
                	  Field6: "",
                	  Field7: "",
                	
				  },
                  {
					   Field1: "&nbsp;",
					   Field2: "",
	                   Field3: "",
	                   Field4: "",
	                   Field5: "",
	                   Field6: "",
	                   Field7: "",
                	
				  },
                  {
					  Field1: "&nbsp;",
					  Field2: "",
                	  Field3: "",
                	  Field4: "",
                	  Field5: "",
                	  Field6: "",
                	  Field7: "",
                	
				  },
                  {
					  Field1: "&nbsp;",
					  Field2: "",
                	  Field3: "",
                	  Field4: "",
                	  Field5: "",
                	  Field6: "",
                	  Field7: "",
                	
				  }
				  
				  ]; 	
	// ################ Genarate GRID #################2 //
	var Expring = function(dataExpring){
	$(".grid2").kendoGrid({

          columns: $titleJ2,//[{"filed":"Filed1",width:100},{"filed":"Filed2","width":200}]
          dataSource: {
          data: dataExpring,//[{"Filed1":"content1"},{"Filed2":"content2"}]
		  // pageSize: 3,
			
          }
          /*,
          pageable: {
              refresh: true,
              pageSizes: true
          },
          */
   	});
	$(".sparkLine").sparkline('html',{
	    type: 'line',
	    width: '80',
	    height: '20'}); 
	
	
	/*
	$("#sparkline").sparkline([5,6,7,9,9,5,3,2,2,4,6,7], {
	    type: 'line'});
	*/
	
	$(".textR").addClass("textR");
	};
	// ################ Genarate GRID #################2 //
	
</script>


<div id="dashboard2Box">
	<div class="dashboard2Box">
		<div class="box">
			<div class="title">
				<div class="title_r">Location Type</div>
				<div class="br"></div>
			</div>
			<div class="boxEvent" id="boxlocationType">
				<!--  Here Data-->
				<!-- 
			<ul>
				<li>
					<a href="#" class="locationType" id="locationTypeId1">
					ห้างสรรพสินค้า
					</a>
				</li>
				<li>
					<a href="#" class="locationType" id="locationTypeId2">
					โรงพยาบาล
					</a>
				</li>
				<li>
					<a href="#" class="locationType" id="locationTypeId3">
					ปั้มน้ำมัน
					</a>
					
				</li>
				<li>
					<a href="#" class="locationType" id="locationTypeId4">
					modern trade
					</a>
				</li>
				<li>
					<a href="#" class="locationType" id="locationTypeId5">
					stand alone
					</a>
				</li>
				<li>
					<a href="#" class="locationType" id="locationTypeId6">
					community mall
					</a>
				</li>
			</ul>	-->
			</div>

		</div>
		<div class="box">
			<div class="title">
				<div class="title_r">Rent/SqM</div>
				<div class="title_l">
					<input type="radio" name="radioLocationTypeRentSqM"
						class="radioLocationTypeRentSqM" checked="checked" value="top">Top
					&nbsp; <input type="radio" name="radioLocationTypeRentSqM"
						class="radioLocationTypeRentSqM" value="bottom">Bottom 10
				</div>
				<div class="br"></div>
			</div>
			<div class="content" id="gridRentSqMContent">
				<table id="gridRentSqM">
					<thead>
						<tr>

							<th data-field="Field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="Fild2"><center>
									<b>Rent/SqM
								</center></th>


						</tr>
					</thead>
					<tbody>
						<tr>

							<td></td>
							<td></td>


						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="box">
			<div class="title">
				<div class="title_r">Net Sales/SqM</div>
				<div class="title_l">
					<input type="radio" name="radioLocationTypeNetSalesSqM"
						class="radioLocationTypeNetSalesSqM" value="top" checked="checked">Top
					&nbsp; <input type="radio" name="radioLocationTypeNetSalesSqM"
						class="radioLocationTypeNetSalesSqM" value="bottom">Bottom
					10
				</div>
				<div class="br"></div>
			</div>
			<div class="content" id="gridNetSalesSqMContent">
				<table class="grid" id="gridNetSalesSqM">
					<thead>
						<tr>

							<th data-field="Field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="Fild2"><center>
									<b>Net Sales/SqM
								</center></th>


						</tr>
					</thead>
					<tbody>
						<tr>

							<td></td>
							<td></td>


						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="box">
			<div class="title">
				<div class="title_r">Rent/Net Sales</div>
				<div class="title_l">
					<input type="radio" name="radioLocationTypeRentNetSales"
						class="radioLocationTypeRentNetSales" value="top"
						checked="checked">Top &nbsp; <input type="radio"
						name="radioLocationTypeRentNetSales"
						class="radioLocationTypeRentNetSales" value="bottom">Bottom
					10
				</div>
				<div class="br"></div>
			</div>
			<div class="content" id="gridRentNetSalesContent">
				<table class="grid" id="gridRentNetSales">
					<thead>
						<tr>

							<th data-field="Field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="Fild2"><center>
									<b>Rent/Net Sales
								</center></th>


						</tr>
					</thead>
					<tbody>
						<tr>

							<td></td>
							<td></td>


						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="br"></div>
	</div>


	<div class="dashboard2Box">
		<div class="box">
			<div class="title">
				<div class="title_r">Landlord Group</div>
				<div class="br"></div>
			</div>
			<div class="boxEvent" id="boxLandlordGroup">


				<!--  Here Data-->


			</div>

		</div>
		<div class="box">
			<div class="title">
				<div class="title_r">Rent/SqM</div>
				<div class="title_l">
					<input type="radio" name="radioLandlordGroupRentSqM"
						class="radioLandlordGroupRentSqM" value="top" checked="checked">Top
					&nbsp; <input type="radio" name="radioLandlordGroupRentSqM"
						class="radioLandlordGroupRentSqM" value="bottom">Bottom 10
				</div>
				<div class="br"></div>
			</div>
			<div class="content" id="gridLandlordGroupRentSqMContent">
				<table class="grid" id="gridLandlordGroupRentSqM">
					<thead>
						<tr>

							<th data-field="Field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="Fild2"><center>
									<b>Rent/SqM
								</center></th>


						</tr>
					</thead>
					<tbody>
						<tr>

							<td></td>
							<td></td>


						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="box">
			<div class="title">
				<div class="title_r">Net Sales/SqM</div>
				<div class="title_l">
					<input type="radio" name="radioLandlordGroupNetSalesSqM"
						class="radioLandlordGroupNetSalesSqM" value="top"
						checked="checked">Top &nbsp; <input type="radio"
						name="radioLandlordGroupNetSalesSqM"
						class="radioLandlordGroupNetSalesSqM" value="bottom">Bottom
					10
				</div>
				<div class="br"></div>
			</div>
			<div class="content" id="gridLandlordGroupNetSalesSqMContent">
				<table class="grid" id="gridLandlordGroupNetSalesSqM">
					<thead>
						<tr>

							<th data-field="Field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="Fild2"><center>
									<b>Net Sales/SqM
								</center></th>


						</tr>
					</thead>
					<tbody>
						<tr>

							<td></td>
							<td></td>


						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="box">
			<div class="title">
				<div class="title_r">Rent/Net Sales</div>
				<div class="title_l">
					<input type="radio" name="radioLandlordGroupRentNetSales"
						class="radioLandlordGroupRentNetSales" value="top"
						checked="checked">Top &nbsp; <input type="radio"
						name="radioLandlordGroupRentNetSales"
						class="radioLandlordGroupRentNetSales" value="bottom">Bottom
					10
				</div>
				<div class="br"></div>
			</div>
			<div class="content" id="gridLandlordGroupRentNetSalesContent">
				<table class="grid" id="gridLandlordGroupRentNetSales">
					<thead>
						<tr>

							<th data-field="Field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="Fild2"><center>
									<b>Rent/Net Sales
								</center></th>


						</tr>
					</thead>
					<tbody>
						<tr>

							<td></td>
							<td></td>


						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="br"></div>
	</div>


	<div class="dashboard2Box">
		<div class="box">
			<div class="title">
				<div class="title_r">Brand</div>
				<div class="br"></div>
			</div>
			<div class="boxEvent" id="boxBrand">

				<!--  Here Data-->

			</div>

		</div>
		<div class="box">
			<div class="title">
				<div class="title_r">Rent/SqM</div>
				<div class="title_l">
					<input type="radio" name="radioBrandRentSqM"
						class="radioBrandRentSqM" value="top" checked="checked">Top
					&nbsp; <input type="radio" name="radioBrandRentSqM"
						class="radioBrandRentSqM" value="bottom">Bottom 10
				</div>
				<div class="br"></div>
			</div>
			<div class="content" id="gridBrandRentSqMContent">
				<table class="grid" id="gridBrandRentSqM">
					<thead>
						<tr>

							<th data-field="Field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="Fild2"><center>
									<b>Rent/SqM
								</center></th>


						</tr>
					</thead>
					<tbody>
						<tr>

							<td></td>
							<td></td>


						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="box">
			<div class="title">
				<div class="title_r">Net Sales/SqM</div>
				<div class="title_l">
					<input type="radio" name="radioBrandNetSalesSqM"
						class="radioBrandNetSalesSqM" value="top" checked="checked">Top
					&nbsp; <input type="radio" name="radioBrandNetSalesSqM"
						class="radioBrandNetSalesSqM" value="bottom">Bottom 10
				</div>
				<div class="br"></div>
			</div>
			<div class="content" id="gridBrandNetSalesSqMContent">
				<table class="grid" id="gridBrandNetSalesSqM">
					<thead>
						<tr>

							<th data-field="Field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="Fild2"><center>
									<b>Net Sales/SqM
								</center></th>


						</tr>
					</thead>
					<tbody>
						<tr>

							<td></td>
							<td></td>


						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="box">
			<div class="title">
				<div class="title_r">Rent/Net Sales</div>
				<div class="title_l">
					<input type="radio" name="radioBrandRentNetSales"
						class="radioBrandRentNetSales" value="top" checked="checked">Top
					&nbsp; <input type="radio" name="radioBrandRentNetSales"
						class="radioBrandRentNetSales" value="bottom">Bottom 10
				</div>
				<div class="br"></div>
			</div>
			<div class="content" id="gridBrandRentNetSalesContent">
				<table class="grid" id="gridBrandRentNetSales">
					<thead>
						<tr>

							<th data-field="Field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="Fild2"><center>
									<b>Rent/Net Sales
								</center></th>


						</tr>
					</thead>
					<tbody>
						<tr>

							<td></td>
							<td></td>


						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="br"></div>
	</div>


	<div class="dashboard2Box">


		<div id="boxLeft">
			<!-- box left start-->

			<div class="box">
				<div class="title">
					<div class="title_r">Region</div>
					<div class="br"></div>
				</div>
				<div class="boxEvent" id="boxRegion">
					<!--  Here Data-->

				</div>

			</div>
			<div class="box">
				<div class="title">
					<div class="title_r">Provice</div>
					<div class="br"></div>
				</div>
				<div class="boxEvent" id="boxProvince">
					<!--  Here Data-->

				</div>

			</div>
		</div>
		<!-- box left end -->


		<div id="boxRight">
			<!-- box right start-->
			<div class="box" id="gridHeighter">
				<div class="title">
					<div class="title_r">Rent/SqM</div>
					<div class="title_l">
						<input type="radio" name="radioRegionProvinceRentSqM"
							class="radioRegionProvinceRentSqM" value="top" checked="checked">Top
						&nbsp; <input type="radio" name="radioRegionProvinceRentSqM"
							class="radioRegionProvinceRentSqM" value="bottom">Bottom
						10
					</div>
					<div class="br"></div>
				</div>
				<div class="content" id="gridRegionProvinceRentSqMContent">
					<table class="grid" id="gridRegionProvinceRentSqM">
						<thead>
							<tr>

								<th data-field="Field1"><center>
										<b>Branch</b>
									</center></th>
								<th data-field="Fild2"><center>
										<b>Rent/SqM
									</center></th>


							</tr>
						</thead>
						<tbody>
							<tr>

								<td></td>
								<td></td>


							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="box" id="gridHeighter">
				<div class="title">
					<div class="title_r">Net Sales/SqM</div>
					<div class="title_l">
						<input type="radio" name="radioRegionProvinceNetSalesSqM"
							class="radioRegionProvinceNetSalesSqM" value="top"
							checked="checked">Top &nbsp; <input type="radio"
							name="radioRegionProvinceNetSalesSqM"
							class="radioRegionProvinceNetSalesSqM" value="bottom">Bottom
						10
					</div>
					<div class="br"></div>
				</div>
				<div class="content" id="gridRegionProvinceNetSalesSqMContent">
					<table class="grid" id="gridRegionProvinceNetSalesSqM">
						<thead>
							<tr>

								<th data-field="Field1"><center>
										<b>Branch</b>
									</center></th>
								<th data-field="Fild2"><center>
										<b>Net Sales/SqM
									</center></th>


							</tr>
						</thead>
						<tbody>
							<tr>

								<td></td>
								<td></td>


							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="box" id="gridHeighter">
				<div class="title">
					<div class="title_r">Rent/Net Sales</div>
					<div class="title_l">
						<input type="radio" name="radioRegionProvinceRentNetSales"
							class="radioRegionProvinceRentNetSales" value="top"
							checked="checked">Top &nbsp; <input type="radio"
							name="radioRegionProvinceRentNetSales"
							class="radioRegionProvinceRentNetSales" value="bottom">Bottom
						10
					</div>
					<div class="br"></div>
				</div>
				<div class="content" id="gridRegionProvinceRentNetSalesContent">
					<table class="grid" id="gridRegionProvinceRentNetSales">
						<thead>
							<tr>

								<th data-field="Field1"><center>
										<b>Branch</b>
									</center></th>
								<th data-field="Fild2"><center>
										<b>Rent/Net Sales
									</center></th>


							</tr>
						</thead>
						<tbody>
							<tr>

								<td></td>
								<td></td>


							</tr>
						</tbody>
					</table>
				</div>
			</div>


		</div>
		<!-- box right end -->



		<div class="br"></div>
	</div>

	<div class="dashboard2Box">
		<div class="box">
			<div class="title">
				<div class="title_r">Area</div>
				<div class="br"></div>
			</div>
			<div class="boxEvent" id="boxArea">

				<!--  Here Data-->

			</div>

		</div>
		<div class="box">
			<div class="title">
				<div class="title_r">Rent/SqM</div>
				<div class="title_l">
					<input type="radio" name="radioAreaRentSqM"
						class="radioAreaRentSqM" value="top" checked="checked">Top
					&nbsp; <input type="radio" name="radioAreaRentSqM"
						class="radioAreaRentSqM" value="bottom">Bottom 10
				</div>
				<div class="br"></div>
			</div>
			<div class="content" id="gridAreaRentSqMContent">
				<table class="grid" id="gridAreaRentSqM">
					<thead>
						<tr>

							<th data-field="Field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="Fild2"><center>
									<b>Rent/SqM
								</center></th>


						</tr>
					</thead>
					<tbody>
						<tr>

							<td></td>
							<td></td>


						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="box">
			<div class="title">
				<div class="title_r">Net Sales/SqM</div>
				<div class="title_l">
					<input type="radio" name="radioAreaNetSalesSqM"
						class="radioAreaNetSalesSqM" value="top" checked="checked">Top
					&nbsp; <input type="radio" name="radioAreaNetSalesSqM"
						class="radioAreaNetSalesSqM" value="bottom">Bottom 10
				</div>
				<div class="br"></div>
			</div>
			<div class="content" id="gridAreaNetSalesSqMContent">
				<table class="grid" id="gridAreaNetSalesSqM">
					<thead>
						<tr>

							<th data-field="Field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="Fild2"><center>
									<b>Net Sales/SqM
								</center></th>


						</tr>
					</thead>
					<tbody>
						<tr>

							<td></td>
							<td></td>


						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="box">
			<div class="title">
				<div class="title_r">Rent/Net Sales</div>
				<div class="title_l">
					<input type="radio" name="radioAreaRentNetSales"
						class="radioAreaRentNetSales" value="top" checked="checked">Top
					&nbsp; <input type="radio" name="radioAreaRentNetSales"
						class="radioAreaRentNetSales" value="bottom">Bottom 10
				</div>
				<div class="br"></div>
			</div>
			<div class="content" id="gridAreaRentNetSalesContent">
				<table class="grid" id="gridAreaRentNetSales">
					<thead>
						<tr>

							<th data-field="Field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="Fild2"><center>
									<b>Rent/Net Sales
								</center></th>


						</tr>
					</thead>
					<tbody>
						<tr>

							<td></td>
							<td></td>


						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="br"></div>
	</div>

	<div class="dashboard2Box">
		<div class="box">
			<div class="title">
				<div class="title_r">Format</div>
				<div class="br"></div>
			</div>
			<div class="boxEvent" id="boxFormat">

				<!--  Here Data-->

			</div>

		</div>
		<div class="box">
			<div class="title">
				<div class="title_r">Rent/SqM</div>
				<div class="title_l">
					<input type="radio" name="radioFormatRentSqM"
						class="radioFormatRentSqM" value="top" checked="checked">Top
					&nbsp; <input type="radio" name="radioFormatRentSqM"
						class="radioFormatRentSqM" value="bottom">Bottom 10
				</div>
				<div class="br"></div>
			</div>
			<div class="content" id="gridFormatRentSqMContent">
				<table class="grid" id="gridFormatRentSqM">
					<thead>
						<tr>

							<th data-field="Field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="Fild2"><center>
									<b>Rent/SqM
								</center></th>


						</tr>
					</thead>
					<tbody>
						<tr>

							<td></td>
							<td></td>


						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="box">
			<div class="title">
				<div class="title_r">Net Sales/SqM</div>
				<div class="title_l">
					<input type="radio" name="radioFormatSalesSqM"
						class="radioFormatSalesSqM" value="top" checked="checked">Top
					&nbsp; <input type="radio" name="radioFormatSalesSqM"
						class="radioFormatSalesSqM" value="bottom">Bottom 10
				</div>
				<div class="br"></div>
			</div>
			<div class="content" id="gridFormatSalesSqMContent">
				<table class="grid" id="gridFormatSalesSqM">
					<thead>
						<tr>

							<th data-field="Field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="Fild2"><center>
									<b>Net Sales/SqM
								</center></th>


						</tr>
					</thead>
					<tbody>
						<tr>

							<td></td>
							<td></td>


						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="box">
			<div class="title">
				<div class="title_r">Rent/Net Sales</div>
				<div class="title_l">
					<input type="radio" name="radioFormatRentNetSales"
						class="radioFormatRentNetSales" value="top" checked="checked">Top
					&nbsp; <input type="radio" name="radioFormatRentNetSales"
						class="radioFormatRentNetSales" value="bottom">Bottom 10
				</div>
				<div class="br"></div>
			</div>
			<div class="content" id="gridFormatRentNetSalesContent">
				<table class="grid" id="gridFormatRentNetSales">
					<thead>
						<tr>

							<th data-field="Field1"><center>
									<b>Branch</b>
								</center></th>
							<th data-field="Fild2"><center>
									<b>Rent/Net Sales
								</center></th>


						</tr>
					</thead>
					<tbody>
						<tr>

							<td></td>
							<td></td>


						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="br"></div>
	</div>

	<!--  End Content -->

	<div class="title_r">
		<b>Expiring Contract This Year</b>
	</div>
	<div class="content">
		<table class="grid2">
			<thead>
				<tr>

					<th data-field="Field1"><center>
							<b>Branch</b>
						</center></th>
					<th data-field="Fild2"><center>
							<b>Contract End Date
						</center></th>
					<th data-field="Field3"><center>
							<b>Rent</b>
						</center></th>
					<th data-field="Fild4"><center>
							<b>SqM
						</center></th>
					<th data-field="Field5"><center>
							<b>Rent/Sqm</b>
						</center></th>
					<th data-field="Fild6"><center>
							<b>Net Sales/SqM
						</center></th>
					<th data-field="Field7"><center>
							<b>Rent/Net Sales</b>
						</center></th>



				</tr>
			</thead>
			<tbody>
				<tr>

					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>



				</tr>
			</tbody>
		</table>
	</div>
</div>