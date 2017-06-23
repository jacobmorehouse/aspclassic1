<!-- #include file="functions.asp" -->

<% 
    dim currencies 
    set currencies = getCurrencies()
    dim sorttype : sorttype = Request.QueryString("sort")
    dim loopvar : loopvar = 0 'ubound(currencies)

    if isempty(sorttype) = false and  len(sorttype) > 0 then
        dim sortedDictionary
            set sortedDictionary = server.createObject("Scripting.Dictionary")
        select case sorttype
            case "alpha" 
                set sortedDictionary = SortDictionary(currencies,1)

                response.Write("{")
                for each i in sortedDictionary.keys
                    response.Write("""" & i & """:" & sortedDictionary.item(i))
                    loopvar = loopvar + 1
                    if loopvar <> currencies.Count then
                        response.Write(",")
                    end if

                next
                response.Write("}")
        end select

    else 'if no params just return a list
        response.Write("{")
        for each i in currencies.keys
            response.Write("""" & i & """:" & currencies.item(i))
            loopvar = loopvar + 1
            if loopvar <> currencies.Count then
                response.Write(",")
            end if

        next
        response.Write("}")

    end if

%>