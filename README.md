# Ce5Vzbot_backup
After hard reset - update shell command .py https://github.com/th33xitus/kiauh/blob/master/resources/gcode_shell_command.py

autoupdate firmware

cd ~/klipper
sudo bash update-all.sh
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
