$(document).ready(function(){
	
	$("#food1").click(function(){
		if($("#foodDetail1").css("display") == "none"){   
	        jQuery('#foodDetail1').show();  
	    } else {  
	        jQuery('#foodDetail1').hide();  
	    }
	});
	$("#food2").click(function(){
		if($("#foodDetail2").css("display") == "none"){   
			jQuery('#foodDetail2').show();  
		} else {  
			jQuery('#foodDetail2').hide();  
		}
	});
	$("#food3").click(function(){
		if($("#foodDetail3").css("display") == "none"){   
			jQuery('#foodDetail3').show();  
		} else {  
			jQuery('#foodDetail3').hide();  
		}
	});
	
});
