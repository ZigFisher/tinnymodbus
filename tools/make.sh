#!/bin/bash
#
# apt-get install libmodbus5 libmodbus-dev

gcc -o modbus-flash modbus-flash.c -Wall -Werror
gcc -o modbus-cli modbus-cli.c $(pkg-config --cflags --libs libmodbus)

strip modbus-flash modbus-cli
