$o = New-Object -com shell.application
$o.Namespace("$env:USERPROFILE\Documents\links").Self.InvokeVerb("pintohome")
