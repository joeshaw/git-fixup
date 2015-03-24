#compdef git-fixup
local lines commits

lines=(${(f)"$(git fixup)"})
if test $? -ne 0; then
    compadd ()
    return
fi
commits=(${lines[@]%% *})

compadd -l -d lines -a -- commits
