FROM pandoc/latex
WORKDIR /data
COPY filters/ .
RUN tlmgr install glossaries
ENTRYPOINT ["/usr/local/bin/pandoc"]
