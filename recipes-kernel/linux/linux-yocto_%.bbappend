FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append_uh-qemu-armv5e = " \
    file://ubi.cfg \
    file://mtd.cfg \
"
