Invoke-WebRequest -URI https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe -OutFile $env:PUBLIC\SteamSetup.exe

cd $env:PUBLIC

./SteamSetup.exe /S
