LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
PE = "1"

FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot-updatehub:"

# We use the revision in order to avoid having to fetch it from the
# repo during parse
SRCREV = "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"

SRC_URI = "git://git.denx.de/u-boot.git \
    file://0001-Initilize-IDE-prior-environment.patch \
    file://0002-qemu-x86_efi_payload32_defconfig-Add-FS_UUID-command.patch \
    file://0003-UpdateHub-Add-common-header.patch \
    file://0004-qemu-x86-Enable-use-of-UpdateHub.patch \
"

S = "${WORKDIR}/git"
