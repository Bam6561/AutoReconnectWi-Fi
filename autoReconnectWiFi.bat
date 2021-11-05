:autoReconnectWiFi
	ping google.com -n 1 
	if errorlevel 1 (
		netsh wlan connect "WIFI_NAME"
		timeout 5
		ping google.com -n 1
		if errorlevel 1 (
			netsh interface set interface Wi-Fi disable
			netsh interface set interface Wi-Fi enable
			timeout 5
			netsh wlan connect "WIFI_NAME"
		)
	) 
	timeout 1800
	goto :autoReconnectWiFi
