$(document).ready(function () {
    $(".js--fade-out-on-load").fadeOut();

    $(".js--milestone-checkbox").on("change", function () {
        if ($(this).is(":checked")) {
            $.ajax({
                type: "PUT", url: "/member/milestones/" + $(this).val() + "/mark_complete", success: function (result) {
                    displaySuccess(result["id"], "milestone")
                    refreshDonutChart(result["completeness_rate"])
                }
            });
        } else {
            $.ajax({
                type: "PUT", url: "/member/milestones/" + $(this).val() + "/mark_incomplete", success: function (result) {
                    displaySuccess(result["id"], "milestone");
                    refreshDonutChart(result["completeness_rate"])
                }
            });
        }
    });

    $(".js--task-checkbox").on("change", function () {
        if ($(this).is(":checked")) {
            $.ajax({
                type: "PUT", url: "/member/company_tasks/" + $(this).val() + "/mark_complete", success: function (result) {
                    displaySuccess(result["id"], "task")
                }
            });
        } else {
            $.ajax({
                type: "PUT", url: "/member/company_tasks/" + $(this).val() + "/mark_incomplete", success: function (result) {
                    displaySuccess(result["id"], "task")
                }
            });
        }
    });
});

function displaySuccess(id, elementType) {
    $("#js--" + elementType + "-tag-" + id).html("Success");
    $("#js--" + elementType + "-tag-" + id).fadeIn();
    setTimeout(function () { $("#js--" + elementType + "-tag-" + id).fadeOut(); }, 2000);
}

function refreshDonutChart(completeness_rate) {
    $(".js--donut-chart").attr("data-percentage", completeness_rate)
    $(".js--donut-chart-center").html(completeness_rate + "%")
}
