bundle_path="$HOME"/.zshrc.bundles.local

ZGEN_RESET_ON_CHANGE=($bundle_path)

source "$HOME"/.zgen/zgen.zsh

if ! zgen saved; then
  echo "Generating a zgen save"
  [ -f $bundle_path ] && source $bundle_path
  zgen save
fi
