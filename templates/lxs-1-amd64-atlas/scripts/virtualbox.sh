# Installing the virtualbox guest additions
# Must specify the KERN_DIR env var, otherwise the VBox installer won't find them
export KERN_DIR=/usr/src/kernels/`uname -r`
echo "installing VBoxGuestAdditions..."
mkdir -p /mnt/virtualbox
mount -o loop /tmp/VBoxGuestAdditions.iso /mnt/virtualbox
/mnt/virtualbox/VBoxLinuxAdditions.run --nox11
umount /mnt/virtualbox

cat << EOF >> /etc/rc.d/rc.local

# Workaround : test if vboxguest is running and try to setup it if not
if (lsmod | grep -q "vboxguest[^_-]" ) ; 
then 
  echo "VBoxGuestAdditions is running..." ; 
else 
  echo "VBoxGuestAdditions doesn't run, try to setup." ; 
  export KERN_DIR=/usr/src/kernels/\$(uname -r) ;
  yum update -y kernel-devel-\$(uname -r) ;
  /etc/init.d/vboxadd setup ;
fi

EOF

