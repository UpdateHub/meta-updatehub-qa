FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://20-wired.network"

do_configure[noexec] = '1'

do_install_append() {
    install -Dm 0644 ${WORKDIR}/20-wired.network ${D}${sysconfdir}/systemd/network/20-wired.network
}

FILES_${PN} += "${sysconfdir}/systemd/network/20-wired.network"
