# Node.js on Windows Nano Server
[![Docker Image CI](https://github.com/amitie10g/node-nanoserver-docker/actions/workflows/docker-image.yml/badge.svg)](https://github.com/amitie10g/node-nanoserver-docker/actions/workflows/docker-image.yml)

<p align=center><img src="https://github.com/Amitie10g/node-nanoserver-docker/assets/2096562/d2ac73e9-d71d-47a7-988a-d73358c411cc" alt="Node.js logo" style="text-align:center;margin:auto"></p>

This project brings [Node.js](https://nodejs.org/) (version 4 to 22) on [Microsoft Windows Nano Server](https://hub.docker.com/_/microsoft-windows-nanoserver) base image.

## Tags

* ``latest`` ``23`` ``23-ltsc2022``
* ``jod`` ``jod-ltsc2022``  ``22`` ``22-ltsc2022``
* ``iron`` ``iron-ltsc2022``  ``20`` ``20-ltsc2022``
* ``hydrogen`` ``hydrogen-ltsc2022``  ``18`` ``18-ltsc2022``
* ``gallium`` ``gallium-ltsc2022``  ``16`` ``16-ltsc2022``
* ``fermium`` ``fermium-ltsc2022``  ``14`` ``14-ltsc2022``
* ``erbium`` ``erbium-ltsc2022``  ``12`` ``12-ltsc2022``
* ``dubnium`` ``dubnium-ltsc2022``  ``10`` ``10-ltsc2022``
* ``carbon`` ``carbon-ltsc2022``  ``8`` ``8-ltsc2022``
* ``boron`` ``boron-ltsc2022``  ``6`` ``6-ltsc2022``
* ``argon`` ``argon-ltsc2022``  ``4`` ``4-ltsc2022``

[Full list of tags avilable](https://github.com/amitie10g/node-nanoserver-docker/pkgs/container/node-nanoserver) at both GitHub Container registry and [Docker Hub Container registry](https://hub.docker.com/r/amitie10g/node-nanoserver).

## Usage

This project is intended to be used as base image for other Node-based projects. An example Dockerfile:

    FROM amitie10g/node-nanoserver:iron
    
    COPY . C:\\Users\\ContainerUser\\app
    RUN npm install --omit=dev
    
    ENTRYPOINT ["npm", "start"]

If you need to install system-wide software, you need to set `USER` as `ContainerAdministrator`. Afterward, you need to change it back to `ContinerUser`.

If you want to use it within GitHub Actions, prefer the GitHub Container registry: `ghcr.io/amitie10g/node-nanoserver`

## Building
Containers for this project has been built using [GitHub Actions](https://github.com/features/actions) for automated weekly builds from 4 to 22 under Windows Nano Server ltsc2022 and ltsc2019. GitHub provides runners only for Windows Server 2022 (ltsc2022) and Server 2019 (ltsc2019) and no [hyperv isolation](https://docs.docker.com/engine/reference/commandline/build/#isolation) is supported. If you need other versions of Windows, follow this instructions.

    docker build -t <tag> --build-arg NODE_VER=<node version> --build-arg BASE_IMG=<base image> --build-arg CONT_VER=<container version> .
Where,

* ``NODE_VER`` is used to download Node from ``https://nodejs.org/dist/v${NODE_VER}/node-v${NODE_VER}-win-x64.zip``
* ``BASE_IMG`` is the base image, either ``windows/nanoserver`` or ``powershell``
* ``CONT_VER`` is the tag available for each base image. For a full list of available tags, consult the respective page of the base images provided (links above).

## Licensing

* Everything in this repo is released into the Public domain (the Unlicense)
* **Node.js** is licensed under the **[MIT License](https://opensource.org/license/mit/)**.
* **Microsoft Windows container images** usage is subjected to the **[Microsoft EULA](https://learn.microsoft.com/en-us/virtualization/windowscontainers/images-eula)**
* **Microsoft PowerShell** is licensed under the **MIT License**.
