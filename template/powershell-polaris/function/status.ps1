try {
    $VersionInfo = [PSCustomObject]@{
        Server = "OK"
        PowerShell =  $PSVersionTable | ConvertTo-Json -Depth 10
        Polaris = (Get-Module -Name Polaris).Version
    }

    $Response.Send($VersionInfo)
} catch {
    $Response.SetStatusCode(500)
    $Response.Send("Could not retrieve server status: $_")
}
