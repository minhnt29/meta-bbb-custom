#!/bin/sh
set -e

G=/sys/kernel/config/usb_gadget/g1

# Cleanup old gadget if exists
if [ -d "$G" ]; then
    echo "" > "$G/UDC" 2>/dev/null || true
    rm -rf "$G"
fi

# Create gadget
mkdir -p "$G"
echo 0x1d6b > "$G/idVendor"   # Linux Foundation
echo 0x0104 > "$G/idProduct"  # ECM gadget

mkdir -p "$G/strings/0x409"
echo "1234567890" > "$G/strings/0x409/serialnumber"
echo "BeagleBone" > "$G/strings/0x409/manufacturer"
echo "USB Ethernet Gadget" > "$G/strings/0x409/product"

mkdir -p "$G/configs/c.1"
mkdir -p "$G/configs/c.1/strings/0x409"
echo "ECM Config" > "$G/configs/c.1/strings/0x409/configuration"

# ECM function
mkdir -p "$G/functions/ecm.usb0"
echo "02:00:00:00:00:01" > "$G/functions/ecm.usb0/host_addr"
echo "02:00:00:00:00:02" > "$G/functions/ecm.usb0/dev_addr"

ln -s "$G/functions/ecm.usb0" "$G/configs/c.1/"

# Bind UDC
UDC=$(ls /sys/class/udc | head -n1)
echo "$UDC" > "$G/UDC"

