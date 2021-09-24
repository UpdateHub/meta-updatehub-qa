FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:uh-qemu-armv5e = " file://fw_env.config"
