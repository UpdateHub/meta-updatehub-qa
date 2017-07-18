# Reuse OE-Core recipe to avoid duplication of code
require recipes-core/images/core-image-minimal.bb

SUMMARY = "A small image used for UpdateHub Q/A test"

# Enable UpdateHub support
inherit updatehub-image

# Enable extra image features used for Q/A tests
EXTRA_IMAGE_FEATURES = "ssh-server-openssh empty-root-password allow-empty-password"
