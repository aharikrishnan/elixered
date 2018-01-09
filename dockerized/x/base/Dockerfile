FROM ubuntu:16.04

ARG USER
ARG UID
ARG PASS
ARG GROUP
ARG GID

RUN groupadd -g $GID $GROUP && \
useradd -d /home/$USER -g $GROUP -m -p $PASS -s /bin/bash -u $UID $USER;

RUN apt-get update && \
      apt-get install -y \
      sudo \
      openssh-server \
      openssh-client;

#RUN rm -rf /var/lib/apt/lists/*;

USER $USER

