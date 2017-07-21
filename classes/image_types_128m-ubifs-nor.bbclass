inherit image_types

IMAGE_DEPENDS_128m-ubifs-nor = "virtual/bootloader:do_deploy"
IMAGE_TYPEDEP_128m-ubifs-nor_append = " ubifs"

# MTD partitioning has the following layout:
# 1m(u-boot-env),
# -(rootfs)
IMAGE_CMD_128m-ubifs-nor() {
	cat > ${WORKDIR}/ubimg-${IMAGE_NAME}.cfg <<EOF
[rootfsA]
mode=ubi
image=${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ubifs
vol_id=0
vol_size=54MiB
vol_type=dynamic
vol_name=rootfsa

[rootfsB]
mode=ubi
image=${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ubifs
vol_id=1
vol_size=54MiB
vol_type=dynamic
vol_name=rootfsb

[data]
mode=ubi
image=${WORKDIR}/data.ubifs
vol_id=2
vol_size=16MiB
vol_type=dynamic
vol_name=data
EOF

    rm -rf "${WORKDIR}/data" || true
    mkdir -p "${WORKDIR}/data"

    # Create data UBIFS image
    mkfs.ubifs -o "${WORKDIR}/data.ubifs" -r "${WORKDIR}/data" ${MKUBIFS_ARGS}

    ubinize -o ${WORKDIR}/rootfs.ubi ${UBINIZE_ARGS} ${WORKDIR}/ubimg-${IMAGE_NAME}.cfg

    # Create the maximum size of the NOR flash (128M) with all blocks
    # marked as empty (0xff)
    dd if=/dev/zero bs=1MiB count=128 \
        | tr '\000' '\377' \
        > ${WORKDIR}/nor

    dd if=${WORKDIR}/rootfs.ubi bs=1MiB seek=2 \
       of=${WORKDIR}/nor \
       conv=notrunc
	
	# Split NOR into 2 * 64MB files
    split -b 67108864 -a 1 -d ${WORKDIR}/nor ${WORKDIR}/nor

    # Copy U-Boot binary blob
    cp ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.elf ${WORKDIR}/u-boot.elf

	tar -C ${WORKDIR} -cf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.128m-ubifs-nor u-boot.elf nor0 nor1
}
