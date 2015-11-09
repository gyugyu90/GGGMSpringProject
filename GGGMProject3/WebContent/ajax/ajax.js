var httpRequest=null;
function createHttpRequest()
{
	if(window.ActiveXObject)
	{
		return new ActiveXObject("Msxml2.XMLHTTP");
	}
	else if(window.XMLHttpRequest)
	{
		return new XMLHttpRequest();
	}
	else
	{
		return null;
	}
}
function sendMessage(method,url,param,callback)
{
	httpRequest = createHttpRequest();
	var httpMethod = method ? method : 'GET';
	if (httpMethod != 'GET' && httpMethod != 'POST') {
		httpMethod = 'GET';
	}
	var httpParams = (param == null || param == '') ? null : param;
	var httpUrl = url;
	
	if (httpMethod == 'GET' && httpParams != null) {
		httpUrl = httpUrl + "?" + httpParams;
	}
	//alert(httpParams);
	//alert(httpMethod);
	//alert(httpUrl);
	httpRequest.open(httpMethod, httpUrl, true);
	httpRequest.setRequestHeader(
		'Content-Type', 'application/x-www-form-urlencoded');
	httpRequest.onreadystatechange = callback;
	httpRequest.send(httpMethod == 'POST' ? httpParams : null);
}
