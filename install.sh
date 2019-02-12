installer_path="$(dirname ${BASH_SOURCE[0]})"
destination_path="$HOME/.vimrc"


if [ ! -f "$destination_path" ]
  cp "$installer_path" "$destination_path"
else
  echo ".vimrc already exists, please remove/move manually first"
fi

