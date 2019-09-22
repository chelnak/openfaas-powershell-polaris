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

## Example

An out of the box build from this template will give you the following:

1. A `GET` route at / that responds with `Hello! Welcome to openfaas-powershell-polaris`
2. A `POST` route at / that expects a json string with a name property and will respond with `Hello <name>! Welcome to openfaas-powershell-polaris`
3. A `GET` route at /status that resonds with some basic information such asthe version of both PowerShell and the Polaris module running in the container.

### Getting set up

Create a new directory and pull the template

```Bash
mkdir faas
cd faas
faas-cli template pull https://github.com/chelnak/openfaas-powershell-polaris
```

Initialize a new function

```Bash
faas-cli new --lang powershell-polaris polaris-example --prefix <docker_username>
```

Modify the stack file, if required. E.g. to add the `POLARIS_CUSTOM_ROUTE` environment variable

Build, push and deploy the function

```Bash
faas-cli up -f polaris-example.yml
```

Assuming that you are running OpenFAAS in Kubernetes and have a port-forward set up to the gateway service on port 8080 you can test the function like this:

```PowerShell
Invoke-RestMethod -Method GET -Uri http://localhost:8080/function/polaris-example/status
```

## Contributing

Contributions of any kind welcome.
