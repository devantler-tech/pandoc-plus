FROM adoptopenjdk:latest
FROM pandoc/latex
COPY filters/ filters/
WORKDIR /data
RUN tlmgr install glossaries
ENTRYPOINT ["/usr/local/bin/pandoc"]
