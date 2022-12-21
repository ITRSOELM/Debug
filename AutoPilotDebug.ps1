function Get_TeamViewerQS () {
    param(
        [Parameter(Mandatory = $true)]
        [uri]$url
    )


    # Internet Explorer application to fool the website into thinking the connection is a client session (this is needed to return the result from javascript function that generates the downloadlink of your custom TeamViewer using the newest version of it)
    $iebrowser = New-Object -ComObject InternetExplorer.Application
    # navigates to the given Website/URL
    $iebrowser.Navigate($URL)
    # Pausing 3 seconds because creating the browser object and navigating to the website takes a little while depending on your system and internet connection
    Start-Sleep -Seconds 3
    # isolates the generated download URL of the custom TeamViewer
    $CustomTVQS_URL = $iebrowser.Document.getElementById('MasterBodyContent_btnRetry').href
    # Downloads the custom TeamViewer QS
    Return  $CustomTVQS_URL
}

$Url = Get_TeamViewerQS  "https://get.teamviewer.com/a1s2d3"

Invoke-WebRequest -Uri $Url -OutFile C:\Windows\Temp\TeamViewerQS.exe

Start-Process -FilePath C:\Windows\Temp\TeamViewerQS.exe