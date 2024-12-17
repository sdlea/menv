#!/bin/zsh
# make sure source this file at proper position of .zshrc file

# ===proxy settings start===
proxy_server="127.0.0.1"
proxy_port_http="7890"
proxy_port_socks="1089"
proxy_protocol_1="http://"
proxy_protocol_2="socks5://"
proxy_http=$proxy_protocol_1$proxy_server:$proxy_port_http
proxy_socks5=$proxy_protocol_2$proxy_server:$proxy_port_socks

function proxyon () {
  export http_proxy="$proxy_http"
  export HTTP_PROXY="$proxy_http"
  export https_proxy="$proxy_http"
  export HTTPS_PROXY="$proxy_http"
  echo http\[s\] proxy added...
}
function skproxyon () {
  export http_proxy="$proxy_socks5"
  export HTTP_PROXY="$proxy_socks5"
  export https_proxy="$proxy_socks5"
  export HTTPS_PROXY="$proxy_socks5"
  echo socks5 proxy added...
}
function proxyoff () {
  unset http_proxy
  unset HTTP_PROXY
  unset https_proxy
  unset HTTPS_PROXY
  echo unset proxy done.
}
## ===proxy end===

# ===x settings start===
# export XSESSION=openbox
# ===x shortcuts end===

# ===shortcuts start===
alias x="startx"

alias pon="proxyon"
alias spon="skproxyon"
alias poff="proxyoff"

alias curlph="curl -x $proxy_protocol_1$proxy_server "
alias curlsk="curl --socks5 $proxy_server $proxy_port_socks "
# alias sshd-start="sudo systemctl start sshd"
# alias sshd-stop="sudo systemctl stop sshd"
alias ibuson="ibus-daemon -dx"
alias rimeon="ibus engine rime"
alias cjklc="export LC_CTYPE=\"zh_CN.utf8\""
# ===shortcuts end===

# ===umask===
umask 0003
# alias mkdir="mkdir -m 775 "
# ===umask end===
