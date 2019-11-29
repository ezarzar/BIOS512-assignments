FROM rocker/binder:3.6.0

ARG NB_USER
ARG NB_UID

RUN pip3 install jupyterlab

USER root
COPY BIOS512-assignments ${ezarzar}/BIOS512-assignments
RUN chown -R ${NB_USER} ${HOME}

USER ${NB_USER}

# COPY install.R ./
# RUN if [ -f install.R ]; then R -f install.R; fi
