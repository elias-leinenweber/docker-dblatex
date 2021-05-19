# dblatex Docker Container

## The environment

This Docker image provides:

- [dblatex](http://dblatex.sourceforge.net/) 0.3.10
- [Inkscape](https://inkscape.org/) 0.92.4
- [texlive-lang-french](https://packages.debian.org/buster/texlive-lang-french) 2018.20190227-2

This image uses Debian GNU/Linux 10 (buster) as base image.

## How to use it

Just run:

    docker run -it -v <your directory>:/documents/ docker-dblatex

Docker maps your directory with */documents* directory in the container.

After you start the container, you can use dblatex commands to convert DocBook files that you created in the directory mentioned above.
You can find several examples below.

- To run dblatex on a basic DocBook file:

        dblatex sample.xml

- To convert files in batch:

        docker run --rm -v $(pwd):/documents/ docker-dblatex dblatex index.xml
