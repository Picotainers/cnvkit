# cnvkit
Source-built container image for `cnvkit`.

## Quick Usage

```bash
# Pull the image
docker pull docker.io/picotainers/cnvkit:latest

# Run the tool
docker run --rm docker.io/picotainers/cnvkit:latest --help
```

## Usage

```bash
docker run --rm -v "$(pwd):/data" docker.io/picotainers/cnvkit:latest --help
```

## Building

```bash
docker build -t docker.io/picotainers/cnvkit:latest .
```
