$(document).ready(function(){  
    $('.main-menu ul  li span').click(function(){
    	$(".main-menu ul  li span").not(this).removeClass('main-menu-toggle');  
    	$(".main-menu ul  li span").not(this).next(".sub-menu").slideUp();
        $(this).toggleClass('main-menu-toggle');   
        $(this).next(".sub-menu").slideToggle();   
    });
    $(function () {
		$(".sub-menu > li > .active").parent().parent().slideDown().css("display","block");
		$(".sub-menu > li > .active").parent().parent().parent().find("span").addClass('main-menu-toggle');
	});
	$(".main-white-block .main-more-info ul li a").mouseenter(function(){
      $(this).parent("li").css('color','#4d4d4d');
    }).mouseleave(function(){
      $(".main-white-block").find("li").css('color','white');
    });
    $(".services-inner-block ul li a").mouseenter(function(){
      $(this).parent("li").css('color','#4d4d4d').css('padding','2px').css('padding-left','0px').css('padding-top','0px').css('padding-bottom','4px');
    }).mouseleave(function(){
      $(".services-inner-block").find("li").css('color','#9a9a9a').css('padding','1px').css('padding-left','0px').css('padding-top','0px').css('padding-bottom','4px');
    });
    $(".main-white-block , .change").mouseenter(function(){
    	$(this).children().next(".main-more-info").stop().fadeIn("slow");
    	$(this).children().children().next(".main-portfolio-hover , .opacity-block").stop().fadeIn("slow");
    }).mouseleave(function(){
    	$(this).children().next(".main-more-info").stop().fadeOut('fast');
    	$(this).children().children().next(".main-portfolio-hover , .opacity-block").stop().fadeOut("fast");
    });
    /*fancybox*/
	$(function () {
		$(".fancybox").fancybox({
			prevEffect : 'none',
			nextEffect : 'none',
		    beforeShow: function () {
		        $("#all, #footer").addClass("blured");
		    },
		    afterClose: function () {
		        $("#all, #footer").removeClass("blured");
		    }
		});
	});
	/*fancybox end*/
    $('#file').change(function(){
		$('#file').each(function() {
			var name = this.value;
			reWin = /.*\\(.*)/;
			var fileTitle = name.replace(reWin, "$1");
			reUnix = /.*\/(.*)/;
			fileTitle = fileTitle.replace(reUnix, "$1");
			$('#name').html(fileTitle);
		});	
	});
});