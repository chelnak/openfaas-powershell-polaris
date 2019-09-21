Import-Module -Name Polaris

New-PolarisRoute -Path / -Method GET -ScriptPath $PSScriptRoot\function\handler.ps1

Start-Polaris -UseJsonBodyParserMiddleware -Port $ENV:OF_PORT -Verbose