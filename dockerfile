FROM python
RUN pip install pandoc-plantuml-filter

FROM pandoc/latex
COPY pandoc-gls.lua /data
RUN tlmgr install glossaries
WORKDIR /
