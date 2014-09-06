
	$(document).ready(function(){
		
		$(".locationType").click(function(){
			alert(this.id);
		});
		
		//Default Start Active
		setTimeout(function(){
			$.ajax({
				url:'Model/rentService.jsp'
			});
		},1000);
	});
