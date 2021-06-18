$(function(){
    window.onload = (e) => {
        window.addEventListener("message", (event) => {
            var item = event.data;
            if(item !== undefined && item.type === "ui") {
                if (item.display) {
                    $('#container').show();
                    $('#aids')[0].play();
                } else{
                    $('#container').hide();
                    $('#aids')[0].pause();
                }
            }
			if(item !== undefined && item.type === "gerd") {
                if (item.display) {
                    
                    $('#aids2')[0].play();
                } else{
                   
                    $('#aids2')[0].pause();
                }
            }
        })
    }
})
