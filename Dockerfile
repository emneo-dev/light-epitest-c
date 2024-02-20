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
        xz                          \
        && microdnf clean all       \
        && rm -rf /var/cache/yum

RUN cd /tmp \
    && curl -sSL "https://github.com/Snaipe/Criterion/releases/download/v2.4.2/criterion-2.4.2-linux-x86_64.tar.xz" -o /tmp/criterion.tar.xz \
    && tar xf criterion.tar.xz \
    && cp -r /tmp/criterion-2.4.2/* /usr/local/ \
    && echo "/usr/local/lib" > /etc/ld.so.conf.d/usr-local.conf \
    && ldconfig \
    && rm -rf /tmp/*

RUN cd /tmp \
    && rm -rf /tmp/* \
    && chmod 1777 /tmp

WORKDIR /usr/app

