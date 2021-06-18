let listener = null;

window.addEventListener('message', (event) => {
    switch(event.data.type) {
        case "Input":
            OpenTextDialogue(event.data.description, event.data.length, event.data.id);
            break;
        case "Confirm":
            OpenConfirmation(event.data.description, event.data.length, event.data.id)
            break;
    }
})

function OpenTextDialogue(description, maxLength, id) {

    let audio = new Audio("sounds/sao_menu_open.wav");
    audio.volume = 0.8;
    audio.play();

    let elem = $(document.createElement('div'))
        .attr('id', 'grp_PopUp')
        .html(`
            <p id = "grp_PopUp-title">Input Text</p>
            <p id = "grp_PopUp-description"> Input Text </p>

            <div id = "grp_PopUp-body">
                <input type="text" id = "grp_PopUp-text">
            </div>

            <img src = "img/Yes.png" id = "yes">
            <img src = "img/No.png" id = "no">
        `);
    

    $('body').append(elem)

    $("#grp_PopUp").animate({height: "35%", top: "32.5%"}, 250, () => {
        $("#grp_PopUp-title")
            .css('top', "15.5%")
            .css('opacity', '1.0')
            .html(description);
    })

    $('#grp_PopUp-body').animate({height: "47.5%"}, 250, () => {
        $('#yes').css('opacity', '1.0')
        $('#no').css('opacity', '1.0')
        $('#grp_PopUp-text')
            .focus()
            .attr('maxlength', typeof maxLength == 'number' ? maxLength : 9999);
    })

    $('#yes').click(() => {
       Finish($('#grp_PopUp-text').val(), id, elem)
    })

    $('#no').click(() => {
        Finish(null, id, elem)
     })

     document.onkeydown = function(e) {
        switch(e.which) {
            case 13:
                Finish($('#grp_PopUp-text').val(), id, elem);
                break;
            case 27:
                Finish(null, id, elem);
                break;
        }
    }
}

function OpenConfirmation(title, description, id) {
    let audio = new Audio("sounds/sao_menu_open.wav");
    audio.volume = 0.8;
    audio.play();

    let elem = $(document.createElement('div'))
        .attr('id', 'grp_PopUp')
        .html(`
            <p id = "grp_PopUp-description"> ${title} </p>

            <div id = "grp_PopUp-body">
                <p id = "grp_PopUp-confirm"></p>
            </div>

            <img src = "img/Yes.png" id = "yes">
            <img src = "img/No.png" id = "no">
        `);
    

    $('body').append(elem)

    $("#grp_PopUp").animate({height: "35%", top: "32.5%"}, 250, () => {
        $("#grp_PopUp-title")
            .css('top', "15.5%")
            .css('opacity', '1.0')
    })

    $('#grp_PopUp-body').animate({height: "47.5%"}, 250, () => {
        $('#yes').css('opacity', '1.0')
        $('#no').css('opacity', '1.0')
        $('#grp_PopUp-confirm').html(description)
    })

    $('#yes').click(() => {
       Finish(true, id, elem)
    })

    $('#no').click(() => {
        Finish(false, id, elem)
    })

    document.onkeydown = function(e) {
        switch(e.which) {
            case 13:
                Finish(true, id, elem);
                break;
            case 27:
                Finish(false, id, elem);
                break;
        }
    }
}

function Finish(value, id, elem) {
    $('#yes').css('opacity', '0.0')
    $('#no').css('opacity', '0.0')
    $('#grp_PopUp-text').remove()
    $('#grp_PopUp-body').animate({height: "0.0%"}, 250)
    $("#grp_PopUp")
        .blur()
        .animate({height: "0%", top: "50%"}, 350, () => {
            elem.remove()
        }
    );

    $("#grp_PopUp-title").html('')
    $("#grp_PopUp").animate({height: "16.625%", top: "41.6875%"}, 250)

    let audio = new Audio("sounds/sao_menu_select.wav");
    audio.volume = 0.8;
    audio.play();

    document.onkeydown = null;
    $.post(`https://${GetParentResourceName()}/TextInput`, JSON.stringify({
        text: value,
        id: id
    }))
}