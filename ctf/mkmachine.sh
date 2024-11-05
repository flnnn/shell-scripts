#!/usr/bin/env bash
#
# creates a directory structure for a CTF machine

CTF_DIR="${1}"
PLATFORM="${2}"
MACHINE="${3}"
PLATFORM_DIR="${CTF_DIR}/${PLATFORM}"

if [[ -z "${CTF_DIR}" ]] || [[ -z "${PLATFORM}" ]] | [[ -z "${MACHINE}" ]]; then
    echo "Usage: ${0} <ctf directory> <platform> <machine name>"
    exit 1
fi

if [[ ! -d "${CTF_DIR}" ]]; then
    echo "[!] CTF directory does not exist."
    exit 1
fi

if [[ ! -d "${PLATFORM_DIR}" ]]; then
    echo "[!] That platform does not exist in the CTF directory."
    exit 1
fi

cd "${CTF_DIR}/${PLATFORM}/Machines"

mkdir "${MACHINE}" && cd "${MACHINE}"
mkdir nmap notes scripts misc

echo "[+] ${MACHINE} added."
