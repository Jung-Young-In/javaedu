$(document).ready(function(){
	$("#bmicall").click(function(){
		var a = $("#ke").val();
		var b = $("#mo").val();
		var c = a / 100;
		var r = b / (c * c);
		var bmi = r.toFixed(2);
		
		$("#bmiResult").html(bmi);
		
		if(bmi<18.5){
			$("#bmiContent").attr('value',"저체중");
			$("#result").attr('value',"체질량지수는 " + bmi + "입니다." + " 밥을 많이 드세요.!!!");
		}else if(18.5 <= bmi && bmi < 22.9){
			$("#bmiContent").attr('value',"정상");
			$("#result").attr('value',"체질량지수는 " + bmi + "입니다." + " 정상이네요~ 아주 잘했어요.!!!");
		}else if(23 <= bmi && bmi < 24.9){
			$("#bmiContent").attr('value',"과체중");
			$("#result").attr('value',"체질량지수는 " + bmi + "입니다." + " 밥좀 조금만 드세요.!!!");
		}else if(25<= bmi && bmi < 29.9){
			$("#bmiContent").attr('value',"경도비만");
			$("#result").attr('value',"체질량지수는 " + bmi + "입니다." + " 운동좀 합시다.!!!");
		}else if(30 <= bmi){
			$("#bmiContent").attr('value',"고도비만");
			$("#result").attr('value',"체질량지수는 " + bmi + "입니다." + " 아주 심각해요 조심하시죠?.!!!");
		}
		
	});
});