# Wait on reboot after kernel replacement...
sleep 160

# Add dependancies for VBox or KVM guest management
yum -y  --nogpgcheck groupinstall "Development Tools"
yum -y  --nogpgcheck install gcc make gcc-c++ kernel-devel-`uname -r` zlib-devel openssl-devel readline-devel sqlite-devel perl wget

# Add tools for managing yum deployments
yum -y  --nogpgcheck install yum-utils

