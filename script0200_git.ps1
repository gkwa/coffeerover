Invoke-WebRequest -OutFile ~/.gitconfig -Uri https://raw.githubusercontent.com/TaylorMonacelli/dotfiles/master/.gitconfig
@"
Set-Alias g git
"@ | Out-File -Append -Encoding ASCII $profile
. $profile
