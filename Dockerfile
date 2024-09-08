# Why is it mantic and not noble????
# This genuinely makes no sense, it is newer than mantic and is LTS
FROM ubuntu:mantic
LABEL maintainer="emneo <emneo@kreog.com>"

# Multiple things to say about this line
# Upgrading should not be necessary not useful, but Epitech does it
# There are also no version pins because once again Epitech doesn't do it and
# I could just get older versions than necessary
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
  && apt-get update -y \
  && apt-get upgrade -y --no-install-recommends \
  && apt-get install -y --no-install-recommends \
  make \
  gcc \
  patch \
  tar \
  git \
  curl \
  ca-certificates \
  xz-utils \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN cd /tmp \
  && curl -sSL "https://github.com/Snaipe/Criterion/releases/download/v2.4.2/criterion-2.4.2-linux-x86_64.tar.xz" -o /tmp/criterion.tar.xz \
  && tar xf criterion.tar.xz \
  && cp -r /tmp/criterion-2.4.2/* /usr/local/ \
  && echo "/usr/local/lib" > /etc/ld.so.conf.d/usr-local.conf \
  && ldconfig \
  && rm -rf /tmp/*

ENV LANG=en_US.utf8 LANGUAGE=en_US:en LC_ALL=en_US.utf8 PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

WORKDIR /usr/app

