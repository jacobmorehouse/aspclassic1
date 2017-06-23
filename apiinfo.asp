<% dim pageTitle
    pageTitle = "Exchange Rate Toolkit" %>


<!DOCTYPE html>
<html>
    <head>
        <!-- #include virtual="./header.inc"-->
    </head>
    <body>

        <!-- #include virtual="./navigation.inc"-->

        <header>
            <div class="row">
                <div class="col-md-12">
                    <h2 class="center-text">API Info</h2>
                </div>
            </div>
        </header>

         <div class="row">
            <div class="col-md-12">

                <p class="center-text">To use the API for this project and get this data as a JSON string:</p>
                <div class="well well-sm center center-text">GET ~/com/api.asp</div>
                <p class="center-text"><a href="com/api.asp" target="_blank">Example</a></p>
                <br /><br />
                <p class="center-text">To sort the data, currently only alpha supported:</p>
                <div class="well well-sm center center-text">GET ~/com/api.asp?sort=alpha</div>
                <p class="center-text"><a href="com/api.asp?sort=alpha" target="_blank">Example</a></p>
            </div>
        </div>

        <!-- #include virtual="./footer.inc"-->
    </body>
    
</html>

