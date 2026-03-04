# ansible-systemd

## About

Docker images with systemd enablement to be used in Ansible Galaxy roles in GitHub Actions workflows

When using Podman, log in with:

```
podman login docker.io
```

## Usage

Start the instance:

```
CONT_ID=$(podman run --rm --detach "bviktor/ansible-systemd-fedora:43")
```

Enter:

```
podman exec -it "${CONT_ID}" bash
```

Destroy:

```
podman stop "${CONT_ID}"
```

For more examples, please refer to the [galaxy-debug](https://github.com/noobient/galaxy-debug) tool.
