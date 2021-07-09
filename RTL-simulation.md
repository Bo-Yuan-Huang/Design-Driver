## RTL Simulation

### Steps overview

1. Compile the firmware program (in C) into MCS-51 binary.
2. Setup the system and concretize 8051 instruction ROM with the compiled program.
3. Run RTL simulation and view the waveform.

### Environment and dependencies

The compiler tool set for MCS-51 is located at `hw_sec_design_driver/sdcc-3.4.0/bin`. 

``` bash
export PATH=<path/to/repo>/hw_sec_design_driver/sdcc-3.4.0/bin:$PATH 
```

In recent 64-bits multi-arch Ubuntu systems (e.g., Focal), the tools may not run readily. To fix, install the i386 packages:

``` bash
dpkg --add-architecture i386
apt update
apt install libc6:i386 libncurses5:i386 libstdc++6:i386
```

Besides the compiler, we also need tools for RTL simulation. 
Here we'll use [Icarus Verilog](http://iverilog.icarus.com/) and [GTKWave](http://gtkwave.sourceforge.net/).

``` bash
apt install iverilog
apt install gtkwave
```

(You can also install them from source if preferred.)

### Compile the program

(Optional) Create a working directory so that intermediate files won't mess up the source files.
Following the original strucure to avoid too much modification:
  
``` bash
mkdir bench # working directory
mkdir bench/rom
mkdir bench/prog
mkdir bench/script
cd bench
```

First create the test program. 
Let's take the secureboot program as an example.

``` bash
cp <path/to/repo>/hw_sec_design_driver/secureboot8051/fw8051/uctrl/asm/secureboot.c prog/test.c
echo "#include \"rsa.c\"" >> prog/test.c # Combine all source into one single file to avoid linking
```

Compile the test program:

``` bash
sdcc prog/test.c -I <path/to/repo>/hw_sec_design_driver/secureboot8051/fw8051/uctrl/asm/
```

This should generate several files, including `test.ihx` which contains the image hex values.

### Prepare the verilog and concretize the ROM

There're several examples under `hw_sec_design_driver/secureboot8051/fw8051/uctrl/src` with names `make_*`.
Take `make_verilog` for example, which creates a system containing the aes, sha, rsa, and __two__ 8051 cores. 
(A slightly modified version `make_dc.sh` is available under the `script` directory.)
The programs for the two cores are stored in `oc8051_cxrom` and `oc8051_cxrom_copy`, respectively. 
See [CXROM code](https://github.com/Bo-Yuan-Huang/Design-Driver/blob/804819f9dd1a32db92fcc10d7748421348ec38b6/hw_sec_design_driver/secureboot8051/fw8051/uctrl/src/oc8051_cxrom.v#L17)

To convert the compiled program into Verilog format:

``` bash
<path/to/repo>/hw_sec_design_driver/secureboot8051/fw8051/uctrl/scripts/gen_rom.py test.ihx > rom/test.v
```

Just as a demonstration, let's make the two cores run the same program.

``` bash
cp rom/test.v rom/proc0_test.v
cp rom/test.v rom/proc1_test.v
```

Now we're ready to run the simulation.

``` bash
source script/make_dc.sh
./oc8051
```

