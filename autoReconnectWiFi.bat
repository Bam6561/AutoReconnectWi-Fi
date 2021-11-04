:autoReconnectWiFi
	ping google.com -n 1 
	if errorlevel 1 (
		netsh wlan connect "WIFI_NAME"
	) 
	timeout 1800
	goto :autoReconnectWiFi