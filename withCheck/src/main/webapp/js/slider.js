$(function(){

	function moveSlider(index){
		// console.log(index);

		// 4-1. 슬라이더 이동
		var willMoveLeft = -(index * 800);
		console.log(willMoveLeft);
		
		$(".cal_wrap").animate({left : willMoveLeft},"slow");

		// 4-2. css에 정의한 임의의 클래스 'active' 를 줬다 뺐다
		$('.control_btn[data-index=' + index + ']').addClass('active');
			// control_btn 의 속성중 data-index 가 뭐뭐 인 control_btn 은 클래스명 active를 부여해 주겠다.
		$('.control_btn[data-index!=' + index + ']').removeClass('active');
			// control_btn 의 속성중 data-index 가 뭐뭐 가 아닌 control_btn 은 클래스명 active를 제거해 주겠다.

	}


	$('.cal').each(function(index){
		$(this).attr("data-index",index);
		$('.control_wrap').append('<div class="control_btn"></div>');
	});
	
	var length=$('.cal').length;

	$('.cal_wrap').css('width',length*800);
	
	$('.control_btn').each(function(index){
		
		$(this).attr('data-index',index);
		
	}).click(function(){
		var index = $(this).attr('data-index');
		moveSlider(index);

	});

	moveSlider(0);

		
});