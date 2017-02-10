
$(document).ready(function() {
    $("#city").autocomplete({
        source: "/companies.json?column=city",
        minLength: 2,
        select: function(event, ui) {
            console.log(ui)
            $("#company").autocomplete({
                source: "/companies.json?column=hotel&city=" + ui.item.value,
                minLength: 2,
                select: function(event, ui) {
                    console.log(ui)
                    $('#btn').click(function(){
                        location.href = "/companies/"+ui.item.id

                    });
                }
            });
        }
    });
     $('#btn2').click(function(){
        location.href = "/companies";
        })

});
