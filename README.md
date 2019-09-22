# openfaas-powershell-polaris

> :construction: This template is new and may contain bugs

This is an [OpenFAAS](https://www.openfaas.com/) language template for a http based PowerShell function using the [Polaris](https://github.com/PowerShell/Polaris) web server.

Functions built with this template will respond to `GET` and `POST` requests. These requests will be handled by `handler.ps1`. For now, this is where you need to add your custom logic.

By default the Polaris `Request` and `Response` objects are globally available and can be consumed by your custom handler.

### Request

The following properties are globally available in the `$Request` object.

```PowerShell
RawRequest
BodyString
AcceptTypes
Cookies
Headers
Method
Query
Url
UserAgent
ClientIP
User
```

> NOTE: The Polaris server is initialized with `UseJsonBodyParserMiddleware`. As a result a new property called `Body` is available in the request object. This is a deserialized version of `BodyString` and can be accessed like this: `$Request.Body.MyProperty`

Refer to the [source code](https://github.com/PowerShell/Polaris/blob/master/lib/PolarisRequest.Class.ps1) for more information.

### Response
The following methods are globally available in the `$Response` object.

```PowerShell
Send
SendBytes
Json
SetHeader
SetStatusCode
SetContentType
SetStream
GetContentType
```

Refer to the [source code](https://github.com/PowerShell/Polaris/blob/master/lib/PolarisResponse.Class.ps1) for more information.

## Configuration

| Name | Default | Description |
| -----|---------|-------------|
| POLARIS_CUSTOM_ROUTE | / | A custom path to append to the server root |

## Contributing

Contributions of any kind welcome.
