FROM python
RUN pip install pandoc-plantuml-filter

FROM pandoc/latex
WORKDIR /usr/src/pandoc
COPY pandoc-gls.lua .
RUN tlmgr install glossaries
