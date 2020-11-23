FROM python
RUN pip install pandoc-plantuml-filter

FROM pandoc/latex
COPY pandoc-gls.lua ./usr/local/bin
RUN tlmgr install glossaries
