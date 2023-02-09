#!/bin/bash

export PLATFORM=$(echo $1 | cut -d'/' -f1)
export RELEASE=$(echo $1 | cut -d'/' -f2)

docker build --no-cache --pull --tag "bviktor/ansible-systemd-${PLATFORM}:${RELEASE}" "${1}"
