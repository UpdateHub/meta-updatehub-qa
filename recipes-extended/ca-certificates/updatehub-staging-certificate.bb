SUMMARY = "updatehub - Staging Management Server Certificate"
SECTION = "base"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = "file://staging.updatehub.io.crt"

S = "${WORKDIR}/sources"
UNPACKDIR = "${S}"

inherit allarch

do_install() {
    install -Dm 644 staging.updatehub.io.crt \
                    ${D}/usr/local/share/ca-certificates/staging.updatehub.io.crt
}

FILES:${PN} += "/usr/local/share/ca-certificates"
RDEPENDS:${PN} += "ca-certificates"
