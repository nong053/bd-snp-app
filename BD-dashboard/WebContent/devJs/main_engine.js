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
	//Start Engine BD Machine 
	//############## Click Country Start
	var clickCountry=function(paramCountry){
		//##############ajax Region Start.
		$.ajax({
			url:'service.jsp',
			type:'POST',
			dataType:'json',
			async:false,
			data:{'paramRequest':'Region','paramCountry':paramCountry},
			success:function(data){
				//alert(data);
				var optionRegion="";
				optionRegion+="<select name=\"paramRegion\" id=\"paramRegion\" class=\"listSelect\">";
				$.each(data,function(index,indexEntry){
					optionRegion+="<option>"+indexEntry+"</option>";
				});
				optionRegion+="</select>";
				
				$("#areaparamRegion").empty();
				$("#areaparamRegion").html(optionRegion);
				$("#paramRegion").kendoDropDownList();
				
			}
		});
		//##############ajax Region End.
		//##############ajax Province Start.
		$.ajax({
			url:'service.jsp',
			type:'POST',
			dataType:'json',
			async:false,
			data:{'paramRequest':'Province','paramCountry':paramCountry,'paramRegion':$("#paramRegion").val()},
			success:function(dataProvince){
				
				var optionProvince="";
				optionProvince+="<select name=\"paramProvince\" id=\"paramProvince\" class=\"listSelect\">";
				$.each(dataProvince,function(index,indexEntry){
					optionProvince+="<option>"+indexEntry+"</option>";
				});
				optionProvince+="</select>";
				
				//alert(optionProvince);
				$("#areaparamProvince").empty();
				$("#areaparamProvince").html(optionProvince);
				$("#paramProvince").kendoDropDownList();
			}
		});
		//##############ajax Province End.
		
		//##############ajax Area Start.
		$.ajax({
			url:'service.jsp',
			type:'POST',
			dataType:'json',
			async:false,
			data:{'paramRequest':'Area','paramCountry':paramCountry},
			success:function(dataArea){
				
				var optionArea="";
				optionArea+="<select name=\"paramArea\" id=\"paramArea\" class=\"listSelect\">";
				$.each(dataArea,function(index,indexEntry){
					optionArea+="<option>"+indexEntry+"</option>";
				});
				optionArea+="</select>";
				
				//alert(optionArea);
				$("#areaparamArea").empty();
				$("#areaparamArea").html(optionArea);
				$("#paramArea").kendoDropDownList();
			}
		});
		//##############ajax Area End.
	};
	//############## Click Country End
	
	
	
	
	
	
	//############## Click Region Start
	var clickRegion=function(paramCountry){
		
		//##############ajax Province Start.
		$.ajax({
			url:'service.jsp',
			type:'POST',
			dataType:'JSON',
			async:false,
			data:{'paramRequest':'Province','paramCountry':paramCountry,'paramRegion':$("#paramRegion").val()},
			success:function(dataProvince){
				//alert(dataProvince);
				
				var optionProvince="";
				optionProvince+="<select name=\"paramProvince\" id=\"paramProvince\" class=\"listSelect\">";
				$.each(dataProvince,function(index,indexEntry){
					optionProvince+="<option>"+indexEntry+"</option>";
				});
				optionProvince+="</select>";
				
				//alert(optionProvince);
				$("#areaparamProvince").empty();
				$("#areaparamProvince").html(optionProvince);
				$("#paramProvince").kendoDropDownList();
				
			}
		});
		//##############ajax Province End.
		
		//##############ajax Area Start.
		$.ajax({
			url:'service.jsp',
			type:'POST',
			dataType:'json',
			async:false,
			data:{'paramRequest':'Area','paramCountry':paramCountry},
			success:function(dataArea){
				
				var optionArea="";
				optionArea+="<select name=\"paramArea\" id=\"paramArea\" class=\"listSelect\">";
				$.each(dataArea,function(index,indexEntry){
					optionArea+="<option>"+indexEntry+"</option>";
				});
				optionArea+="</select>";
				
				//alert(optionArea);
				$("#areaparamArea").empty();
				$("#areaparamArea").html(optionArea);
				$("#paramArea").kendoDropDownList();
			}
		});
		//##############ajax Area End.
	};
	//############## Click Region End
	
	
	
	
	
	
	//############## Click Province Start
	var clickProvince=function(paramCountry){
		
		
		
		//##############ajax Area Start.
		$.ajax({
			url:'service.jsp',
			type:'POST',
			dataType:'json',
			async:false,
			data:{'paramRequest':'Area','paramCountry':paramCountry},
			success:function(dataArea){
				
				var optionArea="";
				optionArea+="<select name=\"paramArea\" id=\"paramArea\" class=\"listSelect\">";
				$.each(dataArea,function(index,indexEntry){
					optionArea+="<option>"+indexEntry+"</option>";
				});
				optionArea+="</select>";
				
				//alert(optionArea);
				$("#areaparamArea").empty();
				$("#areaparamArea").html(optionArea);
				$("#paramArea").kendoDropDownList();
			}
		});
		//##############ajax Area End.
	};
	//############## Click Province End
	
	
	
	
	
	
	
	
	$("#paramCountry").live("change",function(){
		//alert($(this).val());
		clickCountry($(this).val());
	});
	$("#paramRegion").live("change",function(){
		//alert($("#paramCountry").val());
		clickRegion($("#paramCountry").val());
	});
	
	$("#paramProvince").live("change",function(){
		//alert($("#paramCountry").val());
		clickProvince($("#paramCountry").val());
	});
	
	
	//################# VALUE DEFAULT START
	//alert($("#paramCountry").val());
	setTimeout(function(){
		clickCountry($("#paramCountry").val());
	},1000);
	
	//################# VALUE DEFAULT END
	
	//################# Submit From
	$("#form").submit(function(){
		
		//check page
		//alert($(".sessParamPage").val());
		if($(".sessParamPage").val()=="tabs1"){
			$("a[href=#tabs-1]").trigger("click");
			
		}else if($(".sessParamPage").val()=="tabs2"){
			$("a[href=#tabs-2]").trigger("click");
			
		}else if($(".sessParamPage").val()=="tabs3"){
			$("a[href=#tabs-3]").trigger("click");
			
		}else if($(".sessParamPage").val()=="tabs4"){
			$("a[href=#tabs-4]").trigger("click");
			
		}else if($(".sessParamPage").val()=="tabs5"){
			$("a[href=#tabs-5]").trigger("click");
			
		}else{
			$("a[href=#tabs-1]").trigger("click");
			
		}
		
		
		//Auto Click
		$("#tabs").tabs();	
		//$("a[href=#tabs-1]").trigger("click");
		

		
		
		$("#mainBody").show();
		//session embed start
		$(".sesParam").remove();
		$("body").append("<input type='hidden' id='sesParamYear' id='sesParamYear' class='sesParam' value='"+$("#paramYear").val()+"'>");
		$("body").append("<input type='hidden' id='sesParamMonthFrom' id='sesParamMonthFrom' class='sesParam' value='"+$("#paramMonthFrom").val()+"'>");
		$("body").append("<input type='hidden' id='sesParamMonthTo' id='sesParamMonthTo' class='sesParam' value='"+$("#paramMonthTo").val()+"'>");
		$("body").append("<input type='hidden' id='sesParamBrand' id='sesParamBrand' class='sesParam' value='"+$("#paramBrand").val()+"'>");
		$("body").append("<input type='hidden' id='sesParamCountry' id='sesParamCountry' class='sesParam' value='"+$("#paramCountry").val()+"'>");
		$("body").append("<input type='hidden' id='sesParamRegion' id='sesParamRegion' class='sesParam' value='"+$("#paramRegion").val()+"'>");
		$("body").append("<input type='hidden' id='sesParamProvince' id='sesParamProvince' class='sesParam' value='"+$("#paramProvince").val()+"'>");
		$("body").append("<input type='hidden' id='sesParamArea' id='sesParamArea' class='sesParam' value='"+$("#paramArea").val()+"'>");
		
		
		return false;
	});
	
	
	//Loading start
	
	$("#mainCope").ajaxStart(function(){
		var width=(screen.availWidth);
		var	height=(screen.availHeight);
		
		
		$(this).css({"width":width+"px","height":height+"px"}).show();
		
		
	});
	$("#mainCope").ajaxStop(function(){
	
		$(this).animate({'opacity':'0'}).hide();
	});
	
	//Loading End
	//End Engine BD Machine 
	
	
	
	//#################Management Rent Page Start #######################//
	//locationType function
	//Year` `MonthFrom` `MonthTo` `LocationTypeList`
	//RentPerSqMTop_LocationType
	//RentPerSqMBottom_LocationType
	var callSubGrid =function(paramRequest,paramSort,paramLocationTypeName,paramYear,paramMonthFrom,paramMonthTo,paramLocationTypeList){
		//alert("callSubGrid main");
		$.ajax({
			url:'Model/rentService.jsp',
			type:'post',
			dataType:'json',
			//locationType,top,rentPerSqM
			data:{'paramRequest':paramRequest,'paramSort':paramSort,'paramLocationTypeName':paramLocationTypeName,'paramYear':paramYear,'paramMonthFrom':paramMonthFrom,'paramMonthTo':paramMonthTo,'paramLocationTypeList':paramLocationTypeList},
			success:function(data){
				//alertData
				/*
				$.each(data,function(index,EntryIndex){
					alert(EntryIndex[0]);//Branch
					alert(EntryIndex[1]);//Rent/SqM
					
					
				});
				*/
				var dataGrid="";
				var i=0;
				dataGrid+="[";
				
				$.each(data,function(index,EntryIndex){
					if(i==0){
						dataGrid+="{";
					}else{
						dataGrid+=",{";
					}
					
					dataGrid+="\"Field1\":\""+EntryIndex[0]+"\",";//Branch
					var RentSqM=parseFloat(EntryIndex[1]).toFixed(2);
					
					dataGrid+="\"Field2\":\"<div class='textR'>"+addCommas(RentSqM)+"</div>\"";//Rent/SqM
				
						
						
					
					dataGrid+="}";
				
					
					i++;
					
				});
				dataGrid+="]";
				
				//alert(dataGrid);
				var objDataGrid=eval("("+dataGrid+")");
				//console.log(objDataGrid);
				//alert(paramLocationTypeName);
				$("#"+paramLocationTypeName).empty();
				
				/*
				if(paramRequest.equals("Region")){
					alert("hello");
				}
				*/
				$("#"+paramLocationTypeName).empty();
				//alert(paramLocationTypeName);
				gridTopBottom(objDataGrid,paramLocationTypeName);
				
				
			}
			//alert("notdata");
			
		});
		
		//Set number or strint text
		$(".textR").addClass("textR");
	};
	
	//Event Click List 
	//listboxlocationType
	$(".listLocationType").live("click",function(){
		//alert($(this).text());
		//Embeded paramLocationTypeList
		//get value checked radio button
		var rentSqMSort  = $("input[name=radioLocationTypeRentSqM]:checked").val();
		var rentNetSalesSqMSort  =$("input[name=radioLocationTypeNetSalesSqM]:checked").val(); 
		var rentRentNetSalesSort  = $("input[name=radioLocationTypeRentNetSales]:checked").val();   
		//alert($("input[name=radioLocationTypeRentSqM]:checked").val());
		
		//console.log($(".radioLocationTypeRentSqM").attr());
		
		$("#sesParamLocationTypeList").remove();
		$("body").append("<input type='hidden' id='sesParamLocationTypeList' class='sesParam' value='"+$(this).text()+"'>");
		
		
		$(".listLocationType").css({'background':''});
		$(".listLocationType").attr('s','');
		$(".listLocationType#"+this.id).css({'background':'#DBEEF3'}).attr('s','selected');
		
		
		callSubGrid("locationType",""+rentSqMSort+"","gridRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamLocationTypeList").val()+"");
		callSubGrid("locationType",""+rentNetSalesSqMSort+"","gridNetSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamLocationTypeList").val()+"");
		callSubGrid("locationType",""+rentRentNetSalesSort+"","gridRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamLocationTypeList").val()+"");
		
		return false;
	
	});
	
	
	//listLandlordGroup
	$(".listLandlordGroup").live("click",function(){
		//get value checked radio button
		var SqMSort  = $("input[name=radioLandlordGroupRentSqM]:checked").val();
		var NetSalesSqMSort  =$("input[name=radioLandlordGroupNetSalesSqM]:checked").val(); 
		var RentNetSalesSort  = $("input[name=radioLandlordGroupRentNetSales]:checked").val();  
		
		//Embeded paramLocationTypeList
		$("#sesParamListLandlordGroup").remove();
		$("body").append("<input type='hidden' id='sesParamListLandlordGroup' class='sesParam' value='"+$(this).text()+"'>");
		
		
		$(".listLandlordGroup").css({'background':''});
		$(".listLandlordGroup").attr('s','');
		$(".listLandlordGroup#"+this.id).css({'background':'#DBEEF3'}).attr('s','selected');
		
		//Event when click
		
		callSubGrid("landlordGroup",""+SqMSort+"","gridLandlordGroupRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListLandlordGroup").val()+"");
		callSubGrid("landlordGroup",""+NetSalesSqMSort+"","gridLandlordGroupNetSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListLandlordGroup").val()+"");
		callSubGrid("landlordGroup",""+RentNetSalesSort+"","gridLandlordGroupRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListLandlordGroup").val()+"");
		return false;
	
	});
	
	//listBrand
	$(".listBrand").live("click",function(){
		//get value checked radio button
		var SqMSort  = $("input[name=radioBrandRentSqM]:checked").val();
		var NetSalesSqMSort  =$("input[name=radioBrandNetSalesSqM]:checked").val(); 
		var RentNetSalesSort  = $("input[name=radioBrandRentNetSales]:checked").val();  
		
		
		//Embeded paramLocationTypeList
		$("#sesParamListBrand").remove();
		$("body").append("<input type='hidden' id='sesParamListBrand' class='sesParam' value='"+$(this).text()+"'>");
		
		
		$(".listBrand").css({'background':''});
	
		$(".listBrand").attr('s','');
		$(".listBrand#"+this.id).css({'background':'#DBEEF3'}).attr('s','selected');
		
		callSubGrid("Brand",""+SqMSort+"","gridBrandRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListBrand").val()+"");
		callSubGrid("Brand",""+NetSalesSqMSort+"","gridBrandNetSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListBrand").val()+"");
		callSubGrid("Brand",""+RentNetSalesSort+"","gridBrandRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListBrand").val()+"");
		
		return false;
	
	});
	
	
	
	
	
	//Click Region
	$(".listRegion").live("click",function(){
		
		//get value checked radio button
		var SqMSort  = $("input[name=radioRegionProvinceRentSqM]:checked").val();
		var NetSalesSqMSort  =$("input[name=radioRegionProvinceNetSalesSqM]:checked").val(); 
		var RentNetSalesSort  = $("input[name=radioRegionProvinceRentNetSales]:checked").val();  
		
		//alert($(this).text());
		//Embeded paramLocationTypeList
		$("#sesParamListRegion").remove();
		$("#sesParamListProvince").remove();
		$("body").append("<input type='hidden' id='sesParamListRegion' class='sesParam' value='"+$(this).text()+"'>");
		
		
		$(".listRegion").css({'background':''});
		
		$(".listRegion").attr('s','');
		$(".listRegion#"+this.id).css({'background':'#DBEEF3'}).attr('s','selected');
		
		callSubGrid("Region",""+SqMSort+"","gridRegionProvinceRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListRegion").val()+"");
		callSubGrid("Region",""+NetSalesSqMSort+"","gridRegionProvinceNetSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListRegion").val()+"");
		callSubGrid("Region",""+RentNetSalesSort+"","gridRegionProvinceRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListRegion").val()+"");
		
		//alert(this.id);
		//listProvince
			$.ajax({
				url:'Model/rentService.jsp',
				type:'POST',
				dataType:'html',
				data:{'paramRequest':'listProvince','paramRegion':$(this).text(),'paramCountry':$("#sesParamCountry").val(),'paramProvince':$("#sesParamProvince").val()},
				success:function(data){
					//alert(data);
					$("#boxProvince").html(data);
					//Run Default
					//$(".boxEvent#boxProvince ul li:eq(0) a").trigger("click");
					
					
					
				}
			});
			
			return false;
	
	});
	//Click Province
	$(".listProvince").live("click",function(){
		
		//get value checked radio button
		var SqMSort  = $("input[name=radioRegionProvinceRentSqM]:checked").val();
		var NetSalesSqMSort  =$("input[name=radioRegionProvinceNetSalesSqM]:checked").val(); 
		var RentNetSalesSort  = $("input[name=radioRegionProvinceRentNetSales]:checked").val();  
		
		//Embeded paramLocationTypeList
		$("#sesParamListProvince").remove();
		$("body").append("<input type='hidden' id='sesParamListProvince' class='sesParam' value='"+$(this).text()+"'>");
		
		$(".listProvince").css({'background':''});
		
		$(".listProvince").attr('s','');
		$(".listProvince#"+this.id).css({'background':'#DBEEF3'}).attr('s','selected');
		
		
		callSubGrid("Province",""+SqMSort+"","gridRegionProvinceRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListProvince").val()+"");
		callSubGrid("Province",""+NetSalesSqMSort+"","gridRegionProvinceNetSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListProvince").val()+"");
		callSubGrid("Province",""+RentNetSalesSort+"","gridRegionProvinceRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListProvince").val()+"");
		
		return false;
	
	});
	//Click Area
	$(".listArea").live("click",function(){
		
		//get value checked radio button
		var SqMSort  = $("input[name=radioAreaRentSqM]:checked").val();
		var NetSalesSqMSort  =$("input[name=radioAreaNetSalesSqM]:checked").val(); 
		var RentNetSalesSort  = $("input[name=radioAreaRentNetSales]:checked").val();  
		
		//Embeded paramLocationTypeList
		$("#sesParamListArea").remove();
		$("body").append("<input type='hidden' id='sesParamListArea' class='sesParam' value='"+$(this).text()+"'>");
		
		
		$(".listArea").css({'background':''});
		$(".listArea").attr('s','');
		$(".listArea#"+this.id).css({'background':'#DBEEF3'}).attr('s','selected');
		
		
		callSubGrid("Area",""+SqMSort+"","gridAreaRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListArea").val()+"");
		callSubGrid("Area",""+NetSalesSqMSort+"","gridAreaNetSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListArea").val()+"");
		callSubGrid("Area",""+RentNetSalesSort+"","gridAreaRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListArea").val()+"");
		
		return false;
	
	});
	
	//Click Format
	$(".listFormat").live("click",function(){
		
		//get value checked radio button
		var SqMSort  = $("input[name=radioFormatRentSqM]:checked").val();
		var NetSalesSqMSort  =$("input[name=radioFormatSalesSqM]:checked").val(); 
		var RentNetSalesSort  = $("input[name=radioFormatRentNetSales]:checked").val();  
		
		//Embeded paramLocationTypeList
		$("#sesParamListFormat").remove();
		$("body").append("<input type='hidden' id='sesParamListFormat' class='sesParam' value='"+$(this).text()+"'>");
		
		
		$(".listFormat").css({'background':''});
		
		$(".listFormat").attr('s','');
		$(".listFormat#"+this.id).css({'background':'#DBEEF3'}).attr('s','selected');
		
		callSubGrid("Format",""+SqMSort+"","gridFormatRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListFormat").val()+"");
		callSubGrid("Format",""+NetSalesSqMSort+"","gridFormatSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListFormat").val()+"");
		callSubGrid("Format",""+RentNetSalesSort+"","gridFormatRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListFormat").val()+"");
		
		return false;
	});
	
	
	
	
	
	//Event Click Tabs
	$("a[href=#tabs-2]").click(function(){
		setTimeout(function(){
			
			//$(".boxEvent#boxlocationType ul li:eq(0) a").trigger("click");
			//$(".boxEvent#boxLandlordGroup ul li:eq(0) a").trigger("click");
			//console.log($(".boxEvent#boxlocationType ul li:eq(0) .listLocationType").text());
		},2000);
		/*
		sesParamYear
		sesParamMonthFrom
		sesParamMonthTo
		sesParamBrand
		sesParamCountry
		sesParamRegion
		sesParamProvince
		*/
		
		//locationType("top","rentPerSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"","stand alone");
		//locationType("bottom","rentPerSqM","2008","1","12","stand alone");
		
	});
	
	
	
	//#################Management Rent Page End #######################//
	
	
	
});