Invoke-WebRequest -URI "https://download.bitdefender.com/SMB/Hydra/release/bst_win/uninstallTool/BEST_uninstallTool.exe?adobe_mc=MCMID%3D30569530015817873474514485438710839392%7CMCORGID%3D0E920C0F53DA9E9B0A490D45%2540AdobeOrg%7CTS%3D1718099652&_gl=1*v7roog*_ga*NTMxNjQ5MTk4LjE3MTgwOTc5NzI.*_ga_94CS80B87J*MTcxODA5Nzk3MS4xLjEuMTcxODA5OTY1Mi42MC4wLjA.*_ga_6M0GWNLLWF*MTcxODA5Nzk3MS4xLjEuMTcxODA5OTY1Mi42MC4wLjQ5ODA0NTY0Nw.." -OutFile "$env:PUBLIC\BEST_uninstallTool.exe"
cd $env:PUBLIC
.\BEST_uninstallTool.exe /passbase64=placeholder /bruteForce /destructive /noWait
