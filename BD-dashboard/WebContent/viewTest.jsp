<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script src="js/jquery.min.js"></script>
<script>
$(document).ready(function(){
	

var clickNetSalseList=function(){
	var province="จังหวัด ภาษาไทย1234";
	alert(province+"before send to ajax");
	$.ajax({
		url:'serviceTest.jsp',
		type:'GET',
		dataType:'HTML',
		data:{'paramProvince':province},
		success:function(data){
			alert("data"+data);
		}
	});
};//end function clickNetSales
	$("#bt1").click(function(){
		clickNetSalseList();
	});
	
});
</script>
<button id="bt1">ทดสอบ</button>
<input type="radio" checked name="nong">
<input type="radio" name="nong">