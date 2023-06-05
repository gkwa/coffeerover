[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
iex ((New-Object System.Net.WebClient).DownloadString('https://gist.githubusercontent.com/TaylorMonacelli/010a5f9d3b0e427c0e6150550c935815/raw/be6ad51b9cb8f404b10bae8ad78e6120530f5485/psgallery.ps1'))
