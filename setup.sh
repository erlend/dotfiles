#!/bin/sh

if [ "$1" != "-f" ]; then
  cat << END_OF_HELP
This script will create symlinks to each of the dotfiles in your home directory.

Copies of any existing files will be created in ~/.dotfiles-backup. You can omit
this warning by running "./setup.sh -f"

Hit ENTER to continue or Ctrl+C to cancel
END_OF_HELP
  read
fi

realpath() {
  echo "$PWD/${1#./}"
}

#dotfiles_path=$(dirname `realpath "$0"` | sed "s|$HOME|~|")
dotfiles_path=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)

[ -f hooks/pre-up ] && ./hooks/pre-up

for source in $(ls | grep -v '^\([A-Z]\|setup.sh\|hooks\)'); do
  destination=~/.$source
  destination_fullpath=$(readlink $destination | sed "s|$HOME|~|")

  source=$dotfiles_path/$source

  if [ "$destination_fullpath" != "$source" ]; then
    mkdir -p "$HOME"/.dotfiles-backup
    [ -f "$destination" ] && mv "$destination" ~/.dotfiles-backup/

    ln -sf "$source" "$destination"
  fi
done

[ -f hooks/post-up ] && ./hooks/post-up

echo "Setup completed"
