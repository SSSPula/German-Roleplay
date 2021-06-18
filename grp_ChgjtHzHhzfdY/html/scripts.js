function closeMainQG() {
	$("body").css("display", "none");
}
function openCarryMenuQG() {
	$("body").css("display", "block");
}

$(".closetypemenu").click(function(){
    $.post('http://grp_ChgjtHzHhzfdY/closetypeselect', JSON.stringify({}));
});


$(document).keyup(function (e) {
  if (e.keyCode === 27) {

    $.post('http://grp_ChgjtHzHhzfdY/closetypeselect', JSON.stringify({}));
    

  }


});

window.addEventListener('message', function (event) {

	var item = event.data;
	
	if (item.message == "showcarryrequestreceiever") {
		$('#carryrequester').hide();
		$('#carryed').hide();
		$('#carrytype').hide();
		$('#carrier').hide();
		$('#carryreceiever').show();
		openCarryMenuQG();
	}	
	
	if (item.message == "carrier") {
		$('#carryreceiever').hide();
		$('#carryed').hide();
		$('#carrytype').hide();
		$('#carrier').show();
		$('#carryrequester').hide();
	}	
	
	if (item.message == "showcarryrequestrequester") {
		$('#carryreceiever').hide();
		$('#carryed').hide();
		$('#carrytype').hide();
		$('#carrier').hide();
		$('#carryrequester').show();
		document.getElementById("secondsremainingrequest").innerHTML = item.remainingseconds;
		openCarryMenuQG();
	}		
	
	if (item.message == "showcarryed") {
		$('#carryreceiever').hide();
		$('#carryrequester').hide();
		$('#carrier').hide();
		$('#carrytype').hide();
		$('#carryed').show();
		openCarryMenuQG();
	}	

	if (item.message == "showtypes") {
		$('#carryreceiever').hide();
		$('#carryrequester').hide();
		$('#carryed').hide();
		$('#carrier').hide();
		$('#carrytype').show();
		openCarryMenuQG();
	}			
	
	if (item.message == "hide") {
		closeMainQG();
		$('#carryreceiever').hide();
		$('#carryrequester').hide();
		$('#carrytype').hide();
		$('#carrier').hide();
		$('#carryed').hide();
	}
	
	if (item.message == "hide2") {
		closeMainQG();
		$('#carryreceiever').hide();
		$('#carryrequester').hide();
		$('#carrytype').hide();
		$('#carryed').hide();
	}
	
});

$(".carry1select").click(function () {
	closeMainQG();
	$('#carryreceiever').hide();
	$('#carryrequester').hide();
	$('#carryed').hide();
	$('#carrier').hide();
	$('#carrytype').hide();
	$.post('http://grp_ChgjtHzHhzfdY/selecttype', JSON.stringify({
		carrytype: "type1"
	}));
});

$(".carry2select").click(function () {
	closeMainQG();
	$('#carryreceiever').hide();
	$('#carryrequester').hide();
	$('#carryed').hide();
	$('#carrier').hide();
	$('#carrytype').hide();
	$.post('http://grp_ChgjtHzHhzfdY/selecttype', JSON.stringify({
		carrytype: "type2"
	}));
});

$(".carry3select").click(function () {
	closeMainQG();
	$('#carryreceiever').hide();
	$('#carryrequester').hide();
	$('#carryed').hide();
	$('#carrytype').hide();
	$('#carrier').hide();
	$.post('http://grp_ChgjtHzHhzfdY/selecttype', JSON.stringify({
		carrytype: "type3"
	}));
});