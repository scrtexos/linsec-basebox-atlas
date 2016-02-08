#!/bin/bash
# Installing the virtualbox guest additions
# Must specify the KERN_DIR env var, otherwise the VBox installer won't find them

mkdir -p /tmp/virtualbox
mount -o loop /tmp/VBoxGuestAdditions.iso /tmp/virtualbox
( set -e ; sh /tmp/virtualbox/VBoxLinuxAdditions.run --nox11 || : ;)
umount /tmp/virtualbox

