#!/bin/sh
#
#
# Switch into bootloader mode
./modbus-cli -r -d /dev/ttyUSB0 -b 38400 -s 1 -f 6 -a 0 -n 1 -v 1
#
echo
echo "=========================================================="
echo
#
sleep .5
#
# Flash firmware over rs485 wires
./modbus-flash 0x01 ../main.hex
#
sleep .5
#
echo
echo "=========================================================="
echo
#
# Switch back to main mode
./modbus-cli -r -d /dev/ttyUSB0 -b 9600 -s 1 -f 6 -a 0 -n 1 -v 0
#
echo
echo "=========================================================="
echo
#
# Request for test
./modbus-cli -r -d /dev/ttyUSB0 -b 38400 -s 1 -f 3 -a 2 -n 1
./modbus-cli -r -d /dev/ttyUSB0 -b 38400 -s 1 -f 3 -a 3 -n 2
./modbus-cli -r -d /dev/ttyUSB0 -b 38400 -s 1 -f 3 -a 4 -n 2
