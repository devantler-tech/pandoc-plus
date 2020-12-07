FROM pandoc/latex

# Install Java
RUN apk --no-cache add openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

# Install PlantUML
RUN apk add --no-cache graphviz ttf-droid ttf-droid-nonlatin curl \
    && curl -L https://sourceforge.net/projects/plantuml/files/plantuml.jar/download -o /plantuml.jar \
    && apk del curl
ENV PLANTUML /plantuml.jar

# Install LaTeX packages

RUN tlmgr install xfor \
    && tlmgr install mfirstuc \
    && tlmgr install glossaries

# Set WD and Entrypoint
WORKDIR /data
ENTRYPOINT ["/usr/local/bin/pandoc"]
