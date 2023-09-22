[![tests](https://github.com/bhanu951/ddev-localhostrun/actions/workflows/tests.yml/badge.svg)](https://github.com/bhanu951/ddev-localhostrun/actions/workflows/tests.yml) ![project is maintained](https://img.shields.io/maintenance/yes/2024.svg)

# ddev-addon-localhostrun 

This addon provides integration with [localhost.run](https://localhost.run/) service.

This command makes it easy to share a locally running HTTP, HTTPS or TLS app on the internet.

To install this addon run

```
$ ddev get bhanu951/ddev-localhostrun
```
To use this addon run

```
$ ddev localhost
```
When you run above command a publically accessible URL will be displayed in the terminal. One can access the app over internet using that URL.

To remove this addon run

```
$ ddev get --remove ddev-localhostrun
```
## About localhost.run Service

[localhost.run](https://localhost.run/) is a client-less tool to instantly make a locally running application available on an internet accessible URL.

It generates a random URL when this service is used.

Make sure you have one SSH key in your workstation. (No need to specify it anywhere; localhost.run will prompt to fingerprint when you first run it.)

You can optionally use [custom domains](https://localhost.run/docs/custom-domains) with a paid plan to get a fixed URL and additional features.


**Contributed and maintained by [@bhanu951](https://github.com/bhanu951)**
