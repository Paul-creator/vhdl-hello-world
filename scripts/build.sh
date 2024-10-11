#!/bin/zsh

script_dir=$(dirname "$(realpath "$0")")
# get env.vars
source "$script_dir/../env.env"

# Create the build directory if it doesn't exist
mkdir -p "$build_dir"

# Loop over each file and analyze it with GHDL
for file in "${files_to_build_path_within_src[@]}"; do
  file_path="$source_dir/$file"

  # Check if the file exists
  if [[ -f "$file_path" ]]; then
    echo "Analyzing $file..."
    echo "ghdl -a --std=93 --workdir=\"$build_dir\" \"$file_path\""
    ghdl -a --std=93 --workdir="$build_dir" "$file_path"

    # Check if the analysis was successful
    if [[ $? -ne 0 ]]; then
      echo "❌ Error: Failed to analyze $file."
      exit 1
    fi
  else
    echo "❌ Error: File $file_path does not exist."
    exit 1
  fi
done

# Elaborate the top entity
echo "Elaborating entity $entityToElaborate..."
echo "ghdl -e --std=93 --workdir=\"$build_dir\" \"$entityToElaborate\""
ghdl -e --std=93 --workdir="$build_dir" "$entityToElaborate"

# Check if elaboration was successful
if [[ $? -ne 0 ]]; then
  echo "❌ Error: Failed to elaborate entity $entityToElaborate."
  exit 1
fi

echo ""
echo "✅ Build successful. You can now run the simulation using:"
echo "ghdl -r --std=93 --workdir=\"$build_dir\" $entityToElaborate"
