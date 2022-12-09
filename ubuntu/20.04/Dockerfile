FROM ubuntu:20.04

# Update
RUN apt -y update
RUN apt -y dist-upgrade

# Fundamental apt stuff
RUN DEBIAN_FRONTEND=noninteractive apt -y install --no-install-recommends apt-utils ca-certificates software-properties-common

# Fundamental utils
RUN apt -y install --no-install-recommends git sudo bash gnupg

# Ansible
RUN add-apt-repository -y ppa:ansible/ansible
RUN apt -y update
RUN DEBIAN_FRONTEND=noninteractive apt -y install --no-install-recommends ansible

# systemd et al
RUN apt -y install --no-install-recommends systemd cron kmod
CMD [ "/lib/systemd/systemd" ]

# Access GitHub repo by default
WORKDIR "/repo"
