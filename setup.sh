#!/bin/sh

relative_path=$(dirname `realpath $0` | sed "s|$HOME|~|")

if [ "$1" != "-f" ]; then
  cat > /dev/stdout <<END_OF_HELP
This script will create symlinks to each of the dotfiles in your home directory.

It takes an optional '-f' operator which will overwrite any files without asking
first and skip this message.

Hit ENTER to continue or Ctrl+C to cancel
END_OF_HELP
  read
fi

[ -f hooks/pre-up ] && ./hooks/pre-up

for source in $(ls | grep -v '^\([A-Z]\|setup.sh|hooks\)'); do
  destination=~/.$source

  if [ -f $destination ]; then
    if [ "$1" != "-f" ]; then
      printf "$destination already exists. Do you wish to overwrite? (Y/n) "
      read overwrite
    fi

    if [ "$1" = "-f" ] || [ "$overwrite" = "Y" ] || [ -z $overwrite ]; then
      rm -f $destination
    else
      continue
    fi
  fi

  echo $destination
  ln -s $relative_path/$source $destination
done

[ -f hooks/post-up ] && ./hooks/post-up

echo "Setup completed"
