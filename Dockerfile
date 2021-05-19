FROM debian AS base


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Minimal image with dblatex
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

FROM base AS main-minimal
RUN echo "assemble minimal main image" # keep here to help --cache-from along

LABEL MAINTAINERS="Elias Leinenweber <elias.leinenweber@free.fr>"

RUN apt update

RUN apt install -qq -y \
    dblatex

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Final image
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

FROM main-minimal AS main
RUN echo "assemble comprehensive main image" # keep here to help --cache-from along

LABEL MAINTAINERS="Elias Leinenweber <elias.leinenweber@free.fr>"

# Installing packages required for the embedding of
# SVG images, and French language support
RUN apt install -qq -y \
    inkscape \
    texlive-lang-french

WORKDIR /documents
VOLUME /documents

CMD [ "/bin/bash" ]
