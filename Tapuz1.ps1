param 
( 
    [string]$TapuzUser = "MyTapuzUser", 
    [string]$TapuzPassword = "MyTapuzPassword",
	[string]$TapuzClientID = "MyTapuzClientID",
	[string]$TapuzURL = "MyTapuzURL",
	[string]$TapuzpParam = "MyTapuzpParam"
	

)

$request = $TapuzURL + $TapuzpParam
$request
$response = Invoke-WebRequest $request
$val = [xml]$response
$val.int.InnerXML
