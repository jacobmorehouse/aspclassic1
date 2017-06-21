<% dim pageTitle
    pageTitle = "this is the title" %>

<% dim pageTitle2: pageTitle2 = "this is the title2" %>




<!DOCTYPE html>
<html>
    <head>
        <!-- #include virtual="./header.inc"-->
    </head>
    <body>
        <header>
            <h2 class="center-text">Exchange Rate Toolkit</h2>
        </header>
        <!--<p>Hello <% response.Write("World!") %></p>-->
        
        <div class="rateListing">
            <div>
                <ul class="center-text">
                    <li><button type="button" class="btn btn-default" id="listbutton">List</button></li>
                    <li><button type="button" class="btn btn-default" id="highlowbutton">High/Low</button></li>
                    <li><button type="button" class="btn btn-default" id="searchsutton">Search</button></li>
                 </ul>
            </div>

            <div id="resultContainer">
                <table>
                    <thead>
                        <tr>
                            <th>Code</th>
                            <th>Rate</th>
                        </tr>
                    </thead>
                    <tbody id="resultTbody">

                    </tbody>
                    
                </table>
            </div>
        </div>



        <!-- rates at http://api.fixer.io/latest -->
        <!-- #include virtual="./footer.inc"-->
    </body>
    
</html>







