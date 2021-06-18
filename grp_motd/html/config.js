var config = {
    HeaderText: 'German Roleplay - Ankündigung und Neues!',                                       /* Top Header Text */
    WelcomeBackText: 'Willkommen,',                                                /* Welcome Back Text */
    CloseText: 'Schliessen[ESC]',                                                         /* Close Button Text */
    CloseTextSub: 'Die Ankündigungen schliessen',                               /* Close Button Sub Text */
    items: [
        {
            title: 'Der Mclaren 720s!',                             
            sub: 'NEU eingetroffen: Der mclaren 720s. Für die Echten !',                         /* Button Sub Text */
            icon: 'fab fa-artstation',                                                /* Button Font Awesome Icon */
            url: 'https://grp.gg/neues.html',                                           /* URL to Display */
            default: true,                                                      /* Is this the default page? */
        },
        {
            title: 'Unser Shop',
            sub: 'Falls Du uns Unterstützen möchtest',
            icon: 'fas fa-shopping-basket',
            url: 'https://shop.grp.gg/',                                       
        },
        {
            title: 'Der BMW M4',                              
            sub: '300KM/H, krasses Design & alle Blicke garantiert ! Der neue BMW M4 !',  
            icon: 'fas fa-car',
            url: 'https://grp.gg/neues2.html',                                       
        },
        {
            title: 'Die Regeln',
            sub: 'Hier findest Du die Server-Regeln.',
            icon: 'fas fa-book',
            url: 'https://grp.gg/regelwerk.html',                                       
        },
    ],
}

$(document).keyup(function (e) {
  if (e.keyCode === 27) {

    $.post('https://grp_motd/close', JSON.stringify({}));
    $("#pu392").fadeOut("slow", function () {
      $("#pu392").html("").fadeIn();
    });
    $("#activeunits").fadeOut("slow", function () {

      $("#activeunits").html("").fadeIn();
    });
    UIActive = false;

  }


});