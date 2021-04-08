FROM atmoz/sftp

RUN apt-get update \
    && apt-get -y install wget \
    && wget https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get -y update \
    && apt-get -y install blobfuse fuse \
    && apt-get -y install libcurl3-gnutls \
    && mkdir /mnt/ramdisk \
    && mkdir /mnt/ramdisk/blobfusetmp \
    && mkdir /blobtestfolder

COPY starter.sh /etc/sftp.d/

RUN chmod 777 /etc/sftp.d/starter.sh

EXPOSE 22
