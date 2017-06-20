<%
    dim currencyUrl : currencyUrl = "http://api.fixer.io/latest"
    Set HttpReq = Server.CreateObject("MSXML2.ServerXMLHTTP")
    HttpReq.open "GET", currencyUrl, False
    HttpReq.send
%>

<% =HttpReq.responseText %>