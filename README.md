# mell-gibson-mustache

[![multi arch build](https://github.com/nexus-uw/mell-gibson-mustache/actions/workflows/image.yml/badge.svg)](https://github.com/nexus-uw/mell-gibson-mustache/actions/workflows/image.yml)

another tor container but this one use github actions to build on 3 archs (amd64, arm/v6, arm/v7, and arm64). 

~~set to rebuild every week to stay up to date~~


great for use as a relay or proxy

```yaml
version: "3"
services:
 relay:
    image: nexusuw/mell-gibson-mustache
    restart: always
    ports:
      - 9001:9001
      - 9030:9030
    volumes:
 #    - "./torrc:/etc/tor/torrc" # to override the default config
      - "tor-data:/var/lib/tor:Z"  # to preserve data 
volumes:
  tor-data:
```
