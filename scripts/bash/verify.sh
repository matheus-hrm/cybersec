#! /bin/bash

site="http://google.com"
vuln="CVE-2014-6271"

echo
resultado=$(curl -s -I "$site" | grep "$vuln")

if [ -n "$resultado" ]; then
	echo "Vulnereabilidade detectada"
else
	echo "site seguro"
fi
