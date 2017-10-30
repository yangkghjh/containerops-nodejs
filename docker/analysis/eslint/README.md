# ESLINT

## Build

```shell
docker build -t hub.opshub.sh/containerops/analysis-nodejs-eslint:latest .
```

## Run

```shell
docker run --env CO_DATA="git_url=https://github.com/spyl94/react-brunch-demo.git path=src" hub.opshub.sh/containerops/analysis-nodejs-eslint:latest
```

## Options

Required:

- git-url
- path
