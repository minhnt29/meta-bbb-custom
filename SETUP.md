# Setup Instructions for BeagleBone Black Custom Image

## Prerequisites

1. Yocto Project Kirkstone setup
2. Required layers:
   - meta
   - meta-poky
   - meta-yocto-bsp (or meta-ti for BeagleBone support)
   - meta-openembedded/meta-networking

## Setup Steps

### 1. Initialize Build Environment

```bash
cd /path/to/poky-kirkstone
source oe-init-build-env build
```

### 2. Add Layer to bblayers.conf

Add this line to `conf/bblayers.conf`:

```bitbake
/path/to/poky-kirkstone/meta-bbb-custom \
```

### 3. Configure Machine

In `conf/local.conf`, set:

```bitbake
MACHINE = "beaglebone"
```

### 4. Build Image

```bash
bitbake beaglebone-black-image
```

### 5. Flash to SD Card

The image will be in:
```
build/tmp/deploy/images/beaglebone/beaglebone-black-image-beaglebone.wic
```

Flash using:
```bash
sudo dd if=beaglebone-black-image-beaglebone.wic of=/dev/sdX bs=1M status=progress
```

## Features

### UART Console
- Connect USB-to-Serial adapter to J1 header (pins 1, 4, 5, 6)
- Baud rate: 115200
- Login: root (no password by default)

### USB Ethernet
- Connect USB cable to BeagleBone USB port
- BeagleBone will appear as USB Ethernet device
- BeagleBone IP: 192.168.7.2
- Your computer will get: 192.168.7.1
- DNS server: 192.168.7.2

### SSH Access
- SSH server is enabled and running
- Root login is allowed (no password by default)
- Connect via: `ssh root@192.168.7.2`

## Testing

1. Boot BeagleBone with SD card
2. Connect UART: You should see login prompt
3. Connect USB: Check network interface on your computer
4. Ping test: `ping 192.168.7.2`
5. SSH: `ssh root@192.168.7.2` (no password by default)

## Network Configuration

After connecting USB cable:
- BeagleBone IP: `192.168.7.2`
- Your computer IP: `192.168.7.1` (assigned by DHCP)
- Gateway: `192.168.7.2`
- DNS: `192.168.7.2`

You can now:
- SSH: `ssh root@192.168.7.2`
- SCP files: `scp file.txt root@192.168.7.2:/tmp/`
- Browse web if any service is running on BeagleBone

