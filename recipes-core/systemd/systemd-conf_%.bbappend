FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://20-wired.network"

do_configure[noexec] = '1'

do_install:append() {
    install -Dm 0644 ${WORKDIR}/20-wired.network ${D}${sysconfdir}/systemd/network/20-wired.network
}

FILES:${PN} += "${sysconfdir}/systemd/network/20-wired.network"
