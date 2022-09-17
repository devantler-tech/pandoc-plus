# pandoc-plus

A docker image that packages pandoc with LaTeX, PlantUML, and pandoc lua filters, so it can be used to create scientific papers.

## How To

```yaml
name: Pandoc Document Conversion

on: push

jobs:
  convert_via_pandoc:
    name: Generate Document with Pandoc
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        uses: docker://ghcr.io/devantler/pandoc-plus:main
        with: 
          args: >-
            main.yaml 
            -o document.pdf
            file.md
      - name: Upload generated document
        uses: actions/upload-artifact@master
        with:
          name: file.pdf
          path: file.pdf
```
