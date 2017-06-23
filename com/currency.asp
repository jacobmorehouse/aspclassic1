<%
    Function getCurrencies
        dim returnVar
        dim currencyUrl : currencyUrl = "http://api.fixer.io/latest?base=" & Session("basecurrency") 'starting currency is USD
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
    'Sorting dictionaries: http://developer.rhino3d.com/guides/rhinoscript/vbscript-dictionaries/
    Function SortDictionary(objDict, intSort)

      ' declare constants
      Const dictKey  = 1
      Const dictItem = 2

      ' declare our variables
      Dim strDict()
      Dim objKey
      Dim strKey,strItem
      Dim X,Y,Z

      ' get the dictionary count
      Z = objDict.Count

      ' we need more than one item to warrant sorting
      If Z > 1 Then
        ' create an array to store dictionary information
        ReDim strDict(Z,2)
        X = 0
        ' populate the string array
        For Each objKey In objDict
            strDict(X,dictKey)  = CStr(objKey)
            strDict(X,dictItem) = CStr(objDict(objKey))
            X = X + 1
        Next

        ' perform a a shell sort of the string array
        For X = 0 To (Z - 2)
          For Y = X To (Z - 1)
            If StrComp(strDict(X,intSort),strDict(Y,intSort),vbTextCompare) > 0 Then
                strKey  = strDict(X,dictKey)
                strItem = strDict(X,dictItem)
                strDict(X,dictKey)  = strDict(Y,dictKey)
                strDict(X,dictItem) = strDict(Y,dictItem)
                strDict(Y,dictKey)  = strKey
                strDict(Y,dictItem) = strItem
            End If
          Next
        Next

        ' erase the contents of the dictionary object
        objDict.RemoveAll

        ' repopulate the dictionary with the sorted information
        For X = 0 To (Z - 1)
          objDict.Add strDict(X,dictKey), strDict(X,dictItem)
        Next

      End If
      set SortDictionary = objDict
    End Function    
    
%>


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