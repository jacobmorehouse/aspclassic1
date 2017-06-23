$("#listbutton").click(function () {
    $.ajax({
        url: "com/currency.asp", success: function (result) {
            $(".currencyResult").remove();
            $("#resultTbody").append(result);
        }
    });
});

$("#sortalpha").click(function () {
    $.ajax({
        url: "com/currency.asp?sort=alpha", success: function (result) {
            $(".currencyResult").remove();
            $("#resultTbody").append(result);
        }
    });
});

$("#sortrate").click(function () {
    $.ajax({
        url: "com/currency.asp?sort=rate", success: function (result) {
            $(".currencyResult").remove();
            $("#resultTbody").append(result);
        }
    });
});

$("#clearbutton").click(function () {
    $(".currencyResult").remove();
});
