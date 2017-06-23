<% 
    dim inputvar : inputvar = Request.QueryString("sort")

    if len(inputvar) > 0 then
        response.Write("had a value:" & inputvar)
    else
        response.Write("no value")
    end if

%>