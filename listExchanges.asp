
<%
    dim returnVar
    dim currencyUrl : currencyUrl = "http://api.fixer.io/latest?base=USD"
    Set HttpReq = Server.CreateObject("MSXML2.ServerXMLHTTP")
    HttpReq.open "GET", currencyUrl, False
    HttpReq.send

    dim response : response = HttpReq.responseText

    dim stringRatesToFind : stringRatesToFind = "rates"":"
    dim lenstringRatesToFind : lenstringRatesToFind = len(stringRatesToFind)

    dim reslength : reslength = len(response)
    dim ratespos : ratespos = inStr(response, stringRatesToFind)
    dim ratesString : ratesString = replace(right(response, (reslength-(ratespos+lenstringRatesToFind))), "}", "")
    dim rates : rates = split(ratesString,",")



    returnVar = rates(0) 'just loop over this guy
%>







<% =returnVar %>