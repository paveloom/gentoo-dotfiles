#!/usr/bin/env bash

# export VK_LOADER_DEBUG=driver
# export VK_ADD_DRIVER_FILES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json

ENABLE_FEATURES=(
    # Vulkan
    # DefaultANGLEVulkan
    # VulkanFromANGLE
)

DISABLE_FEATURES=(
    # VaapiVideoDecoder
    # VaapiVideoDecodeLinuxGL
)

IFS=,
FLAGS=(
    # --disable-gpu-memory-buffer-video-frames
    --enable-features=$(echo "${ENABLE_FEATURES[*]}")
    --disable-features=$(echo "${DISABLE_FEATURES[*]}")
)

# export QSG_RHI_BACKEND=vulkan
export QTWEBENGINE_CHROMIUM_FLAGS="${FLAGS[@]}"

exec falkon "$@"
