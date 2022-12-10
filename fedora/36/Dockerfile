FROM fedora:36

# Update
RUN sed -i 's/^enabled=.*$/enabled=0/g' /etc/yum.repos.d/fedora-cisco-openh264.repo
RUN dnf -y update

# Fundamental utils
RUN dnf -y install git sudo bash

# Ansible
RUN dnf -y install ansible

# systemd et al
RUN dnf -y install systemd cronie kmod
CMD [ "/sbin/init" ]

# Access GitHub repo by default
WORKDIR "/repo"
