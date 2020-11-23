FROM python
RUN pip install pandoc-plantuml-filter

FROM pandoc/latex
COPY pandoc-gls.lua .
RUN tlmgr install glossaries
