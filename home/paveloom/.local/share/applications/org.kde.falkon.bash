#!/usr/bin/env bash

# export VK_LOADER_DEBUG=driver
# export VK_ADD_DRIVER_FILES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json

export QSG_RHI_BACKEND=vulkan

exec falkon "$@"
