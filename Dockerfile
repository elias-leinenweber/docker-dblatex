FROM debian:buster-20210511 AS base

ARG dblatex_version=0.3.10-2
ARG inkscape_version=0.92.4-3
ARG texlive_lang_french_version=2018.20190227-2

ENV DBLATEX_VERSION=${dblatex_version} \
  INKSCAPE_VERSION=${inkscape_version} \
  TEXLIVE_LANG_FRENCH_VERSION=${texlive_lang_french_version}


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Minimal image with dblatex
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

FROM base AS main-minimal
RUN echo "assemble minimal main image" # keep here to help --cache-from along

LABEL MAINTAINER="Elias Leinenweber <elias.leinenweber@free.fr>"

RUN apt-get update && apt-get install -y --no-install-recommends \
    "dblatex=${DBLATEX_VERSION}"


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Final image
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

FROM main-minimal AS main
RUN echo "assemble comprehensive main image" # keep here to help --cache-from along

LABEL MAINTAINER="Elias Leinenweber <elias.leinenweber@free.fr>"

# Installing packages for additional functionality
RUN apt-get update && apt-get install -y --no-install-recommends \
    "inkscape=${INKSCAPE_VERSION}" \
    "texlive-lang-french=${TEXLIVE_LANG_FRENCH_VERSION}"

WORKDIR /documents
VOLUME /documents

CMD [ "/bin/bash" ]
