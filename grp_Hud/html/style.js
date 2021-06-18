$(document).ready(function(){
    window.addEventListener('message', function(event) {
        var data = event.data;
		if (data.show == false){
			if (data.posi == "bottom"){
				$("body").show();
				//$(".wave:after").css("top", (40-data.health) + "%");
				soMany = 50-data.health;
				document.querySelectorAll('.wave')[0].style.setProperty("--top", `${soMany}%`);
				
				armorJS = 50 - data.armor;
				document.querySelectorAll('.wave2')[0].style.setProperty("--top", `${armorJS}%`);

				if (data.muted) {
					$('.mic1').removeClass('notActive');
					$('.mic1').removeClass('muted');
					$('.mic2').addClass('hide');
					$('.mic1').removeClass('hide');
				} else if (!data.talking) {
					$('.mic1').addClass('hide');
					$('.mic2').removeClass('hide');
				} else {
					$('.mic1').addClass('muted');
					$('.mic1').removeClass('notActive');
					$('.mic2').addClass('hide');
					$('.mic1').removeClass('hide');
				}

                if (data.range == '3.0') {
                    document.querySelectorAll('.wave3')[0].style.setProperty("--top", `30%`);
                } else if (data.range == '8.0') {
                    document.querySelectorAll('.wave3')[0].style.setProperty("--top", `0%`);
                } else if (data.range == '15.0') {
                    document.querySelectorAll('.wave3')[0].style.setProperty("--top", `-50%`);
                } 
			} else {		
				$(".main").css("top", "15vh");
				$(".main").css("right", "5vw");
				$("body").show();
				soMany = 50-data.health;
				document.querySelectorAll('.wave')[0].style.setProperty("--top", `${soMany}%`);
				
				armorJS = 50 - data.armor;
				document.querySelectorAll('.wave2')[0].style.setProperty("--top", `${armorJS}%`);

				if (data.muted) {
					$('.mic1').removeClass('notActive');
					$('.mic1').removeClass('muted');
					$('.mic2').addClass('hide');
					$('.mic1').removeClass('hide');
				} else if (!data.talking) {
					$('.mic1').addClass('hide');
					$('.mic2').removeClass('hide');
				} else {
					$('.mic1').addClass('muted');
					$('.mic1').removeClass('notActive');
					$('.mic2').addClass('hide');
					$('.mic1').removeClass('hide');
				}

                if (data.range == '3.0') {
                    document.querySelectorAll('.wave3')[0].style.setProperty("--top", `30%`);
                } else if (data.range == '8.0') {
                    document.querySelectorAll('.wave3')[0].style.setProperty("--top", `0%`);
                } else if (data.range == '15.0') {
                    document.querySelectorAll('.wave3')[0].style.setProperty("--top", `-50%`);
                } 
			}
		} else {
			 $("body").hide();
		}
    });
});