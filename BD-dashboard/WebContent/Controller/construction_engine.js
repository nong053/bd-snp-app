//ฟังก์ชันจัดการ Commas
function addCommas(nStr)
{
	nStr += '';
	x = nStr.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1)) {
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2;
}
var $titleJ =[
              {
                  field: "field1",
				   width: 120
              },
              {
                  field: "field2",
				  width: 80
			 },
              {
                  field: "field3",
				  width: 100
			 },
              {
                  field: "field4",
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
                	  field1: "&nbsp;",
                	  field2: "",
                	  field3: "  ",
                	  field4: "",
                    
                  },
                  {
                	  field1: "&nbsp;",
                	  field2: "",
                	  field3: "  ",
                	  field4: "",
                    
                  },{
                	  field1: "&nbsp;",
                	  field2: "",
                	  field3: "  ",
                	  field4: "",
                    
                  },{
                	  field1: "&nbsp;",
                	  field2: "",
                	  field3: "  ",
                	  field4: "",
                    
                  },{
                	  field1: "&nbsp;",
                	  field2: "",
                	  field3: "  ",
                	  field4: "",
                    
                  }
				  
				  ]; 	
	// ################ Genarate GRID ################# //
	var dataGridFunction= function(nameGrid,objDataGrid){
	$(nameGrid).kendoGrid({
		   //ไม่กำหนดความสูง height จะเป็น auto
          height: 265,
		  //detailInit: detailInit,
          columns: $titleJ,//[{"filed":"Filed1",width:100},{"filed":"Filed2","width":200}]
          dataSource: {
          data: objDataGrid,//[{"Filed1":"content1"},{"Filed2":"content2"}]
			// pageSize: 3,
			
          }
   	});
	$(".textR").addClass("textR");
	};
	// ################ Genarate GRID ################# //
	

var pieChart =function(objDataPieChart){
$(".chart").kendoChart({
        theme: $(document).data("kendoSkin") || "blueOpal",
       
        legend: {
            position: "right",
            labels: {
                template: "#= text # (#= value #%)"
            }
        },
        chartArea: {
			width: 350,
			height: 250,
			background: ""
		},
        seriesDefaults: {
            labels: {
                //visible: true,
                //format: "{0}%"
            }
        },
        series: [{
            type: "pie",
            data: objDataPieChart
        }],
        tooltip: {
            visible: true,
            //format: "{0}%"
            template:"#= getDicimalCommas(value)# (#= kendo.format('{0:P}',percentage)#)"
        }
 });
};
 var stackBar = function(paramSeries,paramCategories){
$("#barChart").kendoChart({
    theme: $(document).data("kendoSkin") || "blueOpal",
    chartArea: {
		width: 350,
		height: 250,
		background: ""
	},
    title: {
        text: "เงินลงทุน"
    },
    legend: {
        position: "right"
    },
    seriesDefaults: {
        type: "column",
        stack: true
    },
    series: paramSeries,
    valueAxis: {
        labels: {
            //format: "{0}"
        	template: "#= getDicimalCommas(value) # "
        }
    },
    categoryAxis: {
        categories: paramCategories,
        labels: {
            rotation: -90
        }
    },
    tooltip: {
        visible: true,
        //format: "{0}"
        template: "#= getDicimalCommas(value) # "
    }
});
};//end stack bar

//stackBar();


$(document).ready(function(){
//load css by ajax
$.ajax({
            url:"styles/dashboardConstruction.css",
            dataType:"html",
            success:function(data){
				$("style.loadCss").remove();
                $("head").append("<style class='loadCss'>" + data + "</style>");
                //loading complete code here
            }
        });
//-----------------------
	// investment  start
	$("#investment").change(function(){
		/*
		sesParamYear
		sesParamMonthFrom
		sesParamMonthTo
		sesParamBrand
		sesParamCountry
		sesParamRegion
		sesParamProvince
		sesParamArea
		'BrandName','2012','01','12','ALL','Thailand','ภาคกลาง','กรุงเทพ','ALL'
		
		<option value="BrandName">BrandName</option>
		<option value="FormatName">FormatName</option>
		<option value="LandlordGroup">LandlordGroup</option>
		<option value="LocationType">LocationType</option>
		<option value="RentType">RentType</option>
		*/
		//alert($(this).val());
		$.ajax({
			url:'Model/constructionService.jsp',
			type:'get',
			dataType:'json',
			data:{'paramRequest':$(this).val(),'paramYear':$("#sesParamYear").val(),
				'paramMonthFrom':$("#sesParamMonthFrom").val(),'paramMonthTo':$("#sesParamMonthTo").val(),'paramBrand':$("#sesParamBrand").val(),
				'paramCountry':$("#sesParamCountry").val(),'paramRegion':$("#sesParamRegion").val(),'paramProvince':$("#sesParamProvince").val(),
				'paramArea':$("#sesParamArea").val()
			},
			success:function(data){
				//console.log(data);
				var i=0;
				var categories="";
				var series="";
				categories+="[";
				series+="[";
				
				/*
				[{
		        name: "โครงสร้าง",
		        data: [15.7, 16.7]
			    }, {
			        name: "ระบบ",
			        data: [67.96, 68.93]
			    }]
				 */
				
				$.each(data,function(index,EntryIndex){
				//cate ['สาขา', 'ช็อพ']
					if(i==0){
						series+="{";
						//categories+=EntryIndex[1];
						var splitCate=EntryIndex[1].split(",");
						
						for(var j=0;j<splitCate.length;j++){
							
							if(j==0){
								categories+="";
							}else{
								categories+=",";
							}
							categories+="'"+splitCate[j]+"'";
						}
					}else{
						series+=",{";
						
					}
					series+="name:\""+EntryIndex[0]+"\",";
					series+="data:["+EntryIndex[2]+"]";
					

					i++;
					series+="}";
				});
				
				
				
				series+="]";
				categories+="]";
				
				//console.log(series);
				//console.log(categories);
				
				var objSeries=eval("("+series+")");
				var objCategories=eval("("+categories+")");
				//console.log(objSeries);
				//console.log(objCategories);
				
				stackBar(objSeries,objCategories);
			}
		});
	});
	// investment  end
	$("#investment").trigger("change");
	//InvestmentByConstructionType Start
	$.ajax({
			url:'Model/constructionService.jsp',
			type:'get',
			dataType:'json',
			data:{'paramRequest':'InvestmentByConstructionType','paramYear':$("#sesParamYear").val(),
				'paramMonthFrom':$("#sesParamMonthFrom").val(),'paramMonthTo':$("#sesParamMonthTo").val(),'paramBrand':$("#sesParamBrand").val(),
				'paramCountry':$("#sesParamCountry").val(),'paramRegion':$("#sesParamRegion").val(),'paramProvince':$("#sesParamProvince").val(),
				'paramArea':$("#sesParamArea").val()
			},
			success:function(data){
				
				var i=0;
				var dataPieChart="";
				dataPieChart+="[";
				//alert("data"+data);
				$.each(data,function(index,indexEntry){
					//alert(indexEntry[0]);
					
					if(i==0){
						dataPieChart+="{";
					}else{
						dataPieChart+=",{";
					}
					dataPieChart+="category:"+"\""+indexEntry[0]+"\",";
					dataPieChart+="value:"+""+indexEntry[1]+"";
					dataPieChart+="}";
					i++;
				});
				dataPieChart+="]";
				
				
				var objDataPieChart = eval("("+dataPieChart+")");
				//console.log(objDataPieChart);
				pieChart(objDataPieChart);
			}
		});
	//InvestmentByConstructionType End
	
	//ROITop Start
	$.ajax({
		url:'Model/constructionService.jsp',
		type:'post',
		dataType:'json',
		data:{
			'paramRequest':'ROITop','paramYear':$("#sesParamYear").val(),
			'paramMonthFrom':$("#sesParamMonthFrom").val(),'paramMonthTo':$("#sesParamMonthTo").val(),'paramBrand':$("#sesParamBrand").val(),
			'paramCountry':$("#sesParamCountry").val(),'paramRegion':$("#sesParamRegion").val(),'paramProvince':$("#sesParamProvince").val(),
			'paramArea':$("#sesParamArea").val()
			},
		success:function(data){
			var i=0;
			var dataGrid="";
			dataGrid+="[";
			//alert("data"+data);
			$.each(data,function(index,indexEntry){

				if(i==0){
					dataGrid+="{";
				}else{
					dataGrid+=",{";
				}
				dataGrid+="field1:"+"\"<div class='textL'>"+indexEntry[0]+"</div>\",";
				dataGrid+="field2:"+"\"<div class='textR'>"+addCommas(indexEntry[1])+"</div>\",";
				dataGrid+="field3:"+"\"<div class='textR'>"+addCommas(indexEntry[2])+"</div>\",";
				var rentNetSales= parseFloat(indexEntry[3]).toFixed(2);
				dataGrid+="field4:"+"\"<div class='textR'>"+addCommas(rentNetSales)+"</div>\"";
				dataGrid+="}";
				i++;
			});
			dataGrid+="]";
			
			
			var objDataGrid = eval("("+dataGrid+")");
			//console.log(dataGrid);
			dataGridFunction('#topROIGrid',objDataGrid);
		}
	});
	
	//ROITop End
	
	//ROITop Start
	$.ajax({
		url:'Model/constructionService.jsp',
		type:'post',
		dataType:'json',
		data:{
			'paramRequest':'ROIBottom','paramYear':$("#sesParamYear").val(),
			'paramMonthFrom':$("#sesParamMonthFrom").val(),'paramMonthTo':$("#sesParamMonthTo").val(),'paramBrand':$("#sesParamBrand").val(),
			'paramCountry':$("#sesParamCountry").val(),'paramRegion':$("#sesParamRegion").val(),'paramProvince':$("#sesParamProvince").val(),
			'paramArea':$("#sesParamArea").val()
			},
		success:function(data){
			var i=0;
			var dataGrid="";
			dataGrid+="[";
			//alert("data"+data);
			$.each(data,function(index,indexEntry){

				if(i==0){
					dataGrid+="{";
				}else{
					dataGrid+=",{";
				}
				dataGrid+="field1:"+"\"<div class='textL'>"+indexEntry[0]+"</div>\",";
				dataGrid+="field2:"+"\"<div class='textR'>"+addCommas(indexEntry[1])+"</div>\",";
				dataGrid+="field3:"+"\"<div class='textR'>"+addCommas(indexEntry[2])+"</div>\",";
				var rentNetSales= parseFloat(indexEntry[3]).toFixed(2);
				dataGrid+="field4:"+"\"<div class='textR'>"+addCommas(rentNetSales)+"</div>\"";
				dataGrid+="}";
				i++;
			});
			dataGrid+="]";
			
			
			var objDataGrid = eval("("+dataGrid+")");
			//console.log(dataGrid);
			dataGridFunction('#bottomROIGrid',objDataGrid);
		}
	});
	
	//ROITop End
	
	//InvestmentSqM Start
	$.ajax({
		url:'Model/constructionService.jsp',
		type:'post',
		dataType:'json',
		data:{
			'paramRequest':'InvestmentSqM','paramYear':$("#sesParamYear").val(),
			'paramMonthFrom':$("#sesParamMonthFrom").val(),'paramMonthTo':$("#sesParamMonthTo").val(),'paramBrand':$("#sesParamBrand").val(),
			'paramCountry':$("#sesParamCountry").val(),'paramRegion':$("#sesParamRegion").val(),'paramProvince':$("#sesParamProvince").val(),
			'paramArea':$("#sesParamArea").val()
			},
		success:function(data){
			var i=0;
			var dataGrid="";
			dataGrid+="[";
			//alert("data"+data);
			$.each(data,function(index,indexEntry){

				if(i==0){
					dataGrid+="{";
				}else{
					dataGrid+=",{";
				}
				dataGrid+="field1:"+"\"<div class='textL'>"+indexEntry[0]+"</div>\",";
				dataGrid+="field2:"+"\"<div class='textR'>"+addCommas(indexEntry[1])+"</div>\",";
				dataGrid+="field3:"+"\"<div class='textR'>"+addCommas(indexEntry[2])+"</div>\",";
				var rentNetSales= parseFloat(indexEntry[3]).toFixed(2);
				dataGrid+="field4:"+"\"<div class='textR'>"+addCommas(rentNetSales)+"</div>\"";
				dataGrid+="}";
				i++;
			});
			dataGrid+="]";
			
			
			var objDataGrid = eval("("+dataGrid+")");
			//console.log(dataGrid);
			dataGridFunction('#topInvestmentGrid',objDataGrid);
		}
	});
	
	//InvestmentSqM End
	
	//LandlordGroup Start
	$.ajax({
		url:'Model/constructionService.jsp',
		type:'post',
		dataType:'json',
		data:{
			'paramRequest':'LandlordGroup2','paramYear':$("#sesParamYear").val(),
			'paramMonthFrom':$("#sesParamMonthFrom").val(),'paramMonthTo':$("#sesParamMonthTo").val(),'paramBrand':$("#sesParamBrand").val(),
			'paramCountry':$("#sesParamCountry").val(),'paramRegion':$("#sesParamRegion").val(),'paramProvince':$("#sesParamProvince").val(),
			'paramArea':$("#sesParamArea").val()
			},
		success:function(data){
			//alert(data);
			var i=0;
			var dataGrid="";
			dataGrid+="[";
			//alert("data"+data);
			$.each(data,function(index,indexEntry){

				if(i==0){
					dataGrid+="{";
				}else{
					dataGrid+=",{";
				}
				dataGrid+="field1:"+"\"<div class='textL'>"+indexEntry[0]+"</div>\",";
				dataGrid+="field2:"+"\"<div class='textR'>"+addCommas(indexEntry[1])+"</div>\",";
				dataGrid+="field3:"+"\"<div class='textR'>"+addCommas(indexEntry[2])+"</div>\",";
				var rentNetSales= parseFloat(indexEntry[3]).toFixed(2);
				dataGrid+="field4:"+"\"<div class='textR'>"+addCommas(rentNetSales)+"</div>\"";
				dataGrid+="}";
				i++;
			});
			dataGrid+="]";
			
			
			var objDataGrid = eval("("+dataGrid+")");
			//alert(dataGrid);
			dataGridFunction('#bottomInvestmentGrid',objDataGrid);
		}
	});
	
	//LandlordGroup End
});
