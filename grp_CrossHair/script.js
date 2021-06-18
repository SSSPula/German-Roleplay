$(function(){
  
  xHair = {}
  hitMarker = {}

  xHair.show = function(data){
    $('.crosshair-wrapper').fadeIn(50);
    return;
  };

  hitMarker.show = function(color){
    var tick = document.getElementById('tick');
    tick.volume = 0.6;
    tick.play();
    $('.hit-marker-wrapper').show(0);
    $('.hit-marker').each(function(i) {
      $(this).css('transition', 'all 80ms ease-in-out')
      $(this).addClass('extract');
      if (color === 'white') {
        $(this).css('background-color', 'rgba(205, 205, 205, 0.9)')
      } else if (coor === 'grey') {
        $(this).css('background-color', 'rgba(110, 110, 110, 0.9)')
      }
    })
    return;
  }
  
  xHair.hide = function() {
    $(".crosshair-wrapper").fadeOut(200);
    return;
  };
  
  hitMarker.hide = function(data){
    $('.hit-marker-wrapper').fadeOut(200);
    $('.hit-marker').each(function(i) {
      $(this).css('transition', 'all 120ms ease-in-out')
      $(this).css('background-color', 'rgba(205, 205, 205, 0.9)')
      $(this).css('background-color', 'rgba(205, 205, 205, 0.9)')
      $(this).removeClass('extract');
      $('.hit-marker-wrapper').css('transform', 'scale(1,1)')
    })
    return;
  }

  hitMarker.showKillMarker = function(color, scaleUp){
      console.log('kill marker')
    $('.hit-marker').each(function(i) {
      var $killMarker = $(this).clone().appendTo( ".kill-marker-wrapper" )
      $killMarker.css('background-color', 'rgba(235, 50, 50, 0.9)')
      $killMarker.css('transition', 'all 80ms ease-in-out')
      $killMarker.addClass('extract');
    })
    setTimeout(function(){ 
      $('.kill-marker-wrapper .hit-marker').each(function(i) {
        $(this).remove();
      })
    }, 700);
    return;
  }

  hitMarker.hide();
  xHair.hide();
  window.addEventListener('message', function(event) {
    var item = event.data
    switch(item.display) {
      case 'crosshairShow':
				xHair.show(item.data);
      break;
      case 'crosshairHide':
				xHair.hide(item.data);
      break;
      case 'hitMarkerShow':
        hitMarker.show(item.color);
      break;
      case 'hitMarkerHide':
        hitMarker.hide(item.data);
      break;
      case 'hitMarkerChangeColor':
        hitMarker.showKillMarker(item.color, item.scaleUp);
      break;
    }
  });
});