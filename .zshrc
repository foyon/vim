export CLICOLOR=1
export LSCOLORS=ExGxFxdaCxDaDahbadeche
alias ll='ls -lah'
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles


export GOROOT=/usr/local/Cellar/go/1.14.2_1/libexec
#export PATH="$PATH:$(go env GOPATH)/bin"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT:$GOPATH:$GOBIN
