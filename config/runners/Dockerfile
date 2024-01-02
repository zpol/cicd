FROM gocd/gocd-agent-alpine-3.16:v23.5.0

USER root
RUN apk --update add --no-cache go git && \
    rm -rf /var/cache/apk/*

