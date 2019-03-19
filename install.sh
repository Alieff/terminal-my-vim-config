# create directory to store data
installer_path="$(dirname ${BASH_SOURCE[0]})"
destination_path="$HOME/.vimrc"
script_name='vimrc'
mkdir -p "$HOME/.vim/undodir"

# copy the script 
if [ ! -f "$destination_path" ]; then
  cp "$installer_path/$script_name" "$destination_path"
  echo ".vimrc installed, now you can restart your vim to check it :)"
else
  echo ".vimrc already exists, please remove/move manually first"
fi

