FROM registry.fedoraproject.org/fedora-minimal:39
LABEL maintainer="Alexandre Flion <huntears@kreog.com>"

RUN microdnf -y install             \
        --setopt=tsflags=nodocs     \
        --setopt=deltarpm=false     \
        make                        \
        gcc                         \
        patch                       \
        tar                         \
        git                         \
        && microdnf clean all       \
        && rm -rf /var/cache/yum

RUN cd /tmp \
    && rm -rf /tmp/* \
    && chmod 1777 /tmp

WORKDIR /usr/app

