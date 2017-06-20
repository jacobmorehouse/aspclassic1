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
                    <li class="buttonMe">Full List</li>
                    <li class="buttonMe">Hi-Low</li>
                    <li class="buttonMe">Search</li>
                 </ul>
            </div>
        </div>



        <!-- rates at http://api.fixer.io/latest -->
    </body>
</html>







