script_dir=$(dirname "$(realpath "$0")")
# get env.vars
source "$script_dir/../env.env"

gtkwave $wave_file_path
