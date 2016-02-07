#!/bin/bash -eux

apt-get update
apt-get -qy upgrade

# ensure the correct kernel headers are installed
apt-get -qy install linux-headers-$(uname -r)

# update package index on boot
cat <<EOF > /etc/init/refresh-apt.conf
description "update package index"
start on networking
task
exec /usr/bin/apt-get update
EOF

# install rsync
apt-get -qy install rsync
