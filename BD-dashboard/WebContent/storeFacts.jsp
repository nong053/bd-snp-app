<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="connectionPackage.*"%>
<!--
<link href="styles/dashboardStoreFactsService.css" rel="stylesheet">
-->
<script>
$(document).ready(function(){
	/*
	sesParamBrand
	sesParamCountry
	sesParamRegion
	sesParamProvince
	sesParamArea
	*/
	$.ajax({
		url:'Model/storeFactsService.jsp',
		type:'post',
		dataType:'html',
		data:{'paramRequest':'optionBrach','paramBrand':$("#sesParamBrand").val(),'paramCountry':$("#sesParamCountry").val(),'paramRegion':$("#sesParamRegion").val(),'paramProvince':$("#sesParamProvince").val(),'paramArea':$("#sesParamArea").val()},
		success:function(data){
			//alert(data);
			
			$("#BranchArea").html(data);
			$("#branch").kendoDropDownList();
			setTimeout(function(){
				$("#branch").trigger("change");
			},200);
		
			
		}
	});
});
    var $titleJ =[
                  {
                      field: "filed1",
    				   //width: 60
                  },
                  {
                      field: "filed2",
    				  //width: 60
    			 },
                  {
                      field: "filed3",
    				  //width: 60
    			 },
                  {
                      field: "filed4",
    				  //width:60
    			 },
                 {
                     field: "filed5",
   				  //width:60
	   			 },
	             {
	                 field: "filed6",
					  //width:60
				 },
	             {
	                 field: "filed7",
					  //width:60
				 },
	             {
	                 field: "filed8",
					  //width:60
				 },
	             {
	                 field: "filed9",
					  //width:60
				 },
	             {
	                 field: "filed10",
					  //width:60
				 },
	             {
	                 field: "filed11",
					  //width:60
				 },
	             {
	                 field: "filed12",
					  //width:60
				 }];







    	//CONTENT BY JSON START 
    	//นำค่าที่ได้มาจากการ query แล้วจัดการให้อยู่ในรูปแบบ json ที่ได้จากด้านบนมาเก็บไว้ในตัวแปร $dataJ
    /*
    KPI
    UOM
    Weight
    Target
    Actual
    Achieve
    Your
    */
    	var $dataJ =[
                      {
                    	  filed1: "&nbsp;",
                    	  filed2: "",
                    	  filed3: "  ",
                    	  filed4: "",
                    	  filed5: "",
                    	  filed6: "",
                    	  filed7: "",
                    	  filed8: "",
                    	  filed9: "",
                    	  filed10: "",
                    	  filed11: "",
                    	  filed12: ""
                        
                      },{
                    	  filed1: "&nbsp;",
                    	  filed2: "",
                    	  filed3: "  ",
                    	  filed4: "",
                    	  filed5: "",
                    	  filed6: "",
                    	  filed7: "",
                    	  filed8: "",
                    	  filed9: "",
                    	  filed10: "",
                    	  filed11: "",
                    	  filed12: ""
                        
                      }
    				  
    				  ]; 	
    	// ################ Genarate GRID ################# //
    	var createTableGrid =function(){
    		var tableHTML="";
    		
    		tableHTML+="<table class=\"grid\">";
    			tableHTML+="<thead>";
    				tableHTML+="<tr>";
							  
    					tableHTML+="<th data-field=\"filed1\" ><center><b>Start<br>Date</b></center></th>";
    					tableHTML+="<th data-field=\"filed2\"><center><b>End<br>Date</center></th>";
    					tableHTML+="<th data-field=\"filed3\"><center><b>Period</b></center></th>";
    					tableHTML+="<th data-field=\"filed4\"><center><b>Area<br>(SqM)</b></center></th>";
    					tableHTML+="<th data-field=\"filed5\"><center><b>Rent<br>Deposit<br>Amount</b></center></th>";
    					tableHTML+="<th data-field=\"filed6\"><center><b>Service<br>Deposit<br>Amount</b></center></th>";
    					tableHTML+="<th data-field=\"filed7\"><center><b>Rent <br>Amount</b></center></th>";
    					tableHTML+="<th data-field=\"filed8\"><center><b>Service <br>Amount</b></center></th>";
    					tableHTML+="<th data-field=\"filed9\"><center><b>Water <br>Cost <br>PerUnit</b></center></th>";
    					tableHTML+="<th data-field=\"filed10\"><center><b>GasCost<br>PerUnit</b></center></th>";
    					tableHTML+="<th data-field=\"filed11\"><center><b>Electricity<br>Cost<br>PerUnit</b></center></th>";
    					tableHTML+="<th data-field=\"filed12\"><center><b>Property<br>Tax<br>Amount</b></center></th>";

    				tableHTML+="</tr>";
    			tableHTML+="</thead>";
    			tableHTML+="<tbody>";
    				tableHTML+="<tr>";
					        
    					tableHTML+="<td></td>";
    					tableHTML+="<td></td>";
    					tableHTML+="<td></td>";
    					tableHTML+="<td></td>";
    					tableHTML+="<td></td>";
    					tableHTML+="<td></td>";
    					tableHTML+="<td></td>";
    					tableHTML+="<td></td>";
    					tableHTML+="<td></td>";
    					tableHTML+="<td></td>";
    					tableHTML+="<td></td>";
    					tableHTML+="<td></td>";

    				tableHTML+="</tr>";	
    			tableHTML+="</tbody>";
    			tableHTML+="</table>";
    			$("#contentGrid").html(tableHTML);
    	}
    	var createGrid=function(gridData){
    	$(".grid").remove();
    	createTableGrid();
    	
    	$(".grid").kendoGrid({
    		   //ไม่กำหนดความสูง height จะเป็น auto
              //height: 500,
    		  detailInit: detailInit,
    		  dataBound: function() {
                  this.expandRow(this.tbody.find("tr.k-master-row").first());
              },
              columns: $titleJ,//[{"filed":"Filed1",width:100},{"filed":"Filed2","width":200}]
              dataSource: {
              data: gridData,//[{"Filed1":"content1"},{"Filed2":"content2"}]
    			// pageSize: 3,
    			
              }
       	});

    	 function detailInit(e) {
    		 $(".k-detail-row").remove();
    		 //console.log(e.data.filed0);
    		 $.ajax({
    			 url:'Model/storeFactsService.jsp',
    			 type:'post',
    			 dataType:'json',
    			 data:{'paramRequest':'General','paramBranchCode':e.data.filed0},
    			 success:function(data){
    				 
    				 
    				 $(".generalContent#generalAdress").html(data[0]);
    				 $(".generalContent#generalTel").html(data[1]);
    				 $(".generalContent#generalFax").html(data[2]);
    				 $(".generalContent#generalMob").html(data[3]);
    				 $(".generalContent#generalOpenDate").html(data[4]);
    				 $(".generalContent#generalRenType").html(data[5]);
    				 $(".generalContent#generalLocationType").html(data[6]);
    				 $(".generalContent#generalLandlordGroup").html(data[7]);
    				 $(".generalContent#generalBrand").html(data[8]);
    				 $(".generalContent#generalFormat").html(data[9]);
    				 $(".generalContent#generalTable").html(data[10]);
    				 $(".generalContent#generalTotalSeat").html(data[11]);
    				 $(".generalContent#generalTotalRevenueSeat").html(data[12]);
    				 /*
    				 generalTel,generalFax,generalMob,generalOpenDate,
    				 generalRenType,generalLocationType,generalLandlordGroup,generalBrand,
    				 generalFormat,generalTable,generalTotalSeat,generalTotalRevenueSeat,
    				 */
    			 }
    		 });
    		 
    		 
    		 
    		 
    		 //StoreFactsFeasibilityData Start
    		 //alert(e.data.paramBranchKey);
    		 $.ajax({
    			 url:'Model/storeFactsService.jsp',
    			 type:'post',
    			 dataType:'json',
    			 data:{'paramRequest':'StoreFactsFeasibilityData','paramBranchKey':e.data.paramBranchKey},
    			 success:function(data){
    				 //alert(data);
    				 var feasibilityHtml="";
    				 //feasibilityData
    				 $.each(data,function(index,EntryIndex){
    					 feasibilityHtml+="<tr>";
    					 	feasibilityHtml+="<td>";
    					 	
    					 		feasibilityHtml+="<div class='textR'>"+EntryIndex[0]+"</div>";
    					 	
    					 	feasibilityHtml+="</td>";
    					 	
    					 	feasibilityHtml+="<td>";
    					 	
    					 		feasibilityHtml+="<div class='textR'>"+addCommas(EntryIndex[1])+"</div>";
    					 		
    					 	feasibilityHtml+="</td>";
    					 	
    					 	feasibilityHtml+="<td>";
    					 	
    					 		feasibilityHtml+="<div class='textR'>"+addCommas(EntryIndex[2])+"</div>";
    					 		
    					 	feasibilityHtml+="</td>";
    					 	
    					 	feasibilityHtml+="<td>";
    					 	
    					 		feasibilityHtml+="<div class='textR'>"+addCommas(EntryIndex[3])+"</div>";
    					 		
    					 	feasibilityHtml+="</td>";
    					 feasibilityHtml+="</tr>";
    				 });
    				 
    				 $("table#feasibilityData tbody").html(feasibilityHtml);
    				 $(".textR").addClass("textR");
    			 }
    		 });
    		 //StoreFactsFeasibilityData End 
    	 }
		
    	 //Set number or string text
    	 $(".textR").addClass("textR");
    	
    	};
    	// ################ Genarate GRID ################# //
    	
    	$(document).ready(function(){
    		//alert("hello jquery");
//load css by ajax
$.ajax({
            url:"styles/dashboardStoreFactsService.css",
            dataType:"html",
            success:function(data){
				$("style.loadCss").remove();
                $("head").append("<style class='loadCss'>" + data + "</style>");
                //loading complete code here
            }
        });
//-----------------------


    		$("#branch").live("change",function(){
    			//alert($(this).val());
    			$.ajax({
    				url:'Model/storeFactsService.jsp',
    				type:'post',
    				dataType:'json',
    				data:{'paramRequest':'StoreFactsContract','paramBranchCode':$(this).val()},
    				success:function(data){
    					//alert(data);
    					var gridData="";
    					gridData+="[";
    					var i=0;
    					$.each(data,function(index,EntryIndex){
    						/*
    						console.log("0"+EntryIndex[0]);
    						console.log("1"+EntryIndex[1]);
    						console.log("2"+EntryIndex[2]);
    						console.log("3"+EntryIndex[3]);
    						console.log("4"+EntryIndex[4]);
    						console.log("5"+EntryIndex[5]);
    						console.log("6"+EntryIndex[6]);
    						console.log("7"+EntryIndex[7]);
    						console.log("8"+EntryIndex[8]);
    						console.log("9"+EntryIndex[9]);
    						console.log("10"+EntryIndex[10]);
    						console.log("11"+EntryIndex[11]);
    						console.log("12"+EntryIndex[12]);
    						*/
    						if(i==0){
    							gridData+="{";
    						}else{
    							gridData+=",{";
    						}
    							//gridData+="filed0:\"<div class='values' id='id"+EntryIndex[0]+"'>"+EntryIndex[0]+"\",";
    							
    							
    							gridData+="filed0:\""+EntryIndex[0]+"\",";
    							gridData+="filed1:\""+EntryIndex[1]+"\",";
    							gridData+="filed2:\""+EntryIndex[2]+"\",";
    							gridData+="filed3:\""+EntryIndex[3]+"\",";
    							gridData+="filed4:\"<div class='textR'>"+addCommas(EntryIndex[4])+"</div>\",";
    							gridData+="filed5:\"<div class='textR'>"+addCommas(EntryIndex[5])+"</div>\",";
    							gridData+="filed6:\"<div class='textR'>"+addCommas(EntryIndex[6])+"</div>\",";
    							gridData+="filed7:\"<div class='textR'>"+addCommas(EntryIndex[7])+"</div>\",";
    							gridData+="filed8:\"<div class='textR'>"+addCommas(EntryIndex[8])+"</div>\",";
    							gridData+="filed9:\"<div class='textR'>"+addCommas(EntryIndex[9])+"</div>\",";
    							gridData+="filed10:\"<div class='textR'>"+addCommas(EntryIndex[10])+"</div>\",";
    							gridData+="filed11:\"<div class='textR'>"+addCommas(EntryIndex[11])+"</div>\",";
    							gridData+="filed12:\"<div class='textR'>"+addCommas(EntryIndex[12])+"</div>\",";
    							
    							gridData+="paramBranchKey:\""+EntryIndex[13]+"\"";
    						//Format
    						/*
    						[
		                      {
		                    	  filed1: "&nbsp;",
		                    	  filed2: "",
		                    	  filed3: "",
		                    	  filed4: "",
		                    	  filed5: "",
		                    	  filed6: "",
		                    	  filed7: "",
		                    	  filed8: "",
		                    	  filed9: "",
		                    	  filed10: "",
		                    	  filed11: "",
		                    	  filed12: ""
		                        
		                      }
		                     ]
                      		*/
                      		gridData+="}";
    						i++;
    					});//loop
    					
    					gridData+="]";
    					
    					var objGridData = eval("("+gridData+")");
    					
    					createGrid(objGridData);
    					
    					
    				}
    			});
    		});
    		
    		
    		
    		
    		//Design Table
    		$("table#feasibilityData thead tr").css({"background":"#E3E3E3"});
    		//$("table#feasibilityData tbody tr").css({"background":"#cccccc"});
    		$("table#feasibilityData").css({"background":"#ffffff","border":"0px solid white"});
    	});
    </script>




<div id="dashboard4Box">
	<div class="mainRow">
		<div class="box">
			<div class="title">
				<b>Branch</b>
				<!--  
				<select>
					<option>ปตท.รามอินทรา</option>
					<option>Branch02</option>
					<option>Branch03</option>
					<option>Branch04</option>
				</select>
				-->
				
				<div id="BranchArea"><%//optionBranch%></div>
			</div>
			<div class="content">
				<b>Contract</b>
				<div id="contentGrid">
					<table class="grid">
						<thead>
							<tr>

								<th data-field="filed1"><center>
										<b>Start<br>Date
										</b>
									</center></th>
								<th data-field="filed2"><center>
										<b>End<br>Date
									</center></th>
								<th data-field="filed3"><center>
										<b>Period</b>
									</center></th>
								<th data-field="filed4"><center>
										<b>Area<br>(SqM)
										</b>
									</center></th>
								<th data-field="filed5"><center>
										<b>Rent<br>Deposit<br>Amount
										</b>
									</center></th>
								<th data-field="filed6"><center>
										<b>Service<br>Deposit<br>Amount
										</b>
									</center></th>
								<th data-field="filed7"><center>
										<b>Rent <br>Amount
										</b>
									</center></th>
								<th data-field="filed8"><center>
										<b>Service <br>Amount
										</b>
									</center></th>
								<th data-field="filed9"><center>
										<b>Water <br>Cost <br>PerUnit
										</b>
									</center></th>
								<th data-field="filed10"><center>
										<b>GasCost<br>PerUnit
										</b>
									</center></th>
								<th data-field="filed11"><center>
										<b>Electricity<br>Cost<br>PerUnit
										</b>
									</center></th>
								<th data-field="filed12"><center>
										<b>Property<br>Tax<br>Amount
										</b>
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
			<!-- Conntent Grid -->
		</div>
	</div>

	<div class="mainRow">
		<div class="box">
			<div class="title">
				<b>General</b>
			</div>
			<div class="content" style="background:white">
				<table width="100%">

					<tbody>
						<tr>
							<td>
								<div class="textBlue">Address:</div>
							</td>
							<td colspan="5" class="generalContent" id='generalAdress'>
								</td>



						</tr>

						<tr>
							<td>
								<div class="textBlue">Tel No:</div>
							</td>
							<td class="generalContent" id='generalTel'></td>
							<td>
								<div class="textBlue">Fax No:</div>
							</td>
							<td class="generalContent" id='generalFax'></td>
							<td>
								<div class="textBlue">Mob No:</div>
							</td>
							<td class="generalContent" id='generalMob'></td>
						</tr>

						<tr>
							<td>
								<div class="textBlue">Open Date:</div>
							</td>
							<td class="generalContent" id='generalOpenDate'></td>
							<td>
								<div class="textBlue">Rent Type</div>
							</td>
							<td class="generalContent" id='generalRenType'></td>
							<td>
								<div class="textBlue">Location Type:</div>
							</td>
							<td class="generalContent" id='generalLocationType'>
								</td>
						</tr>

						<tr>
							<td>
								<div class="textBlue">Landlord Group:</div>
							</td>
							<td class="generalContent" id='generalLandlordGroup'>
								</td>
							<td>
								<div class="textBlue">Brand:</div>
							</td>
							<td class="generalContent" id='generalBrand'></td>
							<td>
								<div class="textBlue">Format:</div>
							</td>
							<td class="generalContent" id='generalFormat'></td>

						</tr>

						<tr>
							<td>
								<div class="textBlue"># Table:</div>
							</td>
							<td class="generalContent" id='generalTable'></td>
							<td>
								<div class="textBlue">#Total Seat:</div>
							</td>
							<td class="generalContent" id='generalTotalSeat'></td>
							<td>
								<div class="textBlue">#Total Revenue Seat:</div>
							</td>
							<td class="generalContent" id='generalTotalRevenueSeat'></td>

						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- row3 -->
	<div class="mainRow">
		<div class="box">
			<div class="title">
				<b>Feasibility Data</b>
			</div>
			<div class="content">
				<table width="30%" border="1" id="feasibilityData" cellspacing=0;
					cellpadding=0;>
					<thead>
						<tr>
							<th><center>Year</center></th>
							<th><center>IRR</center></th>
							<th><center>NPV</center></th>
							<th><center>ROI</center></th>
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
	</div>
	<!-- end row3 -->
	<div class="br"></div>
</div>
