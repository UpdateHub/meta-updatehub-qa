# Copyright (C) 2012-2020 O.S. Systems Software LTDA.
# Released under the MIT license (see COPYING.MIT for the terms)

LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"

SRC_URI = "git://github.com/updatehub/u-boot-updatehub;protocol=https;branch=${SRCBRANCH}"

SRCREV = "d228123da84dfa8fa52dcaf7f780fa5c183b8126"
SRCBRANCH = "2020.01+updatehub"

PE = "1"
PV .= "+git${SRCPV}"

S = "${WORKDIR}/git"
