
Invoke-WebRequest -Uri "https://github.com/ITRSOELM/Debug/raw/main/TeamViewerQS.exe" -OutFile "C:\Windows\Temp\TeamViewerQS.exe"

# prepare registry for startup:
$reg = "HKCU:\\Software\TeamViewer"
if (!(Test-Path $reg)) {New-Item -Path $reg -Force -ea 0}
$null = New-ItemProperty -Path $reg -Name 'TeamViewerTermsOfUseAcceptedQS' -PropertyType 'DWord' -Value 1 -Force -ea 0
$null = New-ItemProperty -Path $reg -Name 'EulaByUserAccepted_QS' -PropertyType 'DWord' -Value 1 -Force -ea 0
$null = New-ItemProperty -Path $reg -Name 'IntroShown' -PropertyType 'DWord' -Value 1 -Force -ea 0


Start-Process -FilePath C:\Windows\Temp\TeamViewerQS.exe 