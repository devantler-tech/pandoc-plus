FROM python
RUN pip install pandoc-plantuml-filter

FROM pandoc/latex
WORKDIR /
COPY pandoc-gls.lua .
RUN tlmgr install glossaries
