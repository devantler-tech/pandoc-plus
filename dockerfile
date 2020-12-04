FROM adoptopenjdk:latest
FROM pandoc/latex
WORKDIR /
COPY filters/ .
WORKDIR /data
RUN tlmgr install glossaries
ENTRYPOINT ["/usr/local/bin/pandoc"]
