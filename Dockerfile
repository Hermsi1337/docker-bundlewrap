ARG         PYTHON_VERSION=3.6

FROM        python:${PYTHON_VERSION}-alpine

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