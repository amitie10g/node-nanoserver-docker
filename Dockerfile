
ARG BASE_IMG=windows/nanoserver
ARG CONT_VER=ltsc2025

LABEL \
  org.opencontainers.image.title="Node.js Base Image" \
  org.opencontainers.image.description="Node.js on Windows Nano Server"
FROM mcr.microsoft.com/${BASE_IMG}:${CONT_VER}

ARG NODE_VER=22.14.0
COPY NodeJS/node-v${NODE_VER}-win-x64 C:\\node

USER ContainerAdministrator
RUN setx /M PATH "%PATH%;C:\\node"
USER ContainerUser

WORKDIR C:\\Users\\ContainerUser\\app

ENTRYPOINT ["node"]
