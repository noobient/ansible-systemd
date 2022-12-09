FROM ubuntu:22.04

# Update
RUN apt -y update
RUN apt -y dist-upgrade

# Fundamental apt stuff
RUN DEBIAN_FRONTEND=noninteractive apt -y install --no-install-recommends apt-utils ca-certificates software-properties-common

# Fundamental utils
RUN apt -y install --no-install-recommends git sudo bash gnupg

# Ansible
# Use pip version, see linter notes below
RUN apt -y install --no-install-recommends python3-pip
RUN python3 -m pip install --user --no-warn-script-location ansible ansible-core

# systemd et al
RUN apt -y install --no-install-recommends systemd cron kmod
CMD [ "/lib/systemd/systemd" ]

# Linter
RUN python3 -m pip install --user --no-warn-script-location ansible-lint
# TODO ansible-lint ignores role-name in skip_list, and exclude on the meta doesn't work either:
# https://github.com/ansible/ansible-lint/issues/2576
# Apply a patch for now, quick-n-dirty sed for the rescue.
RUN sed -i.orig '/\"role-name\",$/d' /root/.local/lib/python$(python3 --version | cut -d' ' -f2 | cut -d'.' -f1-2)/site-packages/ansiblelint/config.py
# On cloud runners, we also get a
# > Failed to discover lintable files using git: fatal: detected dubious ownership in repository
# warning, so suppress that, too.
RUN git config --global --add safe.directory /repo
# We need pip installed linter because packaged one ignores config file, but pip
# installs to ~/.local/bin and that is added to PATH via .bashrc and that's not
# read by default. We could use 'bash --login' in all workflow files, but it's
# better to fix it once for good here.
ENV PATH="${PATH}:/root/.local/bin"

# Access GitHub repo by default
WORKDIR "/repo"
