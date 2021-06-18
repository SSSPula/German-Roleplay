$(document).ready(function () {
    var iframe = $("#iframe")[0];
    var $tabContainer = $("#tab-container");
    // Show or hide the page
    function SHOW_HIDE(bool) {
        if (bool) {
            $tabContainer.show();
        } else {
            $tabContainer.hide();
            window.blur() // unfocus the window
        }
    }
    SHOW_HIDE(false); // hide the tablet initial
    // Listens for NUI messages from Lua 
    window.addEventListener('message', function (event) {
        var item = event.data;
        if (item.showtab) {
            SHOW_HIDE(true)
        } // lua requested show
        else if (item.hidetab) {
            SHOW_HIDE()
        } // lua requested hide
    });
    // When pressed ESC dispatch escape request
    document.addEventListener('keyup', function (data) {
        if (data.which == 27) {
            SHOW_HIDE(); // hide ui
            $.post(`http://${GetParentResourceName()}/tablet-bus`, JSON.stringify({
                hide: true
            })) // tell lua to unfocus
        }
    });
    // When clicked the dot
    $('.tab-wrap .dot').click(function () {
            SHOW_HIDE(); // hide ui
            $.post(`http://${GetParentResourceName()}/tablet-bus`, JSON.stringify({
                hide: true
            })) // tell lua to unfocus
       
    });
    // Handle icon click
    $('a.nav-myframe').click(function (event) {
        event.preventDefault();
        event.stopPropagation();
        var self = this;
        var icon = $(self).find("img, .myicon");
        icon.addClass("jump")
        // bounce dat ass
        setTimeout(function () {
            iframe.src = self.href || "about:blank"; // trigger HandleLocationChange
            icon.removeClass("jump");    
        }, 600)
        return false;
    });
    // Tell lua the nui loaded
    $.post(`http://${GetParentResourceName()}/tablet-bus`, JSON.stringify({
        load: true
    }))
});