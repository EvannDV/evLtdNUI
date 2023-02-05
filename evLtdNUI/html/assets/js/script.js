$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
        if (item.numberP) {
            document.getElementById('nbP').textContent = item.numberP;
        }else{
            document.getElementById('nbP').textContent = "erreur";
        }
        if (item.numberW) {
            document.getElementById('nbW').textContent = item.numberW;
        }else{
            document.getElementById('nbW').textContent = "erreur";
        }
        if (item.numberPh) {
            document.getElementById('nbPh').textContent = item.numberPh;
        }else{
            document.getElementById('nbPh').textContent = "erreur";
        }
    })
})



$(function () {
    function addB(bread) {
        if (bread) {
            $$("#container").show();
        } else {
            $("#container").hide();
        }
    }
})



function Send() {
    let text = "bread";
    if(!text||text=='') {
        return;
    };
    let directory = GetParentResourceName()
    $.post('https://'+directory+'/addB', JSON.stringify({
        data: text
    }))
};


function SendW() {
    let w = "water";
    let directory = GetParentResourceName()
    $.post('https://'+directory+'/addW', JSON.stringify({
        data: w
    }))
};

function SendPho() {
    let pho = "phone";
    let directory = GetParentResourceName()
    $.post('https://'+directory+'/addP', JSON.stringify({
        data: pho
    }))
};

function SendP() {
    let ha = "paid";
    let directory = GetParentResourceName()
    $.post('https://'+directory+'/paid', JSON.stringify({
        data: ha
    }))
};



function reset() {
    let resett = "reset";
    let directory = GetParentResourceName()
    $.post('https://'+directory+'/resetCli', JSON.stringify({
        data: resett
    }))
};



function closeAll() {
    let cl = "close";
    let directory = GetParentResourceName()
    $.post('https://'+directory+'/evCloseAll', JSON.stringify({
        data: cl
    }))
};