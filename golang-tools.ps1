$env:PATH += ";C:\Program Files\Go\bin"

go install `
  github.com/goreleaser/goreleaser@latest `
  github.com/go-delve/delve/cmd/dlv@latest `
  github.com/ramya-rao-a/go-outline@latest `
  github.com/tpng/gopkgs@latest `
  golang.org/x/lint/golint@latest `
  golang.org/x/tools/gopls@latest `
  honnef.co/go/tools/cmd/staticcheck@latest
