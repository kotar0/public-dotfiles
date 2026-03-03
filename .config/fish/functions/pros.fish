function pros
    cd ~/projects && cd $(ls -d */ | sed 's|/||' | fzy)
end
