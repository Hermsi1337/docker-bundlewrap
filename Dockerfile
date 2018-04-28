ARG         PYTHON_VERSION=3.6
ARG         ALPINE_VERSION=3.7

FROM        python:${PYTHON_VERSION}-alpine${ALPINE_VERSION}

RUN         apk add --no-cache  \
                openssh-client  \
                musl-dev        \
                libffi-dev      \
                openssl-dev     \
                gcc             \
                file            \
                dpkg            \
                shadow          \
                pacman          \
                git             \
                &&              \
            pip install --no-cache-dir bundlewrap

WORKDIR     "/repository"

ENTRYPOINT  ["bw"]