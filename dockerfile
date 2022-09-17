FROM pandoc/core:latest-ubuntu

# Update Alpine and install tools
RUN apt-get update \
    && apt-get install -y \
    default-jre \
    texlive-latex-extra \
    curl \
    && curl -L https://sourceforge.net/projects/plantuml/files/plantuml.jar/download -o /plantuml.jar \
    && apt-get purge -y curl \
    && rm -rf /var/lib/apt/lists/*

ENV PLANTUML /plantuml.jar

# Set WD and Entrypoint
WORKDIR /data
ENTRYPOINT ["/usr/local/bin/pandoc"]
