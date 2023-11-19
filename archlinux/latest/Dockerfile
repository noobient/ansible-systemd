FROM archlinux:latest

# Update
RUN pacman -Syu --noconfirm

# Fundamental utils
RUN pacman -S --noconfirm git sudo bash

# Ansible
RUN pacman -S --noconfirm ansible

# systemd et al
RUN pacman -S --noconfirm systemd cronie kmod
CMD [ "/sbin/init" ]

# Access GitHub repo by default
WORKDIR "/repo"
