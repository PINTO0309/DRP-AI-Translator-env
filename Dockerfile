FROM ubuntu:20.04
ARG DRPINSTALLER=r20ut5035ej0185-drp-ai-translator
ARG WKDIR=/${DRPINSTALLER}/drp-ai_translator_release

ENV DEBIAN_FRONTEND=noninteractive

COPY ${DRPINSTALLER}.zip .

RUN apt-get update \
    && apt-get install -y \
        nano python3-pip libgl1-mesa-dev wget libopencv-dev \
        libpython3-all-dev wget curl cmake unzip \
        software-properties-common sudo pkg-config libhdf5-dev \
    && sed -i 's/# set linenumbers/set linenumbers/g' /etc/nanorc \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install -U pip

RUN unzip ${DRPINSTALLER}.zip -d ${DRPINSTALLER} \
    && rm ${DRPINSTALLER}.zip \
    && cd ${DRPINSTALLER} \
    && chmod +x DRP-AI_*-Install \
    && yes | ./DRP-AI_*-Install

ENV USERNAME=user

RUN echo "root:root" | chpasswd \
    && adduser --disabled-password --gecos "" "${USERNAME}" \
    && echo "${USERNAME}:${USERNAME}" | chpasswd \
    && echo "%${USERNAME}    ALL=(ALL)   NOPASSWD:    ALL" >> /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME} \
    && mkdir -p ${WKDIR} \
    && chown ${USERNAME}:${USERNAME} ${WKDIR}

USER ${USERNAME}
WORKDIR ${WKDIR}
