FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

dirs755:append:uh-qemu-armv5e = " /data"
dirs755:append:uh-qemu-i386   = " /boot/efi /data"
dirs755:append:uh-qemu-x86-64 = " /boot/efi /data"
