FROM pandoc/latex:latest

# Update Alpine and install tools
RUN apk upgrade --update \
    && apk add --no-cache --update \
    bash \
    openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    graphviz \
    ttf-droid \
    ttf-droid-nonlatin \
    curl \
    texlive-full \
    && curl -L https://sourceforge.net/projects/plantuml/files/plantuml.jar/download -o /plantuml.jar \
    && apk del curl

ENV PLANTUML /plantuml.jar

# Set WD and Entrypoint
WORKDIR /data
ENTRYPOINT ["/usr/local/bin/pandoc"]
