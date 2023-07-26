# Ce5Vzbot_backup
########### Hardware ###########

MCU
https://docs.vorondesign.com/build/software/skr13_klipper.html
~~~~~~~~~~~~~
BTT SKR Turbo 1.4 LPC176x
lpc1769 (120 Mhz)
Ensure that “Target board uses Smoothieware bootloader” is enabled
Ensure that “Use USB for communication (instead of serial)” is enabled
	[mcu]
serial: /dev/serial/by-id/usb-Klipper_lpc1769_14C0001927903CAFD3D56D5CC02000F5-if00
	[mcu 2]
serial: /dev/serial/by-id/usb-Klipper_lpc1769_11B0FF0BA39869AF1F4F405EC42000F5-if00
~~~~~~~~~~~~~~~~~~~
Toolhead
https://github.com/bigtreetech/EBB/tree/master/EBB%20CAN%20V1.0%20(STM32F072)
https://github.com/maz0r/klipper_canbus/blob/main/toolhead/ebb36-42_v1.0.md
	
	EBB36 
	STM32F072
	8KiB offset
	8 MHz clock
	canbus UUID: 6015553193ee, Application: CanBoot

autoupdate firmware command
~~~~~~~~~~~~~~~~~~~~~
cd ~/klipper
sudo bash update-all.sh
~~~~~~~~~~~~~~~~~~~~~~
autoupdate firmware code
~~~~~~~~~~~~~~~~~~~~~~
sudo service klipper stop
cd ~/klipper
git pull

make clean KCONFIG_CONFIG=config.btt-skr-turbo-v1.4
make menuconfig KCONFIG_CONFIG=config.btt-skr-turbo-v1.4
make KCONFIG_CONFIG=config.btt-skr-turbo-v1.4
./scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_lpc1769_14C0001927903CAFD3D56D5CC02000F5-if00 btt-skr-turbo-v1.4
./scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_lpc1769_11B0FF0BA39869AF1F4F405EC42000F5-if00 btt-skr-turbo-v1.4

make clean KCONFIG_CONFIG=config.rpi
make menuconfig KCONFIG_CONFIG=config.rpi
make flash KCONFIG_CONFIG=config.rpi

#toolheadboard
make clean 
make menuconfig 
make 
python3 ~/CanBoot/scripts/flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u c72b107b904d

sudo service klipper start
~~~~~~~~~~~~~~~~~~~~~~~~~~
After hard reset - update shell command .py https://github.com/th33xitus/kiauh/blob/master/resources/gcode_shell_command.py
