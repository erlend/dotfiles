# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# load ASDF, falling back to rbenv if not available
if [ -f "$HOME/.asdf/asdf.sh" ]; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi

# support asdf installed with homebrew
if [ -d "/usr/local/opt/asdf" ]; then
  . /usr/local/opt/asdf/asdf.sh
  . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
fi

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

export -U PATH
