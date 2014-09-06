
	$(document).ready(function(){

//load css by ajax
$.ajax({
            url:"styles/dashboard_rent.css",
            dataType:"html",
            success:function(data){
				$("style.loadCss").remove();
                $("head").append("<style class='loadCss'>" + data + "</style>");
                //loading complete code here
            }
        });
//-----------------------

		//callSubGrid 2 Start
		var callSubGrid =function(paramRequest,paramSort,paramLocationTypeName,paramYear,paramMonthFrom,paramMonthTo,paramLocationTypeList){
			//alert("callSubGrid rent");
			$.ajax({
				url:'Model/rentService.jsp',
				type:'post',
				dataType:'json',
				//locationType,top,rentPerSqM
				data:{'paramRequest':paramRequest,'paramSort':paramSort,'paramLocationTypeName':paramLocationTypeName,'paramYear':paramYear,'paramMonthFrom':paramMonthFrom,'paramMonthTo':paramMonthTo,'paramLocationTypeList':paramLocationTypeList},
				success:function(data){
				
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
				
			});
			//Set number or strint text
			$(".textR").addClass("textR");
		};
		
		//callSubGrid 2 End
		//Event Click List 
		/*
		$(".listDetail").live("click",function(){
			alert(this.id);
			return false;
		});
		*/
		
		//Default Start Active
		setTimeout(function(){
			
			//listLocationType
			$.ajax({
				url:'Model/rentService.jsp',
				type:'POST',
				dataType:'html',
				data:{'paramRequest':'listLocationType','paramCountry':$("#sesParamCountry").val()},
				success:function(data){
					//alert(data);
					
					//var str="Visit Microsoft!";
					//var n=data.replace('"','\"'); 
					//alert(n);
					//<ul><li><a href="#" class="listLocationType" id="locationTypeId0">community mall</li><li><a href="#" class="listLocationType" id="locationTypeId1">modern trade</li><li><a href="#" class="listLocationType" id="locationTypeId2">stand alone</li><li><a href="#" class="listLocationType" id="locationTypeId3">ปั้มน้ำมัน</li><li><a href="#" class="listLocationType" id="locationTypeId4">ห้างสรรพสินค้า</li><li><a href="#" class="listLocationType" id="locationTypeId5">โรงพยาบาล</li></ul>
					$("#boxlocationType").html(data);
					//$("#boxlocationType").html("<ul><li><a href=\"#\" class=\"listLocationType\" id=\"locationTypeId0\">community mall</li><li><a href=\"#\" class=\"listLocationType\" id=\"locationTypeId1\">modern trade</li><li><a href=\"#\" class=\"listLocationType\" id=\"locationTypeId2\">stand alone</li><li><a href=\"#\" class=\"listLocationType\" id=\"locationTypeId3\">ปั้มน้ำมัน</li><li><a href=\"#\" class=\"listLocationType\" id=\"locationTypeId4\">ห้างสรรพสินค้า</li><li><a href=\"#\" class=\"listLocationType" id=\"locationTypeId5\">โรงพยาบาล</li></ul>");
					//Run Default
					$(".boxEvent#boxlocationType ul li:eq(0) a").trigger("click");
					//$(".boxEvent#boxlocationType ul li:eq(0) a").trigger("click");
					
					
				}
			});
			
			//listLandlordGroup
			$.ajax({
				url:'Model/rentService.jsp',
				type:'POST',
				dataType:'html',
				data:{'paramRequest':'listLandlordGroup','paramCountry':$("#sesParamCountry").val()},
				success:function(data){
					//alert(data);
					$("#boxLandlordGroup").html(data);
					//Run Default
					$(".boxEvent#boxLandlordGroup ul li:eq(0) a").trigger("click");
				}
			});
			
			//listBrand
			$.ajax({
				url:'Model/rentService.jsp',
				type:'POST',
				dataType:'html',
				data:{'paramRequest':'listBrand','paramCountry':$("#sesParamCountry").val()},
				success:function(data){
					//alert(data);
					$("#boxBrand").html(data);
					//Run Default
					$(".boxEvent#boxBrand ul li:eq(0) a").trigger("click");
				}
			});
			
			//listRegion
			$.ajax({
				url:'Model/rentService.jsp',
				type:'POST',
				dataType:'html',
				data:{'paramRequest':'listRegion','paramCountry':$("#sesParamCountry").val()},
				success:function(data){
					//alert(data);
					$("#boxRegion").html(data);
					//Run Default
					$(".boxEvent#boxRegion ul li:eq(0) a").trigger("click");
				}
			});
			
			
			
			
			
			
			//listArea
			$.ajax({
				url:'Model/rentService.jsp',
				type:'POST',
				dataType:'html',
				data:{'paramRequest':'listArea','paramCountry':$("#sesParamCountry").val()},
				success:function(data){
					//alert(data);
					$("#boxArea").html(data);
					//Run Default
					$(".boxEvent#boxArea ul li:eq(0) a").trigger("click");
				}
			});
			
			
			//listFormat
			$.ajax({
				url:'Model/rentService.jsp',
				type:'POST',
				dataType:'html',
				data:{'paramRequest':'listFormat','paramCountry':$("#sesParamCountry").val()},
				success:function(data){
					//alert(data);
					$("#boxFormat").html(data);
					//Run Default
					$(".boxEvent#boxFormat ul li:eq(0) a").trigger("click");
				}
			});
			
			
			//Click Submmit For Expring
			$.ajax({
				url:'Model/rentService.jsp',
				type:'POST',
				dataType:'json',
				asnyc:false,
				//'รพ.นวมินทร์ 9','Thailand','ภาคกลาง','กรุงเทพมหานคร','ALL'
				data:{'paramRequest':'paramExpiring',
					'paramBrand':$("#sesParamBrand").val(),
					'paramCountry':$("#sesParamCountry").val(),
					'paramRegion':$("#sesParamRegion").val(),
					'paramProvince':$("#sesParamProvince").val(),
					'paramArea':$("#sesParamArea").val()},
				success:function(data){
					//alert(data);
					//console.log(data);
					//alert(data);
					
					var dataExpring="";
					var i=0;
					dataExpring+="[";
					
					$.each(data,function(index,EntryIndex){
						
						if(i==0){
							dataExpring+="{";
						}else{
							dataExpring+=",{";
						}
						
							dataExpring+="\"Field1\":\""+EntryIndex[0]+"\",";
							dataExpring+="\"Field2\":\""+EntryIndex[1]+"\",";
							var Rent = parseFloat(EntryIndex[2]).toFixed(2);
							var SqM = parseFloat(EntryIndex[3]).toFixed(2);
							var RentSqm = parseFloat(EntryIndex[4]).toFixed(2);
							
							dataExpring+="\"Field3\":\"<div class='textR'>"+addCommas(Rent)+"</div>\",";
							dataExpring+="\"Field4\":\"<div class='textR'>"+addCommas(SqM)+"</div>\",";
							dataExpring+="\"Field5\":\"<div class='textR'>"+addCommas(RentSqm)+"</div>\",";
							dataExpring+="\"Field6\":\"<center><div class='sparkLine'>"+EntryIndex[5]+"</div></center>\",";
							dataExpring+="\"Field7\":\"<center><div class='sparkLine'>"+EntryIndex[6]+"</div></center>\"";

							dataExpring+="}";
						
						i++;
						
					});
						
					dataExpring+="]";
					var objDataExpring=eval("("+dataExpring+")");
					
					//console.log(objDataExpring);
					Expring(objDataExpring);
					
					
				}
			});
			
			
			
			//click 11radioLocationTypeRentSqM button start
			$("input.radioLocationTypeRentSqM").live("click",function(){
				//alert("["+$(this).val()+"]");
				if($(this).val()=="top"){
				//alert("top");
				callSubGrid("locationType","top","gridRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamLocationTypeList").val()+"");
				}else{
				//alert("bottom");
				callSubGrid("locationType","bottom","gridRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamLocationTypeList").val()+"");
				}
				});
			//click 11radioLocationTypeRentSqM button end
			
			
			//click 12radioLocationTypeNetSalesSqM button start
			$("input.radioLocationTypeNetSalesSqM").live("click",function(){
				//alert("["+$(this).val()+"]");
				if($(this).val()=="top"){
				
				callSubGrid("locationType","top","gridNetSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamLocationTypeList").val()+"");
				}else{
				
				callSubGrid("locationType","bottom","gridNetSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamLocationTypeList").val()+"");
				}
			});
			//click 12radioLocationTypeNetSalesSqM button end
			
			//click 13radioLocationTypeRentNetSales button Start
			$("input.radioLocationTypeRentNetSales").live("click",function(){
				//alert("["+$(this).val()+"]");
				if($(this).val()=="top"){
				
				callSubGrid("locationType","top","gridRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamLocationTypeList").val()+"");
				}else{
				
				callSubGrid("locationType","bottom","gridRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamLocationTypeList").val()+"");
				}
			});
			//click 13radioLocationTypeRentNetSales button End
			
			
			//click 21radioLandlordGroupRentSqM button Start
			
			$("input.radioLandlordGroupRentSqM").live("click",function(){
				//alert("["+$(this).val()+"]");
				if($(this).val()=="top"){
				
				callSubGrid("landlordGroup","top","gridLandlordGroupRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListLandlordGroup").val()+"");
				}else{
				
				callSubGrid("landlordGroup","bottom","gridLandlordGroupRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListLandlordGroup").val()+"");
				}
			});
			
			//click 21radioLandlordGroupRentSqM button End
			
			
			//click 22 radioLandlordGroupNetSalesSqM button Start
			
			$("input.radioLandlordGroupNetSalesSqM").live("click",function(){
				//alert("["+$(this).val()+"]");
				if($(this).val()=="top"){
				
				callSubGrid("landlordGroup","top","gridLandlordGroupNetSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListLandlordGroup").val()+"");
				}else{
				
				callSubGrid("landlordGroup","bottom","gridLandlordGroupNetSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListLandlordGroup").val()+"");
				}
			});
			
			//click 22 radioLandlordGroupNetSalesSqM button End
			
			
			//click 23 radioLandlordGroupRentNetSales button Start
			
			$("input.radioLandlordGroupRentNetSales").live("click",function(){
				//alert("["+$(this).val()+"]");
				if($(this).val()=="top"){
				
				callSubGrid("landlordGroup","top","gridLandlordGroupRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListLandlordGroup").val()+"");
				}else{
				
				callSubGrid("landlordGroup","bottom","gridLandlordGroupRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListLandlordGroup").val()+"");
				}
			});
			
			//click 23 radioLandlordGroupRentNetSales button End
			
			
			
			//click 31 radioBrandRentSqM button Start
			$("input.radioBrandRentSqM").live("click",function(){
				//alert("["+$(this).val()+"]");
				if($(this).val()=="top"){
				
				callSubGrid("Brand","top","gridBrandRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListBrand").val()+"");
				}else{
				
				callSubGrid("Brand","bottom","gridBrandRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListBrand").val()+"");
				}
			});
			//click 31 radioBrandRentSqM button End
			
			//click 32 radioBrandNetSalesSqM button Start
			$("input.radioBrandNetSalesSqM").live("click",function(){
				//alert("["+$(this).val()+"]");
				if($(this).val()=="top"){
				
				callSubGrid("Brand","top","gridBrandNetSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListBrand").val()+"");
				}else{
				
				callSubGrid("Brand","bottom","gridBrandNetSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListBrand").val()+"");
				}
			});
			//click 32 radioBrandNetSalesSqM button End
			
			//click 33 radioBrandRentNetSales button Start
			$("input.radioBrandRentNetSales").live("click",function(){
				//alert("["+$(this).val()+"]");
				if($(this).val()=="top"){
				
				callSubGrid("Brand","top","gridBrandRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListBrand").val()+"");
				}else{
				
				callSubGrid("Brand","bottom","gridBrandRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListBrand").val()+"");
				}
			});
			//click 33 radioBrandRentNetSales button End
			
			
			//click 41 radioRegionProvinceRentSqM button Start
			$("input.radioRegionProvinceRentSqM").live("click",function(){
				//alert("["+$(this).val()+"]");
				var request="";
				var locationTypeList="";
				if($("#sesParamListProvince").val()){
					//alert("Province");
					request="Province";
					locationTypeList="#sesParamListProvince";
				}else{
					//alert("Region");
					request="Region";
					locationTypeList="#sesParamListRegion";
				}
				
				if($(this).val()=="top"){
				
				callSubGrid(""+request+"","top","gridRegionProvinceRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$(""+locationTypeList+"").val()+"");
				}else{
				
				callSubGrid(""+request+"","bottom","gridRegionProvinceRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$(""+locationTypeList+"").val()+"");
				}
			});
			//click 41 radioRegionProvinceRentSqM button End
			
			//click 42 radioRegionProvinceNetSalesSqM button Start
			$("input.radioRegionProvinceNetSalesSqM").live("click",function(){
				//alert("["+$(this).val()+"]");
				var request="";
				var locationTypeList="";
				if($("#sesParamListProvince").val()){
					//alert("Province");
					request="Province";
					locationTypeList="#sesParamListProvince";
				}else{
					//alert("Region");
					request="Region";
					locationTypeList="#sesParamListRegion";
				}
				
				if($(this).val()=="top"){
				//alert("top");
				callSubGrid(""+request+"","top","gridRegionProvinceNetSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$(""+locationTypeList+"").val()+"");
				}else{
				//alert("bottom");
				callSubGrid(""+request+"","bottom","gridRegionProvinceNetSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$(""+locationTypeList+"").val()+"");
				}
			});
			//click 42 radioRegionProvinceNetSalesSqM button End
			
			//click 43 radioRegionProvinceRentNetSales button Start
			$("input.radioRegionProvinceRentNetSales").live("click",function(){
				//alert("["+$(this).val()+"]");
				var request="";
				var locationTypeList="";
				if($("#sesParamListProvince").val()){
					//alert("Province");
					request="Province";
					locationTypeList="#sesParamListProvince";
				}else{
					//alert("Region");
					request="Region";
					locationTypeList="#sesParamListRegion";
				}
				
				if($(this).val()=="top"){
				
				callSubGrid(""+request+"","top","gridRegionProvinceRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$(""+locationTypeList+"").val()+"");
				}else{
				
				callSubGrid(""+request+"","bottom","gridRegionProvinceRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$(""+locationTypeList+"").val()+"");
				}
			});
			//click 43 radioRegionProvinceRentNetSales button End
			
			
			
			//click 51 radioAreaRentSqM button Start
			$("input.radioAreaRentSqM").live("click",function(){
				//alert("["+$(this).val()+"]");
				if($(this).val()=="top"){
				
				callSubGrid("Area","top","gridAreaRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListArea").val()+"");
				}else{
				
				callSubGrid("Area","bottom","gridAreaRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListArea").val()+"");
				}
			});
			//click 51 radioAreaRentSqM button End
			
			//click 52 radioAreaNetSalesSqM button Start
			$("input.radioAreaNetSalesSqM").live("click",function(){
				//alert("["+$(this).val()+"]");
				if($(this).val()=="top"){
				
				callSubGrid("Area","top","gridAreaNetSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListArea").val()+"");
				}else{
				
				callSubGrid("Area","bottom","gridAreaNetSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListArea").val()+"");
				}
			});
			//click 52 radioAreaNetSalesSqM button End
			
			//click 53 radioAreaRentNetSales button Start
			$("input.radioAreaRentNetSales").live("click",function(){
				//alert("["+$(this).val()+"]");
				if($(this).val()=="top"){
				
				callSubGrid("Area","top","gridAreaRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListArea").val()+"");
				}else{
				
				callSubGrid("Area","bottom","gridAreaRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListArea").val()+"");
				}
			});
			//click 53 radioAreaRentNetSales button End
			
			
			//click 61 radioFormatRentSqM button Start
			$("input.radioFormatRentSqM").live("click",function(){
				//alert("["+$(this).val()+"]");
				if($(this).val()=="top"){
				
				callSubGrid("Format","top","gridFormatRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListFormat").val()+"");
				}else{
				
				callSubGrid("Format","bottom","gridFormatRentSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListFormat").val()+"");
				}
			});
			//click 61 radioFormatRentSqM button End
			
			//click 62 radioFormatSalesSqM button Start
			$("input.radioFormatSalesSqM").live("click",function(){
				//alert("["+$(this).val()+"]");
				if($(this).val()=="top"){
				
				callSubGrid("Format","top","gridFormatSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListFormat").val()+"");
				}else{
				
				callSubGrid("Format","bottom","gridFormatSalesSqM",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListFormat").val()+"");
				}
			});
			//click 62 radioFormatSalesSqM button End
			
			//click 63 radioFormatRentNetSales button Start
			$("input.radioFormatRentNetSales").live("click",function(){
				//alert("["+$(this).val()+"]");
				if($(this).val()=="top"){
				
				callSubGrid("Format","top","gridFormatRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListFormat").val()+"");
				}else{
				
				callSubGrid("Format","bottom","gridFormatRentNetSales",""+$("#sesParamYear").val()+"",""+$("#sesParamMonthFrom").val()+"",""+$("#sesParamMonthTo").val()+"",""+$("#sesParamListFormat").val()+"");
				}
			});
			//click 63 radioFormatRentNetSales button End
			
			
			
			
			
			
			
		},1000);
	});

