FROM fedora:40

# Update
RUN grep '^fastestmirror=.*' /etc/dnf/dnf.conf &>/dev/null && sed -Ei 's@^(fastestmirror)=.*@\1=True@' /etc/dnf/dnf.conf || echo 'fastestmirror=True' >> /etc/dnf/dnf.conf
RUN sed -i 's/^enabled=.*$/enabled=0/g' /etc/yum.repos.d/fedora-cisco-openh264.repo
RUN dnf -y update

# Fundamental utils
RUN dnf -y install git sudo bash

# Ansible
RUN dnf -y install ansible

# systemd et al
RUN dnf -y install systemd cronie kmod
CMD [ "/sbin/init" ]

# Clean fastest mirror info, will certainly be different on Docker host
RUN rm -f /var/cache/dnf/fastestmirror.cache

# Access GitHub repo by default
WORKDIR "/repo"
