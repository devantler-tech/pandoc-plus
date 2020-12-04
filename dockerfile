FROM pandoc/latex
COPY filters/ ./filters
RUN tlmgr install glossaries
