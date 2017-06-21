$("#listbutton").click(function () {
    //alert('yay');
    $.ajax({
        url: "listExchanges.asp", success: function (result) {
            //$("#resultContainer").html(result);

            //var rates = result.rates;

            //console.log(result);

            //$.each(result, function(a) {
                //$("#" + a).append(document.createTextNode(" - " + b));
                
                //$("#resultTbody").append(a);
            //});
            
            $("#resultTbody").empty;
            $("#resultTbody").append(result);
        }
    });
});