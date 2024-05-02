FROM ubuntu:24.04
WORKDIR /workdir
COPY . .

# Define variables de entorno
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/root/.local/lib/shellspec:$PATH"
ENV PYTHONIOENCODING=utf-8
ENV QT_QPA_PLATFORM=offscreen
ENV TZ=US/Pacific

# Instala paquetes en el sistema operativo
RUN apt update && apt install --no-install-recommends --yes \
    ca-certificates \
    curl \
    git \
    make \
    pip \
    shellcheck \
    && apt clean

# Instala ShellSpec
RUN curl --fail --location https://git.io/shellspec --show-error --silent | sh -s -- --yes
RUN shellspec --init

# Instala testmake
RUN make install
