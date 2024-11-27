# Custom Kali Linux Docker Image

This project provides a custom Kali Linux Docker image based on the upstream `kalilinux/kali-rolling`, with some basic tools and SSHD installed.

## Building the Docker Image

To build the Docker image, run the following command in the directory containing the Dockerfile:

```sh
docker build -t custom-kali .