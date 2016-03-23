# connect to any ssh host with s[Enter]
function s() {
  ssh $(awk '
    tolower($1)=="host" {
      for (i=2; i<=NF; i++) {
        if ($i !~ "[*?]") {
          print $i
        }
      }
    }
  ' ~/.ssh/config | sort | peco)
}

# replace zsh backward search with peco on ctrl-r
function peco-search() {
  history | peco
  zle clear-screen
  zle beginning-of-line
}
bindkey "^r" peco-search
