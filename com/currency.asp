<%
    Function getCurrencies
        dim returnVar
        dim currencyUrl : currencyUrl = "http://api.fixer.io/latest?base=USD" 'starting currency is USD
        Set HttpReq = Server.CreateObject("MSXML2.ServerXMLHTTP")
        HttpReq.open "GET", currencyUrl, False
        HttpReq.send

        dim response : response = HttpReq.responseText

        dim stringRatesToFind : stringRatesToFind = "rates"":"
        dim lenstringRatesToFind : lenstringRatesToFind = len(stringRatesToFind)

        dim reslength : reslength = len(response)
        dim ratespos : ratespos = inStr(response, stringRatesToFind)
        dim ratesString : ratesString = replace(right(response, (reslength-(ratespos+lenstringRatesToFind))), "}", "") 'rwrite this as ending at } instead of just stripping it out to make it more robust.
        dim rates : rates = split(ratesString,",")

        dim currencies 
        set currencies = server.createObject("Scripting.Dictionary")
    
        'parse into a dictionary which is much easir to work with.
        for each i in rates
            currencies.add mid(i,2,3), right(i, len(i)-6)
        next
        
        set getCurrencies = currencies
        
    end function
%>


<%
    dim currencies 
    set currencies = getCurrencies()

    for each i in currencies.keys
        response.Write("<tr class=""currencyResult""><td>" & i & "</td><td>" & currencies.item(i) & "</td></tr>")
    next

%>