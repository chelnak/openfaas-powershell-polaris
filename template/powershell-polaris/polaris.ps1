Import-Module -Name Polaris

$HandlerPath = "$PSScriptRoot\function\handler.ps1"
$StatusHandlerPath = "$PSScriptRoot\function\status.ps1"

$AppRoute = "/"
if ($ENV:CUSTOM_ROUTE) {
    $AppRoute = $ENV:CUSTOM_ROUTE
}

# --- Register routes
New-PolarisRoute -Path $AppRoute -Method GET -ScriptPath $HandlerPath -Verbose
New-PolarisRoute -Path $AppRoute -Method POST -Scriptblock $HandlerPath -Verbose
New-PolarisRoute -Path /status -Method GET -ScriptPath $StatusHandlerPath -Verbose

$App = Start-Polaris -UseJsonBodyParserMiddleware -Port $ENV:POLARIS_PORT -Verbose

while($App.Listener.IsListening){
    Wait-Event callbackcomplete
}
