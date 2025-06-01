#!/bin/sh

mkdir /opt/.bk
cp -rp /etc /opt/.bk/etc
cp -rp /home /opt/.bk/home
cp -rp /root /opt/.bk/root
cp -rp /var /opt/.bk/var
cp -rp /usr/local/bin /opt/.bk/ubin
cp -rp /usr/local/sbin /opt/.bk/usbin

tar zcf /opt/.bk.tar.gz /opt/.bk
gpg -c /opt/.bk.tar.gz

rm /opt/.bk.tar.gz
rm -rf /opt/.bk
