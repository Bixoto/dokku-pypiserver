# dokku-pypiserver

This repository contains a ready-to-use `Dockerfile` to deploy a [PyPI server][pypiserver] on [Dokku](https://dokku.com/).

[pypiserver]: https://github.com/pypiserver/pypiserver#readme

Note: it is configured with no authentication, so it should never be exposed on the outside.

## Setup

On your Dokku server:

```bash
APP_NAME=pypiserver # change if needed
dokku apps:create $APP_NAME

# Create storage directories
sudo mkdir /var/lib/dokku/data/storage/pypiserver-data-packages
sudo chown 32767:32767 /var/lib/dokku/data/storage/pypiserver-data-packages
dokku storage:mount $APP_NAME /var/lib/dokku/data/storage/pypiserver-data-packages:/data/packages

dokku ports:set pypiserver http:80:8080
```

Then clone this repository, and push to your Dokku remote to deploy it.

### Upgrade

To upgrade, bump the version in the `Dockerfile` and push.

## Cookbook

In the example snippets below we assume you set the dokku app domain to `pypi.example.com`. Replace this with your own
domain. To configure the app to be accessible in your VPN only and have HTTPS, see
[the tutorial on our blog](https://tech.bixoto.com/add-lets-encrypt-ssl-certificates-on-private-domains-with-dokku/).
`foo` is a placeholder; replace it with the alias you want.

### Publish a package

```sh
# Config
poetry config repositories.foo https://pypi.example.com/

# Publish
poetry build
poetry publish -r foo
```

### Install a package

```sh
poetry source add --default foo https://pypi.example.com/simple/
poetry add your_package
```
