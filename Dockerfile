ARG NODE_VER=22.14.0
ARG BASE_IMG=windows/nanoserver
ARG BASE_URL=https://nodejs.org/dist
ARG CONT_VER=ltsc2025
FROM mcr.microsoft.com/windows/servercore:ltsc2025 AS download

ARG BASE_URL
ARG NODE_VER

SHELL ["powershell", "-Command"]
RUN curl.exe -C - --fail -O "$env:BASE_URL/v$env:NODE_VER/node-v$env:NODE_VER-win-x64.zip" ; \
    tar xf "node-v$env:NODE_VER-win-x64.zip"

FROM mcr.microsoft.com/${BASE_IMG}:${CONT_VER}
LABEL \
  org.opencontainers.image.title="Node.js Base Image" \
  org.opencontainers.image.description="Node.js on Windows Nano Server"

ARG NODE_VER
COPY --from=download C:\\node-v${NODE_VER}-win-x64\ C:\\node

ENV PATH="C:\\node;${PATH}"

WORKDIR C:\\Users\\ContainerUser\\app
ENTRYPOINT ["node"]
