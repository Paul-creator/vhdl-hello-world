#!/bin/bash

script_dir=$(dirname "$(realpath "$0")")
# get env.vars
source "$script_dir/../env.env"

echo "Starting GHDL watch build for multiple files. Press Ctrl-C to stop."

# Function to run the build script
build() {
  clear
  echo "----------------------------------------"
  echo "Starting build cycle at $(date)"

  sh "$script_dir/build.sh"

  echo "Build cycle completed at $(date). Waiting for changes..."
  echo "----------------------------------------"
}

# Initial build
build

# Function to handle build triggers with debounce
debounce_build() {
  if [ "$BUILD_RUNNING" -eq 0 ]; then
    BUILD_RUNNING=1
    build
    sleep 1 # Debounce time in seconds
    BUILD_RUNNING=0
  fi
}

# Initialize debounce variable
BUILD_RUNNING=0

# Watch for changes in the src directory using fswatch
fswatch -o "$source_dir" | while read -r event; do
  echo "Detected change. Running build..."
  debounce_build
done
