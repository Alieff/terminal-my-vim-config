installer_path="$(dirname ${BASH_SOURCE[0]})"
destination_path="$HOME/.vimrc"
script_name='vimrc'



if [ ! -f "$destination_path" ]; then
  cp "$installer_path/$script_name" "$destination_path"
else
  echo ".vimrc already exists, please remove/move manually first"
fi

