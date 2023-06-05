$env:PATH += ";C:\Program Files\Git\bin"

go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/ramya-rao-a/go-outline@latest
go install github.com/tpng/gopkgs@latest
go install golang.org/x/lint/golint@latest
go install golang.org/x/tools/gopls@latest
go install honnef.co/go/tools/cmd/staticcheck@latest
