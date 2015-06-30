$(document).ready(function(){  
    $('.main-menu ul  li span').click(function(){
    	$(".main-menu ul  li span").not(this).removeClass('main-menu-toggle');  
    	$(".main-menu ul  li span").not(this).next(".sub-menu").slideUp();
        $(this).toggleClass('main-menu-toggle');   
        $(this).next(".sub-menu").slideToggle();   
    });

    $(function () {
		$(".sub-menu > li.active").parent().slideDown().css("display","block");
		$(".sub-menu > li.active").parent().parent().find("span").addClass('main-menu-toggle');
	});

	$('.main-service').hover(
		function(){ 
			$(this).find(".main-more-info").stop().addClass("arrow-animate");
		},
		function(){ 
		$(this).find(".main-more-info").stop().removeClass("arrow-animate");  
	});

	$(".main-white-block .main-more-info ul li a").mouseenter(function(){
      $(this).parent("li").css('color','black');
    }).mouseleave(function(){
      $(".main-white-block").find("li").css('color','white').css('color','white');
    });

    $(".nav > li").mouseenter(function(){
      $(this).addClass("open");
    }).mouseleave(function(){
      $(this).removeClass("open");
    });

    $(".item").each(function(){
		if($(this).next(".childrens").length){
			$(this).find(".admin_remove").remove();
		}
	});
    /*fancybox*/
/*	$(function () {
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
	});*/
	/*fancybox end*/
/*    $('#file').change(function(){
		$('#file').each(function() {
			var name = this.value;
			reWin = /.*\\(.*)/;
			var fileTitle = name.replace(reWin, "$1");
			reUnix = /.*\/(.*)/;
			fileTitle = fileTitle.replace(reUnix, "$1");
			$('#name').html(fileTitle);
		});	
	});*/
	$(function () {
		$(".alert-errors").closest(".authorization").find(".logon").addClass("error");
		$(".alert-errors").closest(".authorization").find("#session_login.logon").val("Неправильный логин/пароль")
	});
});