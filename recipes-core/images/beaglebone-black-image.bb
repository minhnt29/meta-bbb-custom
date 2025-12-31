SUMMARY = "Custom image for BeagleBone Black with UART console and USB Ethernet"
LICENSE = "MIT"

inherit core-image

IMAGE_INSTALL = "\
    packagegroup-core-boot \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    usb-gadget \
    dnsmasq \
    systemd-serialgetty \
    iproute2 \
    openssh \
    openssh-sshd \
    openssh-sftp-server \
    nano \
    libstdc++ \
"

IMAGE_FEATURES += "allow-root-login"

