#!/bin/bash

printHelp() {
   cat  <<EOM
SETUP        Board Debug Setup Manual

NAME
    setup.sh

SYNOPSIS

    setup [ --help ]

    setup [ -e ENDIAN] 
             [ -S | --speed SPEED ]
             [ -D | --device DEVICE_ID ]
             [ -P | --port GDB_SERVER_PORT_NUMBER ]
             [ -d | --debug [ -i | --image IMAGE_FILE ] 
             [ -g | --gdb DEBUGGER ] ]

    Server Mode vs Debug Mode
    setup [ -s | --server ] | [ -d | --debug ]

DESCRIPTION
        
    This shell script helps the user setup the target for debugging.

    There are options to:

         Server Mode:

             - initiate a debug-server (GBDServer) for the debugging session.

         Client Mode:

             - initiate the gdb client connecting to the gdb server.

OPTIONS

     Defaults:

          -e big
          -S 1000
          -P 2331
          -i image.elf
          -g `which arm-none-eabi-gdb`
      
     Generic

     --help    Output this manual page


     -P | --port     Set the GDBServer Listen port number.

     -D | --device   Set the DEVICE_ID.

     -S | --speed    Set the clock speed of the adapter.

     Files

     -i | --image  Set the filename of the image being debugged.

                   This will affect the flashing or any other 
                   command that is involved with the file.  For
                   example, if --image FILE is used, then that FILE
                   will be flashed if --flash is applied and that FILE
                   will be used if --debug is applied.
 
     Debugging
    
     -g | --gdb DEBUGGER

                   If a different 'gdb' program is needed, use this option
                   to specify the path to the gdb needed.  This has the 
                   effect of running DEBUGGER instead of the default
                   arm-none-eabi-gdb.
                   

     -s | --server Cause the invocation of the GDBServer on the host
                   system to connect to the target device and be
                   ready to accept gdb commands from the user debug
                   software (gdb)

     -d | --debug  Cause the invocation of the GDB client on the host.
                   This client will be prescribed to connect to the
                   gdb server.


ENVIRONMENT VARIABLES

    If the program 'setup' is not found in your path, add it to your path:

    $ export PATH=.:$PATH

    That puts the current directory '.' in your PATH.


DEPENDENCIES

      This script expects that the host system has the following 
      packages installed:

      REQUIRED:

         J-Link tools from SEGGER

         https://www.segger.com/downloads/jlink/#J-LinkSoftwareAndDocumentationPack

         GNU ARM Tool-chain 
         https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads
         Note: where you place the toolchain is defined in TOOLPATH in the Makefile

      DO NOT INSTALL:
         libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib


SETUP        Board Debug Setup Manual
EOM
}


## MAIN 

if [ $# -lt 1 ]; then
    printHelp
    exit 0
fi

Mode="none"
ENDIAN=little

# which client?
GDB=$(which arm-none-eabi-gdb)

# which server?
GDBSERVER=$(which JLinkGDBServer)

# Default iamge file, TBD
S_DEBUG_IMAGE="image.elf"
# debug port for gdb-server
S_DEBUG_SERVER_PORT="2331"

# The default device is Vorago VA416xx Cortex-M4
S_DEVICE_ID="Cortex-M4"

# 1 Mhz
S_DEBUG_SPEED="1000"

while [ $# -gt 0 ]
do
   key="$1"
   case $key in
       -S|--speed)
          shift;
          S_DEBUG_SPEED="$1"
          shift
       ;;
       -P|--port)
          shift;
          S_DEBUG_SERVER_PORT="$1"
          shift;
       ;; 
       -D|--device)
          shift
          S_DEVICE_ID="$1"
          shift
       ;;

       -g|--gdb)
          shift
          GDB="$1"
          shift
          echo "Using debugger: ${GDB}"
          ;;
       -i|--image)
       shift
       image="$1"
       shift
       S_DEBUG_IMAGE="$image"
       echo "Using image $S_DEBUG_IMAGE"
       USING_CMD_IMAGE="set"
       ;;
       -s|--server)
       Mode="server"
       shift
       ;;
       -d|--debug)
       Mode="client"
       shift
       ;; 
       -h|--help)
       printHelp
       shift
       ;;
       *)
           echo "Unknown option: $key"
           shift
   esac
done



## Test if tools are present.
case $Mode in
       server)
          if [ ! -x "$GDBSERVER" ]; then
              echo "JLinkGDBServer is not installed.  View manual page."
              exit 1
          fi
          "${GDBSERVER}" -nogui -nolocalhostonly -jlinkscriptfile ./jlink/JLinkSettings.JLinkScript -endian little -If SWD -Speed ${S_DEBUG_SPEED}  -Port ${S_DEBUG_SERVER_PORT} -Device ${S_DEVICE_ID} -if SWD -log server.out
          exit 0
       ;;
       client)
       if [ ! -x "$GDB" ]; then
           echo "Cannot locate GDB-client.  Check usage."
           echo "Check you set PATH for where you stored your gdb"
           echo "The gdb tool is part of the ARM GNU toolkit"
           echo "Did you download and install it?"
           exit 1
       fi
       if [ -z "${S_DEBUG_IMAGE}" ]; then
          if [ "${USING_CMD_IMAGE}" -eq "set" ]; then
           echo "WARNING: the debug image ${S_DEBUG_IMAGE} is NOT FOUND. Check command line."
           exit 0
          fi
       else
          if [ ! -f "${S_DEBUG_IMAGE}" ]; then
           echo "WARNING: the debug image ${S_DEBUG_IMAGE} is NOT FOUND. Check command line."
          fi
       fi 
       ${GDB} -ex "target extended-remote localhost:${S_DEBUG_SERVER_PORT}"  -ex "file ${S_DEBUG_IMAGE}" -ex "sym ${S_DEBUG_IMAGE}" -ex "load ${S_DEBUG_IMAGE}" -ex "b Reset_Handler"
          exit 0
       ;;
       *)
            echo "Error:  No mode was selected."
            echo "Missing option of --debug OR --server.  PICK ONE"
       ;;
esac

