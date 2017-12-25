# TapuzPriorityIntegration
Integration between Priority and Tapuz using Powershell script.
The steps are:
Priority side:
1.Define tapuz credentails, url, client ID, user, password
2.Create tapuz string
Powershell side:
1.Inputs: Tapuz credentails, tapuz string, Priority order ID (ORDERS.ORD)
2.Post inputs using Invoke-WebRequest
3.Fetch the tracking number from thexml response.
4.Update Priority ORDERS.ROYY_TAPUZID = response.
