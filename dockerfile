FROM pandoc/core:latest

# Update Alpine and install tools
RUN apk add --no-cache \
    openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    graphviz \
    texlive-full \
    tlmgr \
    curl \
    && curl -L https://sourceforge.net/projects/plantuml/files/plantuml.jar/download -o /plantuml.jar \
    && apk del curl

RUN tlmgr update --self --all \
    # && tlmgr install glossaries \
    # mfirstuc \
    # xfor \
    # datatool \
    # easy-todo \
    # tocloft \
    # tex-gyre \
    # textcase \
    # authblk \
    && tlmgr path add

ENV PLANTUML /plantuml.jar

# Set WD and Entrypoint
WORKDIR /data
ENTRYPOINT ["/usr/local/bin/pandoc"]
