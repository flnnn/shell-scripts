#!/usr/bin/env bash
#
# creates a base directory for CTF engagements on Hack The Box and Try Hack Me

BASE_DIR="${1}"

if [[ -z "${BASE_DIR}" ]]; then
    echo "Usage: ${0} <base directory>"
    exit 1
fi

CTF_DIR="${BASE_DIR}/Capture The Flag"

if [[ ! -d "${CTF_DIR}" ]]; then
    mkdir "${CTF_DIR}"
fi

cd "${CTF_DIR}"

platforms=("Hack The Box" "Try Hack Me")

for platform in "${platforms[@]}"; do
    if [[ ! -d "${CTF_DIR}/${platform}" ]]; then
        mkdir "${platform}" && cd "${platform}"
        mkdir Machines VPN && cd ..
	    echo "[+] ${platform} added."
    fi
done

echo "[+] Done."
