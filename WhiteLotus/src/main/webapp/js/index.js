//IT21237904
$(window).scroll(function () {
    $scroll = $(window).scrollTop();
    
    if ($scroll > 0) {
        $('.navbar').css('background','black');
    }else{
		$('.navbar').css('background','transparent');
	} 
});
