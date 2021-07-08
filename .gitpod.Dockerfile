FROM gitpod/workspace-full

USER root

RUN apt update -y && apt install qemu qemu-system-x86 linux-image-$(uname -r) libguestfs-tools sshpass netcat -y
RUN curl -o /usr/bin/kubectl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x /usr/bin/kubectl

COPY .gitpod /opt/gitpod
RUN /opt/gitpod/prepare-rootfs.sh
