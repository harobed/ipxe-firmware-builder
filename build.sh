#!/bin/bash

cd /usr/local/src || return

if [[ ! -d /usr/local/src/ipxe/src/ ]]; then
  git clone git://git.ipxe.org/ipxe.git
fi

# iPXE options name
build_options=(
"DOWNLOAD_PROTO_HTTPS"
"IMAGE_NBI"
"IMAGE_ELF"
"IMAGE_MULTIBOOT"
"IMAGE_PXE"
"IMAGE_SCRIPT"
"IMAGE_BZIMAGE"
"IMAGE_COMBOOT"
"IMAGE_EFI"
"IMAGE_SDI"
"IMAGE_PNM"
)


# build_states match with build_options same index define if value must be enable or disable
# 1 => enable
# 0 => disable
build_states=(
1
1
1
1
1
1
1
1
1
1
)

if [[ "${#build_options[@]}" -ne "${#build_states[@]}" ]]; then
    printf '\e[1;36m%-6s\e[m\n' "Array length mismatch!"
    exit 1
fi

for i in "${!build_options[@]}"; do
    if [[ ${build_states[$i]} -eq 1 ]]; then
        printf '%s\n' "${build_options[$i]} enable"
        sed -i "s|.*${build_options[$i]}.*|#define ${build_options[$i]}|g" /usr/local/src/ipxe/src/config/general.h
    else
        printf '%s\n' "${build_options[$i]} disable"
        sed -i "s|.*${build_options[$i]}.*|//#define ${build_options[$i]}|g" /usr/local/src/ipxe/src/config/general.h
    fi
done


cd ipxe/src/ || return
make
