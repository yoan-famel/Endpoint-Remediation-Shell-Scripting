$x = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like '*java*' }

foreach ($i in $x) {
    $i.Uninstall()
}

Start-Sleep 5

Invoke-WebRequest -URI https://download.oracle.com/java/20/latest/jdk-20_windows-x64_bin.exe -OutFile $env:PUBLIC\jdk-20_windows-x64_bin.exe
Start-Sleep 5

cd $env:PUBLIC
./jdk-20_windows-x64_bin.exe /s
