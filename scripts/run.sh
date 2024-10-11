script_dir=$(dirname "$(realpath "$0")")
# get env.vars
source "$script_dir/../env.env"

sh $script_dir/build.sh

ghdl -r --std=93 --workdir="$build_dir" "$entityToElaborate" --wave="$wave_file_path"
