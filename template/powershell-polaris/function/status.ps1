try {
    $VersionInfo = [PSCustomObject]@{
        Server     = "OK"
        PowerShell = $PSVersionTable.PSVersion.ToString()
        Polaris    = (Get-Module -Name Polaris).Version.ToString()
    } | ConvertTo-Json -Depth 10

    $Response.Send($VersionInfo)
}
catch {
    $Response.SetStatusCode(500)
    $Response.Send("Could not retrieve server status: $_")
}
