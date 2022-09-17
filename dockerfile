FROM ubuntu:22.10

# Hack to make tzdata install without prompting for a timezone.
ENV TZ=Europe/Copenhagen
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    wget \
    git \
    default-jre \
    texlive-latex-extra \
    librsvg2-bin \
    plantuml \
    pandoc \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/lierdakil/pandoc-crossref.git && \
    cd pandoc-crossref && \
    git checkout v0.3.13.0b && \
    stack install && \
    cd .. && \
    rm -rf pandoc-crossref

COPY filters ~/.pandoc/filters

ENTRYPOINT ["/usr/bin/pandoc"]