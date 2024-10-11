# VHDL Project: Hello World Template

<!--toc:start-->

- [VHDL Project: Hello World Template](#vhdl-project-hello-world-template)
  - [Project Structure](#project-structure)
  - [Requirements](#requirements)
  - [How to Build and Run the Project](#how-to-build-and-run-the-project)
  - [VHDL Files](#vhdl-files)
  - [Configuration](#configuration)
  - [env.env Configuration Details](#envenv-configuration-details)
  <!--toc:end-->

This is a template VHDL project that includes basic scripts for building, running, and simulating a "Hello World" VHDL design.

## Project Structure

```
.
??? scripts/                # Directory containing various utility scripts
?   ??? build.sh            # Script to build the VHDL project
?   ??? openWave.sh         # Script to open waveform viewer (likely for simulation results)
?   ??? run.sh              # Script to run the VHDL simulation
?   ??? watch.sh            # Script to watch for file changes (e.g., for continuous integration)
??? src/                    # Directory containing VHDL source files
?   ??? hello_world.vhd     # The main VHDL file for the Hello World design
?   ??? tb_hello_world.vhd  # Testbench for the Hello World design
??? env.env                 # Environment configuration file
??? vhdl_ls.toml            # VHDL Language Server configuration file
```

## Requirements

To work with this project, you will need:

- A VHDL simulator (e.g. Neovim, ModelSim, GHDL)
- A waveform viewer (e.g., GTKWave) for analyzing simulation results
- A POSIX-compatible shell to run the provided scripts

## How to Build and Run the Project

1. **Build the Project:**

   Run the following command to compile the VHDL design:

   ```bash
   ./scripts/build.sh
   ```

2. **Run the Simulation:**

   To simulate the design and see the results, run:

   ```bash
   ./scripts/run.sh
   ```

3. **View Waveforms:**

   If you want to inspect the simulation waveforms, use:

   ```bash
   ./scripts/openWave.sh
   ```

4. **Watch for Changes:**

   The following script watches for file changes and rebuilds the project:

   ```bash
   ./scripts/watch.sh
   ```

## VHDL Files

- `hello_world.vhd`: This is the main VHDL file, containing a simple "Hello World" logic.
- `tb_hello_world.vhd`: This is the testbench used to simulate and verify the `hello_world.vhd` design.

## Configuration

- `env.env`: This file contains environment variables and settings required for building and simulating the project.
- `vhdl_ls.toml`: This is a configuration file for the VHDL Language Server to provide features such as code linting and auto-completion in supported editors. (Used by the rust_hdl language server in Neovim)

## env.env Configuration Details

The `env.env` file specifies important environment variables and settings required for the project's build and simulation processes:

- **Files to Build**: The files within the source directory (`src`) that will be included in the build process.

  ```bash
  files_to_build_path_within_src=(hello_world.vhd tb_hello_world.vhd)
  ```

- **Build Directory**: The directory where the compiled files and other build artifacts will be stored.

  ```bash
  build_dir="$script_dir/../build"
  ```

- **Source Directory**: The directory containing the VHDL source files.

  ```bash
  source_dir="$script_dir/../src"
  ```

- **Entity to Elaborate**: The top-level entity to simulate, in this case, the testbench `tb_hello_world`.

  ```bash
  entityToElaborate="tb_hello_world"
  ```

- **Waveform File Path**: The path where the simulation waveform file (`wave.ghw`) will be saved.

  ```bash
  wave_file_path="$build_dir/wave.ghw"
  ```
