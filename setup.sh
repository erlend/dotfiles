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

relative_path=$(dirname `realpath "$0"` | sed "s|$HOME|~|")

[ -f hooks/pre-up ] && ./hooks/pre-up

for source in $(ls | grep -v '^\([A-Z]\|setup.sh\|hooks\)'); do
  destination="$HOME"/.$source

  if [ `readlink $destination` != "$relative_path/$source" ]; then
    mkdir -p ~/.dotfiles-backup
    mv $destination ~/.dotfiles-backup/

    ln -sf "$relative_path/$source" $destination
  fi
done

[ -f hooks/post-up ] && ./hooks/post-up

echo "Setup completed"
