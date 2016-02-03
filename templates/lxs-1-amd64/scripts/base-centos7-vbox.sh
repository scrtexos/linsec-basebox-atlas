# Base install

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

yum clean all
yum -y install deltarpm
yum update -y --obsoletes

reboot
sleep 120
