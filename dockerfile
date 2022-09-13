FROM ubuntu:22.10

RUN apt update && apt install -y \
    default-jre \
    texlive texlive-latex-extra \
    librsvg2-bin \
    plantuml \
    pandoc

ENTRYPOINT ["/usr/local/bin/pandoc"]