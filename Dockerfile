# https://hub.docker.com/_/ubuntu/tags?name=resolute
FROM docker.io/ubuntu:resolute-20260413@sha256:5e275723f82c67e387ba9e3c24baa0abdcb268917f276a0561c97bef9450d0b4

COPY ./internal/install-opengrep/download.sh /download.sh

RUN set -eux; \
  apt-get -qq update; \
  apt-get install -qqy curl cosign; \
  bash /download.sh /usr/bin; \
  apt-get autoremove -qqy curl cosign; \
  apt-get clean; \
	rm -R /var/lib/apt/lists/*
