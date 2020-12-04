FROM pandoc/latex
WORKDIR /data
ENTRYPOINT ["/usr/local/bin/pandoc"]
COPY filters/ ./filters
RUN tlmgr install glossaries
