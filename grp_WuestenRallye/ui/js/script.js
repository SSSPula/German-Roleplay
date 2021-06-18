let page        = 1;
let raceArray   = [];

window.onload = (e) => {
    window.addEventListener('message', (event) => {
        let tgr = event.data;
        if (tgr.showUi) {
            $('#main-container').fadeIn(300);
            $.post(`https://${GetParentResourceName()}/fetch_races`, (data) => {
                raceArray = JSON.parse(data);
                raceArray.sort((a, b) => a.finishTime - b.finishTime);
                formatRaceData(raceArray);
            })
        }
    });

    $('#next').click(() => {
        page += 1;
        if (page >= 1) {
            formatRaceData(raceArray);
        }
    })

    $('#previous').click(() => {
        if (page > 1) {
            page -= 1;
            formatRaceData(raceArray);
        }
    })
}

paginateArray = (array, pageSize, pageNumber) => {
    return array.slice((pageNumber - 1) * pageSize, pageNumber * pageSize);
};

formatRaceData = (data) => {
    let htmlData = [];
    $.each(paginateArray(data, 10, page), (i, v) => {
        let racer = v;
        htmlData += `
        <tr>
            <td><code>${raceArray.findIndex(p => p.charName === racer.charName) + 1}</code></td>
            <td>${racer.charName}</td>
            <td>${moment.duration(racer.finishTime).format("mm:ss.SS")}</td>
            <td>${moment(racer.finishDate).format('DD.MM.YYYY')}</td>
        </tr>
        `;
    });
    $('#tbody').html(htmlData);
}

document.onkeyup = (data) => {
	if (data.key === 'Escape') {
        $('#main-container').fadeOut(300);
        $.post(`https://${GetParentResourceName()}/exit`);
	}
};