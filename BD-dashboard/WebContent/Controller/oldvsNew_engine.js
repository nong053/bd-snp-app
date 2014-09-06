//ฟังก์ชันสำหรับ tooltip แสดงค่าตัวเลข 2 ตำแหน่ง และ Commas
function getDicimalCommas(value){
 var nStr=(value).toFixed(2);
	x = nStr.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1)) {
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2;
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
            url:"styles/dashboardOldvsNew.css",
            dataType:"html",
            success:function(data){
				$("style.loadCss").remove();
                $("head").append("<style class='loadCss'>" + data + "</style>");
                //loading complete code here
            }
        });
//-----------------------
	var lineChart = function(lineChartName,objLineChartData){
	$(lineChartName).kendoChart({
	    theme: $(document).data("kendoSkin") || "default",
	    title: {
	        text: ""
	    },
	    chartArea: {
			width: 560,
			height: 300,
			background: ""
		},
	    legend: {
	        position: "bottom"
	    },
	    seriesDefaults: {
	        type: "line",
	        stack: true
	    },
	    /*
	    series: [{
	        name: "category1",
	        data: [67.96, 68.93, 75, 74, 78,79,80,81,82,83,84,85]
	    }, {
	        name: "category2",
	        data: [15.7, 16.7, 20, 23.5, 26.6,27,28,29,30,31,32,33]
	    }],
	    
	    [{name:"New Store",data:"0.00,0.00,0.00,0.00,1311000.00,1311000.00,1311000.00,1311000.00,1311000.00,1311000.00,1311000.00,1311000.00"},{name:"Same Store",data:"1311000.00,1311000.00,1311000.00,1311000.00,1311000.00,1311000.00,1311000.00,1311000.00,1311000.00,1311000.00,1311000.00,1311000.00"},{name:"Same Store",data:"0.00,769500.00,769500.00,769500.00,769500.00,769500.00,769500.00,769500.00,769500.00,769500.00,769500.00,769500.00"},{name:"Same Store",data:"0.00,0.00,1311000.00,1311000.00,1311000.00,1311000.00,1311000.00,1311000.00,1311000.00,1311000.00,1311000.00,1311000.00"},{name:"Same Store",data:"0.00,0.00,0.00,0.00,507300.00,507300.00,507300.00,507300.00,507300.00,507300.00,507300.00,507300.00"}]
	    */
	    series:objLineChartData,
	    valueAxis: {
	        labels: {
	            //format: "{0}"
	        	 template: "#=  getDicimalCommas(value) # "
	        }
	    },
	    categoryAxis: {
	        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
	    },
	    tooltip: {
	        visible: true,
	       // format: "{0}"
	       // template: "#= kendo.format('{0:N0}', value) # "
	        template: "#= getDicimalCommas(value) # "
	        	
	    }
	});
	
	};//function lineChart
	//lineChart();
	
	//alert("hello world");
	/*
sesParamYear
sesParamMonthFrom
sesParamMonthTo
sesParamBrand
sesParamCountry
sesParamRegion
sesParamProvince
sesParamArea
'2012' ,'01' , '12', 'Maisen' , 'Thailand' , 'ภาคกลาง' , 'กรุงเทพมหานคร'  ,'ALL' 
	 */
	
	//1 NetSales Start
	$.ajax({
		url:'Model/oldvsNewService.jsp',
		type:'post',
		dataType:'json',
		data:{'paramRequest':'NetSales','paramYear':$("#sesParamYear").val(),
			'paramMonthFrom':$("#sesParamMonthFrom").val(),'paramMonthTo':$("#sesParamMonthTo").val(),
			'paramBrand':$("#sesParamBrand").val(),'paramCountry':$("#sesParamCountry").val(),
			'paramRegion':$("#sesParamRegion").val(),'paramProvince':$("#sesParamProvince").val(),
			'paramArea':$("#sesParamArea").val()
		},
		success:function(data){

			/*
			 [{
		        name: "category1",
		        data: [67.96, 68.93, 75, 74, 78,79,80,81,82,83,84,85]
		     }, {
		        name: "category2",
		        data: [15.7, 16.7, 20, 23.5, 26.6,27,28,29,30,31,32,33]
		     }]
			 */
			var lineChartData = "";
			var i=0;
			lineChartData+="[";
			$.each(data,function(index,EntryIndex){
				if(i==0){
					lineChartData+="{";
				}else{
					
					lineChartData+=",{";
				}
				lineChartData+="name:\""+EntryIndex[0]+"\","; 
				lineChartData+="data:["+parseFloat(EntryIndex[3]).toFixed(2)+","+parseFloat(EntryIndex[4]).toFixed(2)+","+parseFloat(EntryIndex[5]).toFixed(2)+","+parseFloat(EntryIndex[6]).toFixed(2)+","+parseFloat(EntryIndex[7]).toFixed(2)+","+parseFloat(EntryIndex[8]).toFixed(2)+","+parseFloat(EntryIndex[9]).toFixed(2)+","+parseFloat(EntryIndex[10]).toFixed(2)+","+parseFloat(EntryIndex[11]).toFixed(2)+","+parseFloat(EntryIndex[12]).toFixed(2)+","+parseFloat(EntryIndex[13]).toFixed(2)+","+parseFloat(EntryIndex[14]).toFixed(2)+"]";
				
				lineChartData+="}";
				i++;
			});
			lineChartData+="]";
			var objLineChartData=eval("("+lineChartData+")");
			//console.log(lineChartData);
			lineChart('#lineChartNetSales',objLineChartData);
			
		}
		
	});
	//1 NetSales End
	//2 RentNetSales Start
	
	$.ajax({
		url:'Model/oldvsNewService.jsp',
		type:'post',
		dataType:'json',
		data:{'paramRequest':'RentNetSales','paramYear':$("#sesParamYear").val(),
			'paramMonthFrom':$("#sesParamMonthFrom").val(),'paramMonthTo':$("#sesParamMonthTo").val(),
			'paramBrand':$("#sesParamBrand").val(),'paramCountry':$("#sesParamCountry").val(),
			'paramRegion':$("#sesParamRegion").val(),'paramProvince':$("#sesParamProvince").val(),
			'paramArea':$("#sesParamArea").val()
		},
		success:function(data){
			
			var lineChartData = "";
			var i=0;
			lineChartData+="[";
			$.each(data,function(index,EntryIndex){
				if(i==0){
					lineChartData+="{";
				}else{
					
					lineChartData+=",{";
				}
				lineChartData+="name:\""+EntryIndex[0]+"\","; 
				lineChartData+="data:["+parseFloat(EntryIndex[3]).toFixed(2)+","+parseFloat(EntryIndex[4]).toFixed(2)+","+parseFloat(EntryIndex[5]).toFixed(2)+","+parseFloat(EntryIndex[6]).toFixed(2)+","+parseFloat(EntryIndex[7]).toFixed(2)+","+parseFloat(EntryIndex[8]).toFixed(2)+","+parseFloat(EntryIndex[9]).toFixed(2)+","+parseFloat(EntryIndex[10]).toFixed(2)+","+parseFloat(EntryIndex[11]).toFixed(2)+","+parseFloat(EntryIndex[12]).toFixed(2)+","+parseFloat(EntryIndex[13]).toFixed(2)+","+parseFloat(EntryIndex[14]).toFixed(2)+"]";
				
				lineChartData+="}";
				i++;
			});
			lineChartData+="]";
			//alert(lineChartData);
			var objLineChartData=eval("("+lineChartData+")");
			//console.log(lineChartData);
			lineChart('#lineChartRentNetSales',objLineChartData);
			
		}
		
	});
	
	//2 RentNetSales End
	
	
	//3 RentEBITDA Start
	
	$.ajax({
		url:'Model/oldvsNewService.jsp',
		type:'post',
		dataType:'json',
		data:{'paramRequest':'RentEBITDA','paramYear':$("#sesParamYear").val(),
			'paramMonthFrom':$("#sesParamMonthFrom").val(),'paramMonthTo':$("#sesParamMonthTo").val(),
			'paramBrand':$("#sesParamBrand").val(),'paramCountry':$("#sesParamCountry").val(),
			'paramRegion':$("#sesParamRegion").val(),'paramProvince':$("#sesParamProvince").val(),
			'paramArea':$("#sesParamArea").val()
		},
		success:function(data){
			
			var lineChartData = "";
			var i=0;
			lineChartData+="[";
			$.each(data,function(index,EntryIndex){
				if(i==0){
					lineChartData+="{";
				}else{
					
					lineChartData+=",{";
				}
				lineChartData+="name:\""+EntryIndex[0]+"\","; 
				lineChartData+="data:["+parseFloat(EntryIndex[3]).toFixed(2)+","+parseFloat(EntryIndex[4]).toFixed(2)+","+parseFloat(EntryIndex[5]).toFixed(2)+","+parseFloat(EntryIndex[6]).toFixed(2)+","+parseFloat(EntryIndex[7]).toFixed(2)+","+parseFloat(EntryIndex[8]).toFixed(2)+","+parseFloat(EntryIndex[9]).toFixed(2)+","+parseFloat(EntryIndex[10]).toFixed(2)+","+parseFloat(EntryIndex[11]).toFixed(2)+","+parseFloat(EntryIndex[12]).toFixed(2)+","+parseFloat(EntryIndex[13]).toFixed(2)+","+parseFloat(EntryIndex[14]).toFixed(2)+"]";
				
				lineChartData+="}";
				i++;
			});
			lineChartData+="]";
			var objLineChartData=eval("("+lineChartData+")");
			//console.log(lineChartData);
			lineChart('#lineChartEBITDA',objLineChartData);
			
		}
		
	});
	
	//3 RentEBITDA End
	
	//4 EBIT Start
	
	$.ajax({
		url:'Model/oldvsNewService.jsp',
		type:'post',
		dataType:'json',
		data:{'paramRequest':'EBIT','paramYear':$("#sesParamYear").val(),
			'paramMonthFrom':$("#sesParamMonthFrom").val(),'paramMonthTo':$("#sesParamMonthTo").val(),
			'paramBrand':$("#sesParamBrand").val(),'paramCountry':$("#sesParamCountry").val(),
			'paramRegion':$("#sesParamRegion").val(),'paramProvince':$("#sesParamProvince").val(),
			'paramArea':$("#sesParamArea").val()
		},
		success:function(data){
			
			var lineChartData = "";
			var i=0;
			lineChartData+="[";
			$.each(data,function(index,EntryIndex){
				if(i==0){
					lineChartData+="{";
				}else{
					
					lineChartData+=",{";
				}
				lineChartData+="name:\""+EntryIndex[0]+"\","; 
				lineChartData+="data:["+parseFloat(EntryIndex[3]).toFixed(2)+","+parseFloat(EntryIndex[4]).toFixed(2)+","+parseFloat(EntryIndex[5]).toFixed(2)+","+parseFloat(EntryIndex[6]).toFixed(2)+","+parseFloat(EntryIndex[7]).toFixed(2)+","+parseFloat(EntryIndex[8]).toFixed(2)+","+parseFloat(EntryIndex[9]).toFixed(2)+","+parseFloat(EntryIndex[10]).toFixed(2)+","+parseFloat(EntryIndex[11]).toFixed(2)+","+parseFloat(EntryIndex[12]).toFixed(2)+","+parseFloat(EntryIndex[13]).toFixed(2)+","+parseFloat(EntryIndex[14]).toFixed(2)+"]";
				
				lineChartData+="}";
				i++;
			});
			lineChartData+="]";
			var objLineChartData=eval("("+lineChartData+")");
			//console.log(lineChartData);
			lineChart('#lineChartEBIT',objLineChartData);
			
		}
		
	});
	
	//4 EBIT End
});