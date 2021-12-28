#influenced by https://blog.jessfraz.com/post/running-a-tor-relay-with-docker/

FROM --platform=$TARGETPLATFORM alpine:3.15

# Note: Tor is only in testing repo
RUN apk update && apk add \
    tor \
    --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
    && rm -rf /var/cache/apk/*

# default port to used for incoming Tor connections
# can be changed by changing 'ORPort' in torrc
EXPOSE 9001
EXPOSE 9030


VOLUME /var/lib/tor
# copy in our torrc files
COPY torrc /etc/tor/torrc

# make sure files are owned by tor user
RUN chown -R tor /etc/tor

USER tor

ENTRYPOINT [ "tor" ]
