switch ($Request.Method) {
    'GET' {
        $Response.Send("Hello! Welcome to openfaas-powershell-polaris")
        break
    }

    'POST' {
        $Name = $Request.Body.Name
        if (!$Name) {
            $Response.SetStatusCode(400)
            $Response.Send("Name property is missing")
        } else {
            $Response.Send("Hello $($Name)! Welcome to openfaas-powershell-polaris")
        }
        break
    }
}
