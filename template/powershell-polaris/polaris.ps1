Import-Module -Name Polaris

$PolarisPort = "8888"
$HandlerPath = "$PSScriptRoot\function\handler.ps1"
$StatusHandlerPath = "$PSScriptRoot\function\status.ps1"

$AppRoute = "/"
if ($ENV:POLARIS_CUSTOM_ROUTE) {
    Write-Verbose -Message "Overriding default AppRoute with ${ENV:POLARIS_CUSTOM_ROUTE}"
    $AppRoute = $ENV:POLARIS_CUSTOM_ROUTE

    if (!$AppRoute.StartsWith("/")) {
        $AppRoute = "/${AppRoute}"
    }
}

# --- Register routes
New-PolarisRoute -Path $AppRoute -Method GET -ScriptPath $HandlerPath -Verbose
New-PolarisRoute -Path $AppRoute -Method POST -ScriptPath $HandlerPath -Verbose
New-PolarisRoute -Path /status -Method GET -ScriptPath $StatusHandlerPath -Verbose

$App = Start-Polaris -UseJsonBodyParserMiddleware -Port $PolarisPort -Verbose

while($App.Listener.IsListening){
    Wait-Event callbackcomplete
}
