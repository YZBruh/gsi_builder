#!/bin/bash

set -e

repo init -u https://github.com/LineageOS/android.git -b lineage-21.0 --git-lfs
crave set --projectID 72

# Run inside foss.crave.io devspace, in the project folder
# Remove existing local_manifests
crave run --no-patch -- "rm -rf .repo/local_manifests && \

mkdir pixel && cd pixel
git clone https://github.com/YZBruh/treble_build_pe -b twelve
sudo chmod -R 777 *
bash treble_build_pe/build.sh twelve sync

# Pull generated img files
crave pull /home/builds/*.xz
