# pandoc-plus

A docker image that packages pandoc with LaTeX, PlantUML, and pandoc lua filters, so it can be used to create scientific papers.

<!-- readme-tree start -->
```
```
<!-- readme-tree end -->

## How To

```bash
docker run -v "$(pwd)/folder:/data" --name pandoc-plus pandoc-plus:main -d main.yaml -o outfile.pdf
```

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
      - name: Generate document
        uses: docker://ghcr.io/devantler/pandoc-plus:main
        with: 
          args: >-
            -d main.yaml 
            -o document.pdf
      - name: Upload generated document
        uses: actions/upload-artifact@master
        with:
          name: document.pdf
          path: document.pdf
```

## References

- [lua-filters](https://github.com/pandoc/lua-filters)
