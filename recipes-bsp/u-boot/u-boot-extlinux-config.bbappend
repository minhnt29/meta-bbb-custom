FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://extlinux.conf.append"

do_install:append() {
    if [ -f ${D}/boot/extlinux/extlinux.conf ]; then
        # Backup original
        cp ${D}/boot/extlinux/extlinux.conf ${D}/boot/extlinux/extlinux.conf.orig
        
        # Tìm dòng có "append" và thêm fdtoverlays trước dòng đó
        sed -i '/append root=/i\  fdtoverlays /boot/overlays/BB-SPIDEV0-00A0.dtbo' \
            ${D}/boot/extlinux/extlinux.conf
    fi
}