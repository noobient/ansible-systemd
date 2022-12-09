FROM almalinux:8

# Update
RUN dnf -y update

# Fundamental utils
RUN dnf -y install git sudo bash

# Ansible
RUN dnf -y install epel-release
RUN dnf -y install ansible

# systemd et al
RUN dnf -y install systemd cronie kmod
CMD [ "/sbin/init" ]

# Access GitHub repo by default
WORKDIR "/repo"
