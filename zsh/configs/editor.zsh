export VISUAL=vim
export EDITOR=$VISUAL

# Fix issue where react-script spawns the $EDITOR on exceptions. This causes
# major issues for non-gui editors like vim.
export REACT_EDITOR=none
