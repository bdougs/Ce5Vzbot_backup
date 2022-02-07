sudo service klipper stop
cd ~/klipper
git pull

make clean KCONFIG_CONFIG=config.btt-skr-turbo-v1.4
#make menuconfig KCONFIG_CONFIG=config.btt-skr-turbo-v1.4
make KCONFIG_CONFIG=config.btt-skr-turbo-v1.4
./scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_lpc1769_14C0001927903CAFD3D56D5CC02000F5-if00 btt-skr-turbo-v1.4
./scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_lpc1769_11B0FF0BA39869AF1F4F405EC42000F5-if00 btt-skr-turbo-v1.4

make clean KCONFIG_CONFIG=config.rpi
#make menuconfig KCONFIG_CONFIG=config.rpi
make flash KCONFIG_CONFIG=config.rpi

sudo service klipper start