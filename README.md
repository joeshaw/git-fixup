# git-fixup

Fighting the copy-paste element of your rebase workflow.

`git fixup <ref>` is simply an alias for `git commit --fixup <ref>`. That's
just a convenience feature that can be also be used to trigger tab completion.

The magic is in plain `git fixup` without any arguments.  It finds which
lines/files you have changed, uses git blame/log to find the most recent commits
that touched those lines/files, and displays a list for you to pick from. This
is a convenient alternative to manually searching through the commit log and
copy-pasting the commit hash.

<img src="https://cloud.githubusercontent.com/assets/484559/6431298/344ded94-c023-11e4-8b82-314387ceeee3.png" alt="git fixup" width="500px" />

## Install

    brew install git-fixup

-or-

    make install

    make install-zsh

-or-

Copy the program and completion script into your `$PATH` and `$fpath` respectively.

## Usage

For this tool to make any sense you should enable the `rebase.autosquash` setting in the git config.


```bash
# Select the changes that should be part of the fixup.
$ git add -p

# Output a list of commits that the staged changes are likely a fixup of.
$ git fixup

# Create a fixup!-<commit> of the given ref. If you have installed the zsh script
# you can cycle through the list of fixup candidates with tab completion.
$ git fixup <ref>

# Commit rebased into the selected commit as a fixup.
$ git rebase -i ...
```

Tab completion
--------------

The suggestions for the tab completion is the suggested fixup bases as
generated by running the tool without any arguments.

To be able to tab complete the command itself add a line like this to your zsh
configuration::

    zstyle ':completion:*:*:git:*' user-commands fixup:'Create a fixup commit'


## Changelog

The chronicle of major changes and changes to behaviour of the program follows,
for a full list of changes refer to the commit history.

### 1.0.0 / 2015-02-24

- Dubbing the script version 1.0.0
- Refactoring
- Ignore upstream branch when it is at the same commit as HEAD

### 2014-09-14

- Use most recent commit to modified files as an additional source of fixup
  candidates
- Commits already in upstream branch are excluded from candidates
- Boundary commits are excluded from candidates

### 2013-06-20

- Initial release


## Authors

- Rickard Dybeck ([alde](https://github.com/alde))
- Cristiano Giuffrida ([cgiuffr](https://github.com/cgiuffr))
- David Keijser ([keis](https://github.com/keis))
- Tiago Ribeiro ([fixe](https://github.com/fixe))
