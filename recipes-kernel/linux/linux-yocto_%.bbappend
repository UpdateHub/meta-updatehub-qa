FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:uh-qemu-armv5e = " \
    file://ubi.cfg \
    file://mtd.cfg \
"
