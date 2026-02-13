function __gog_complete
  set -l words (commandline -opc)
  set -l cur (commandline -ct)
  set -l cword (count $words)
  if test -n "$cur"
    set -a words $cur
  end
  gog __complete --cword $cword -- $words
end

complete -c gog -f -a "(__gog_complete)"
