<!-- #include file="functions.asp" -->

<%
    dim currencies 
    set currencies = getCurrencies()
    dim sorttype : sorttype = Request.QueryString("sort")

    
    if len(sorttype) > 0 then
        dim sortedDictionary
        set sortedDictionary = server.createObject("Scripting.Dictionary")
        select case sorttype
            case "alpha" 
                set sortedDictionary = SortDictionary(currencies,1)

                for each i in sortedDictionary.keys
                    response.Write("<tr class=""currencyResult""><td>" & i & "</td><td>" & currencies.item(i) & "</td></tr>")
                next

            'case "rate"
            '    set sortedDictionary = SortDictionary(currencies,2)
            '
            '    for each i in sortedDictionary.keys
            '        response.Write("<tr class=""currencyResult""><td>" & i & "</td><td>" & currencies.item(i) & "</td></tr>")
            '    next
            
        end select

    else 'if no params just return a list
        for each i in currencies.keys 
            response.Write("<tr class=""currencyResult""><td>" & i & "</td><td>" & currencies.item(i) & "</td></tr>")
        next
    end if
%>