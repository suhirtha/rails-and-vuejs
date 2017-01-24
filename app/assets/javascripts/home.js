$(document).ready(function() {
    $("#city").autocomplete({
        source: "/home.json?column=city",
        minLength: 2,
        select: function(event, ui) {
            $("#company").autocomplete({
                source: "/home.json?column=hotel&city=" + ui.item.value,
                minLength: 2,
                select: function(event, ui) {
                    console.log(ui)
                }
            });
        }
    });
});
