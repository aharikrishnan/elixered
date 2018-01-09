FROM elixir:1.5.2

ARG USER
ARG UID
ARG PASS
ARG GROUP
ARG GID
ARG NODE_VERSION

RUN groupadd -g $GID $GROUP && \
      useradd -d /home/$USER -g $GROUP -m -p $PASS -s /bin/bash -u $UID $USER;

USER $USER

RUN \
      wget -O /tmp/n-install https://git.io/n-install && \
      bash /tmp/n-install -y $NODE_VERSION && \
      . /home/$USER/.bashrc

