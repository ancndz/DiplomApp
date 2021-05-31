$(document).ready(function () {

    $("#pocForm").submit(function (event) {
        //stop submit the form, we will post it manually.
        event.preventDefault();

        var restModel = {}
        restModel["supplyTime"] = $("#time").val();
        restModel["dailyDemand"] = $("#demand").val();
        restModel["demandVolumeLevel"] = $("#demandVolumeLevel").val();

        fire_ajax_submit(restModel, "poc");
    });

    $("#lvForm").submit(function (event) {
        //stop submit the form, we will post it manually.
        event.preventDefault();

        var restModel = {}
        restModel["dailyDemand"] = $("#demandLV").val();
        restModel["demandVolumeLevel"] = $("#demandVolumeLevelLV").val();
        restModel["minDate"] = $("#minDateLV").val();
        restModel["maxDate"] = $("#maxDateLV").val();

        fire_ajax_submit(restModel, "lv");
    });

    $("#dvForm").submit(function (event) {
        //stop submit the form, we will post it manually.
        event.preventDefault();

        var restModel = {}
        restModel["supplyTime"] = $("#timeDV").val();
        restModel["demandVolumeLevel"] = $("#demandVolumeLevelDV").val();
        restModel["minDate"] = $("#minDateDV").val();
        restModel["maxDate"] = $("#maxDateDV").val();

        fire_ajax_submit(restModel, "dv");
    });

    $("#ldvForm").submit(function (event) {
        //stop submit the form, we will post it manually.
        event.preventDefault();

        var restModel = {}
        restModel["supplyTime"] = $("#timeLDV").val();
        restModel["demandVolumeLevel"] = $("#demandVolumeLevelLDV").val();
        restModel["minDate"] = $("#minDateLDV").val();
        restModel["maxDate"] = $("#maxDateLDV").val();

        fire_ajax_submit(restModel, "ldv");
    });

    $("#bvForm").submit(function (event) {
        //stop submit the form, we will post it manually.
        event.preventDefault();

        var restModel = {}
        restModel["orderVal"] = $("#orderVal").val();
        restModel["demandVolumeLevel"] = $("#demandVolumeLevelBV").val();
        restModel["minDate"] = $("#minDateBV").val();
        restModel["maxDate"] = $("#maxDateBV").val();

        fire_ajax_submit(restModel, "bv");
    });

});

function fire_ajax_submit(model, url) {

    $('#loading').show();

    $("#button" + url).prop("disabled", true);

    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/api/" + url,
        data: JSON.stringify(model),
        dataType: 'json',
        cache: false,
        timeout: 600000,
        success: function (data) {

            var json = "Страховой запас: " + parseFloat(data.data).toFixed(2);
            $("#result" + url).html(json);

            console.log("SUCCESS : ", data);
            $("#button" + url).prop("disabled", false);
            $('#footer' + url).show()
            $('#loading').hide();
        },
        error: function (e) {

            var json = e.responseText;
            $('#result' + url).html(json);

            console.log("ERROR : ", e);
            $("#button" + url).prop("disabled", false);
            $('#loading').hide();
        }
    });
}