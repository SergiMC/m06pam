#! /bin/bash
# @edt ASIX M06 2018-2019
# instal.lacio
#  - crear usuaris locals
# -------------------------------------
groupadd local01ex
groupadd local02ex
useradd -g users -G local01ex exam01
useradd -g users -G local02ex exam02
useradd -g users -G local02ex exam03
echo "exam01" | passwd --stdin exam01
echo "exam02" | passwd --stdin exam02
echo "exam03" | passwd --stdin exam03

bash /opt/docker/auth.sh
cp /opt/docker/nslcd.conf /etc/nslcd.conf
cp /opt/docker/ldap.conf /etc/openldap/ldap.conf
cp /opt/docker/nsswitch.conf /etc/nsswitch.conf
cp /opt/docker/system-auth-sergi /etc/pam.d/system-auth-sergi
cp /opt/docker/pam_mount.conf.xml /etc/security/pam_mount.conf.xml
ln -sf /etc/pam.d/system-auth-sergi /etc/pam.d/system-auth

