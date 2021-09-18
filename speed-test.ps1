$ST_intro = @"
                                                                                              
      _/_/_/                                      _/    _/                            _/      
   _/        _/_/_/      _/_/      _/_/      _/_/_/  _/_/_/_/    _/_/      _/_/_/  _/_/_/_/   
    _/_/    _/    _/  _/_/_/_/  _/_/_/_/  _/    _/    _/      _/_/_/_/  _/_/        _/        
       _/  _/    _/  _/        _/        _/    _/    _/      _/            _/_/    _/         
_/_/_/    _/_/_/      _/_/_/    _/_/_/    _/_/_/      _/_/    _/_/_/  _/_/_/        _/_/      
         _/                                                                                   
        _/                                                                                    
"@
Write-Host $ST_Intro -ForegroundColor DarkCyan
Write-Host '====================================================================================' -ForegroundColor DarkCyan
Write-Host ''
Write-Host 'Enter a PC below' -ForegroundColor DarkCyan
Write-Host ''

while ($true) {
$installer = "https://install.speedtest.net/app/cli/ookla-speedtest-1.0.0-win64.zip"

$hostname = Read-Host "PC"

ForEach ($i in $hostname) {

	$testConnection = Test-Connection -Count 2 $hostname -ErrorAction 'silentlycontinue'
	
	If ($testConnection -ne $null) {
		
		$remoteDLpath = "\\$hostname\c$\SpeedTest.Zip"
		$extraction = "\\$hostname\c$\SpeedTest"
		$EXE = "\\$hostname\c$\SpeedTest\speedtest.exe"
		
		function RunTest() {
			$test = & $EXE --accept-license --accept-gdpr #& allow run of command stored in var
			$test
		}
		
		#Check if it leads to a file
		if (Test-Path -Path $EXE -PathType leaf) {
			
			Write-Host "Installer is already installed. [RUNNING SPEEDTEST...]" -ForegroundColor Green
			RunTest
			
		} else {
			
			Write-Host "Installer doesn't exist. [DOWNLOADING FILE...]" -ForegroundColor Yellow
			wget $installer -outfile $remoteDLpath
			
			
			Add-Type -AssemblyName System.IO.Compression.FileSystem
			function Unzip {
				param([string]$zipfile, [string]$outpath)
				[System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
			}
			
			Unzip $remoteDLpath $extraction
			
			Write-Host "Download complete. [RUNNING SPEEDTEST...]" -ForegroundColor Green
			RunTest
			
			Remove-Item -Path $remoteDLpath -recurse
			
		}
		
	} Else {
		
		Write-Host "$hostname IS OFFLINE" -ForegroundColor Red
		
	}
}

Read-Host "Press CTRL + C to quit or press ENTER to continue"
}