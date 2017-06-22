$("#listbutton").click(function () {
    //alert('yay');
    $.ajax({
        url: "com/currency.asp", success: function (result) {
            $(".currencyResult").remove();
            $("#resultTbody").append(result);
        }
    });
});