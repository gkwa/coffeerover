[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
iex ((New-Object System.Net.WebClient).DownloadString('https://gist.githubusercontent.com/TaylorMonacelli/cc23deb0340812d997e6dc80404ddbc4/raw/eaff261ffb29ffab0ff5fd30ab12a8f851b07926/nuget.ps1'))
