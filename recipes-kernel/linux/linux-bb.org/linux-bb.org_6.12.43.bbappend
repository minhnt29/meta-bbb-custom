FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://PB2-SPI2.dtso \
    file://spi2.patch \
"

# Ensure dtbo build flags if required
BBCLASSEXTEND = ""
