#!/bin/bash

chown blobstor /mnt/ramdisk/blobfusetmp

mount -t tmpfs -o size=1g tmpfs /mnt/ramdisk

export AZURE_STORAGE_ACCOUNT=?myaccount?

export AZURE_STORAGE_ACCESS_KEY=?mykey?

blobfuse /home/blobstor/upload --tmp-path=/mnt/ramdisk/blobfusetmp -o allow_other -o attr_timeout=240 -o entry_timeout=240 -o negative_timeout=120 --log-level=LOG_DEBUG --file-cache-timeout-in-seconds=120 --container-name=jsonfiles

