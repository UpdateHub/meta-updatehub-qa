FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_uh-qemu-i386   = " file://fw_env.config"
SRC_URI_append_uh-qemu-armv5e = " file://fw_env.config"
