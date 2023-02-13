:autoReconnectWi-Fi
::check online connection
ping google.com -n 1

::if no signal, connect to Wi-Fi network
if errorlevel 1 (
	netsh wlan connect "WI-FI_NETWORK_NAME"
	timeout 5
	ping google.com -n 1

	::if no signal, restart network adapter
	if errorlevel 1 (
		netsh interface set interface Wi-Fi disable
		netsh interface set interface Wi-Fi enable
		timeout 5
		netsh wlan connect "WI-FI_NETWORK_NAME"
	)
)

::loop interval (in seconds)
timeout 1800
goto :autoReconnectWi-Fi
