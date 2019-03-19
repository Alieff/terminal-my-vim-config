installer_path="$(dirname ${BASH_SOURCE[0]})"
destination_path="$HOME/.vimrc"
script_name='vimrc'


# remove executable
"rm" "$destination_path"
echo "executable removed" : "rm $destination_path" 



