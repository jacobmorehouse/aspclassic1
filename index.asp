<% dim pageTitle
    pageTitle = "this is the title" %>


<!DOCTYPE html>
<html>
    <head>
        <!-- #include virtual="./header.inc"-->
    </head>
    <body>

        <header>
            <div class="row">
                <div class=".col-md-12">
                    <h2 class="center-text">Exchange Rate Toolkit</h2>
                </div>
            </div>
        </header>

         <div>
             <p class="center-text">Base Currency: <% =Session("basecurrency") %></p>
            <ul class="center-text navbuttons">
                <li><button type="button" class="btn btn-default" id="listbutton">List</button></li>
                <li><button type="button" class="btn btn-default" id="sortalpha">Sort: Alpha</button></li>
                <!--<li><button type="button" class="btn btn-default" id="sortrate">Sort: rate</button></li>-->
                <li><button type="button" class="btn btn-default" id="clearbutton">Clear</button></li>
            </ul>
        </div>

        <div class="rateListing">
           
            <div id="resultContainer">
                <table class="table table-striped">
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

        <!-- #include virtual="./footer.inc"-->
    </body>
    
</html>

