//ฟังก์ชันสำหรับ tooltip แสดงค่าตัวเลข 2 ตำแหน่ง
function getDicimal(value){
return (value).toFixed(2)+"%";
}
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
$(document).ready(function(){
//load css by ajax
$.ajax({
            url:"styles/dashboard1.css",
            dataType:"html",
            success:function(data){
				$("style.loadCss").remove();
                $("head").append("<style class='loadCss'>" + data + "</style>");
                //loading complete code here
            }
        });
//-----------------------


var $titleJ =[
              {
                  field: "branch",
				   width: 150
              },
              {
                  field: "netSales",
				  width: 80
			 },
              {
                  field: "netSales",
				  width: 80
			 },
              {
                  field: "rentNetSales",
				  width:80
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
                	  branch: "&nbsp;",
                	  rent: "",
                	  netSales: "  ",
                	  rentNetSales: "",
                	 
                     
                  },
                  {
                	  branch: "&nbsp;",
                	  rent: "",
                	  netSales: "  ",
                	  rentNetSales: "",
                	
				  },
                  {
                	  branch: "&nbsp;",
                	  rent: "",
                	  netSales: "  ",
                	  rentNetSales: "",
                	
				  },
                  {
                	  branch: "&nbsp;",
                	  rent: "",
                	  netSales: "  ",
                	  rentNetSales: "",
                	
				  },
                  {
                	  branch: "&nbsp;",
                	  rent: "",
                	  netSales: "  ",
                	  rentNetSales: "",
                	
				  },
                  {
                	  branch: "&nbsp;",
                	  rent: "",
                	  netSales: "  ",
                	  rentNetSales: "",
                	
				  },
                  {
                	  branch: "&nbsp;",
                	  rent: "",
                	  netSales: "  ",
                	  rentNetSales: "",
                	
				  }
				  
				  ]; 	
	// ################ Genarate GRID ################# //
	var gridFunction=function(grigName,objDataGrid){
		
		$(grigName).kendoGrid({
			  //ไม่กำหนดความสูง height จะเป็น auto
	          height: 260,
			  //detailInit: detailInit,
	          columns: $titleJ,//[{"filed":"Filed1",width:100},{"filed":"Filed2","width":200}]
	          dataSource: {
	          data: objDataGrid,//[{"Filed1":"content1"},{"Filed2":"content2"}]
	        	 // data:$dataJ,
				// pageSize: 3,
	          }
	   	});
		//console.log($(".textR").get());
		$(".textR").addClass("textR");
		$(".textL").addClass("textL");
	};
	
	
	
	//Call Ajax for Grid Sart
	var RentNet = function(paramRequest,grigName){
	$.ajax({
		url:'overviewService.jsp',
		type:'POST',
		dataType:'JSON',
		data:{'paramRequest':""+paramRequest+"",'paramYear':$("#sesParamYear").val(),
			'paramMonthFrom':$("#sesParamMonthFrom").val(),'paramMonthTo':$("#sesParamMonthTo").val(),
			'paramBrand':$("#sesParamBrand").val(),'paramCountry':$("#sesParamCountry").val(),
			'paramRegion':$("#sesParamRegion").val(),'paramProvince':$("#sesParamProvince").val(),
			'paramArea':$("#sesParamArea").val()},
		success:function(data){
			var i=0;
			var dataGrid="";
			dataGrid+="[";
			//alert("data"+data);
			$.each(data,function(index,indexEntry){
				//alert(indexEntry[0]);
				
				/*
				 [
                  {
                	  branch: "&nbsp;",
                	  rent: "",
                	  netSales: "  ",
                	  rentNetSales: "",
                	 
                     
                  },
                  {
                	  branch: "&nbsp;",
                	  rent: "",
                	  netSales: "  ",
                	  rentNetSales: "",
                	
				  }]
				 */
				 
				
				if(i==0){
					dataGrid+="{";
				}else{
					dataGrid+=",{";
				}
				dataGrid+="branch:"+"\"<div class='textL'>"+indexEntry[0]+"</div>\",";
				dataGrid+="rent:"+"\"<div class='textR'>"+addCommas(indexEntry[1])+"</div>\",";
				dataGrid+="netSales:"+"\"<div class='textR'>"+addCommas(indexEntry[2])+"</div>\",";
				var rentNetSales= parseFloat(indexEntry[3]).toFixed(2);
				dataGrid+="rentNetSales:"+"\"<div class='textR'>"+addCommas(rentNetSales)+"</div>\"";
				dataGrid+="}";
				i++;
			});
			dataGrid+="]";
			
			
			var objDataGrid = eval("("+dataGrid+")");
			//console.log(dataGrid);
			gridFunction(grigName,objDataGrid);
		}
	});
	};//end top 10
	
	


// ################ Genarate GRID ################# //
	

var pieChart=function(chartName,dataPieChart){
	
$(chartName).kendoChart({
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
               // format: "{0}"
            	//template: "#= category # - #= kendo.format('{0:P}', percentage)#",
            	template: "#= kendo.format('{0:P}', percentage)#",
                //visible: true
            }
        },
        series: [{
            type: "pie",
            data: dataPieChart
        }],
        tooltip: {
            visible: true,
            //format: "{0}"
           // template: "#= kendo.format('{0:P}', value) # - #= kendo.format('{0:P}', percentage)#",
            template:"#= getDicimalCommas(value)# (#= kendo.format('{0:P}',percentage)#)"
        }
        
 });
};





//Function PieChart End.
//Call function pie chart 
pieChart();

//Function Ajax Net Sales Start
var clickNetSalseList=function(valueList){
	
	//alert("sesParamProvince"+$("#sesParamProvince").val());
	$.ajax({
		url:'overviewService.jsp',
		type:'POST',
		dataType:'JSON',
		data:{'paramRequest':'netSales','valueList':valueList,'paramYear':$("#sesParamYear").val(),
			'paramMonthFrom':$("#sesParamMonthFrom").val(),'paramMonthTo':$("#sesParamMonthTo").val(),
			'paramBrand':$("#sesParamBrand").val(),'paramCountry':$("#sesParamCountry").val(),
			'paramRegion':$("#sesParamRegion").val(),'paramProvince':$("#sesParamProvince").val(),
			'paramArea':$("#sesParamArea").val()},
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
			pieChart("#chartNetSales",objDataPieChart);
		}
	});
};//end function clickNetSales

//Function Ajax Rent Start
var clickRentList=function(valueList){
	//alert("sesParamProvince"+$("#sesParamProvince").val());
	$.ajax({
		url:'overviewService.jsp',
		type:'POST',
		dataType:'JSON',
		data:{'paramRequest':'rent','valueList':valueList,'paramYear':$("#sesParamYear").val(),
			'paramMonthFrom':$("#sesParamMonthFrom").val(),'paramMonthTo':$("#sesParamMonthTo").val(),
			'paramBrand':$("#sesParamBrand").val(),'paramCountry':$("#sesParamCountry").val(),
			'paramRegion':$("#sesParamRegion").val(),'paramProvince':$("#sesParamProvince").val(),
			'paramArea':$("#sesParamArea").val()},
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
			pieChart("#chartRent",objDataPieChart);
		}
	});
};//end function click Rent

//Function Ajax Investment Start
var clickInvestmentList=function(valueList){
	//alert("sesParamProvince"+$("#sesParamProvince").val());
	$.ajax({
		url:'overviewService.jsp',
		type:'POST',
		dataType:'JSON',
		data:{'paramRequest':'investment','valueList':valueList,'paramYear':$("#sesParamYear").val(),
			'paramMonthFrom':$("#sesParamMonthFrom").val(),'paramMonthTo':$("#sesParamMonthTo").val(),
			'paramBrand':$("#sesParamBrand").val(),'paramCountry':$("#sesParamCountry").val(),
			'paramRegion':$("#sesParamRegion").val(),'paramProvince':$("#sesParamProvince").val(),
			'paramArea':$("#sesParamArea").val()},
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
			pieChart("#chartInvestment",objDataPieChart);
		}
	});
};//end function click Investment


//Function Ajax Ebit Start
var clickEbitList=function(valueList){
	//alert("sesParamProvince"+$("#sesParamProvince").val());
	$.ajax({
		url:'overviewService.jsp',
		type:'POST',
		dataType:'JSON',
		data:{'paramRequest':'ebit','valueList':valueList,'paramYear':$("#sesParamYear").val(),
			'paramMonthFrom':$("#sesParamMonthFrom").val(),'paramMonthTo':$("#sesParamMonthTo").val(),
			'paramBrand':$("#sesParamBrand").val(),'paramCountry':$("#sesParamCountry").val(),
			'paramRegion':$("#sesParamRegion").val(),'paramProvince':$("#sesParamProvince").val(),
			'paramArea':$("#sesParamArea").val()},
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
			pieChart("#chartEbit",objDataPieChart);
		}
	});
};//end function click Ebit


//### CALL BY SELECTION
$("#netSales").live("change",function(){
	clickNetSalseList($(this).val());
});

$("#rent").live("change",function(){
	clickRentList($(this).val());
});

$("#investment").live("change",function(){
	clickInvestmentList($(this).val());

});

$("#ebit").live("change",function(){
	clickEbitList($(this).val());
});

//### Default when open window is will be Active.
setTimeout(function(){
	
	clickNetSalseList($("#netSales").val());
	clickRentList($("#rent").val());
	clickInvestmentList($("#investment").val());
	clickEbitList($("#ebit").val());
	
	//Call Grid Ative

	

	//$("#gridTopRentNet").empty();
	//$("#gridBottomRentNet").empty();
	RentNet("topRentNet","#gridTopRentNet");
	RentNet("bottomRentNet","#gridBottomRentNet");

	
	
},1000);

$(".ui-tabs-panel").css({"padding":"1px"});

});//End Document Ready
//Call Ajax Net Sales End