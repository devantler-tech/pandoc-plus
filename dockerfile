FROM pandoc/latex:latest

# Update Alpine and install tools
RUN apk upgrade --update && apk add --no-cache --update bash

# Install Java
RUN apk --no-cache add openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

# Install PlantUML
RUN apk add --no-cache graphviz ttf-droid ttf-droid-nonlatin curl \
    && curl -L https://sourceforge.net/projects/plantuml/files/plantuml.jar/download -o /plantuml.jar \
    && apk del curl
ENV PLANTUML /plantuml.jar

# Install LaTeX packages
RUN tlmgr update --self
RUN tlmgr update --all
RUN tlmgr install glossaries \
    mfirstuc \
    xfor \
    datatool
RUN tlmgr install easy-todo \
    tocloft
RUN tlmgr install tex-gyre
RUN tlmgr path add

# Set WD and Entrypoint
WORKDIR /data
ENTRYPOINT ["/usr/local/bin/pandoc"]
