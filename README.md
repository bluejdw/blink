# Blink

System Software for VA416xx Board Bringup (headless, just GNU+JLinkGDBServer)

## Caveat

- It's VA416xx_Blinky.. But made to work in a headless build (GNU ARM toolchain and JLinkGDBServer) in the shell. NOT IDE.
- It has my revision to the startup.S   Adapted from the MDK (uVision) format.
- It has defanged the WDT Interrupt handler.
- It has commented out ANY/ALL dbg print statements.
- Do not expect SEGGER_RTT to function.  It's not crucial.
- The same `CFLAGS` used in the MDK build are used here.
- There is no `MICROLIB`

## Known Issues

1.  The software can be debugged, but after a cold POR, the software is not running.  The load doesn't put it into NVM
2.  Aside from the Makefile chicanery, there's an issue in that the build is a bit complicated to **define** but that
will be fixed when it's converted to `CMake`.  It makes no difference at this point.


## Tools Needed

1. GNU ARM Tool-chain [Download GNU ARM Tool-chain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads)
2. SEGGER JLink Software and Documentation. **Uninstall any prior releases** [Download SEGGER JLink](https://www.segger.com/downloads/jlink/)


## Quick Primer

- Open two terminals (two bash shells)

Know the path of your GNU-ARM toolchain. Modify your shell startup `~/.bashrc` etc.. to make the `TOOLPATH` setting 
automatic, if you wish.  I've included the literal setting below.


### Terminal 1
- In terminal 1, build the software

```
$ export TOOLPATH=/path/to/your/arm-none-eabi-VERSION/bin
$ cd main
$ make
```

- In that shell you BUILT the software, stay in the `main` directory
- Run `bash setup.sh -s`

```
$ bash setup.sh -s
```
Leave it running.

In case of crash/failure, you may need to restart the `JLinkGDBServer` via just `bash setup.sh -s`

### Terminal 2

In terminal 2, we are running the `gdb` client.  We let the `setup.sh` start it for us.

Navigate to the `main` directory.

(You already built the software.  The image is in `bin/image.elf`)

Run the `setup.sh` for client as follows:

```
$ export TOOLPATH=/path/to/your/arm-none-eabi-VERSION/bin
$ cd main
$ bash setup -d -i bin/image
```

- The `-d` flag tells `setup.sh` to invoke the DEBUG CLIENT, aka `gdb`.
- The `-i` flag tells `setup.sh` to look for that particular image file.
- `bash setup.sh` with NO arguments just prints the manual page for the script.
- `chmod` the script if you wish and add to the path if you do not want to run it via `bash setup.sh`
(Your decision. Doesn't matter.)
- Assert `y` (load file, load symbols, etc.. ) and then `c` to run to breakpoint set in `Reset_Handler`


