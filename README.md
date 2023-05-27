**A Docker Image for updating a custom DDNS server.**

![Docker Automated build](https://img.shields.io/docker/automated/fischerscode/ddns-updater) ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/fischerscode/ddns-updater) ![Docker Image Version (latest semver)](https://img.shields.io/docker/v/fischerscode/ddns-updater)

## Environment Variables

| env Variable | description                      |
| :----------: | -------------------------------- |
|   ENV_URL    | The URL that is called           |
|   ENV_USER   | Replaces __USER__ in the ENV_URL |
|   ENV_PASS   | Replaces __PASS__ in the ENV_URL |

## Variables in ENV_URL

| variable  | description                                       |
| :-------: | ------------------------------------------------- |
| __pIPv4__ | The public IPv4 (determined by using 'ipify.org') |
| __pIPv6__ | The public IPv6 (determined by using 'ipify.org') |
| __USER__  | Replaced by ENV_USER                              |
| __PASS__  | Replaced by ENV_PASS                              |