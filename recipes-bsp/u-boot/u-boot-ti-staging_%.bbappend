FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-change-dpll-per-to-160mhz.patch"

do_create_extlinux_config:append() {
    with open(cfile, 'a') as cfgfile:
        cfgfile.write('\tFDTOVERLAYS ../BB-SPIDEV0-00A0.dtbo\n')
}