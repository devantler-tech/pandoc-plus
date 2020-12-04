# Install PlantUML
FROM think/plantuml

# Install Pandoc
FROM pandoc/latex

# Add Filters
WORKDIR /
COPY filters/ .

# Install LaTeX Glossaries package
RUN tlmgr install glossaries

# Set WD and Entrypoint
WORKDIR /data
ENTRYPOINT ["/usr/local/bin/pandoc"]
