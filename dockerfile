FROM python
RUN pip install pandoc-plantuml-filter

FROM pandoc/latex
WORKDIR /data
ENTRYPOINT ["/usr/local/bin/pandoc"]
COPY pandoc-gls.lua .
RUN tlmgr install glossaries
