FROM node:8-alpine
LABEL version "1.0"
LABEL description "Latest Arena web GUI in an alpine based docker image."

RUN mkdir -p /home/arena && \
    addgroup -S arena && \
    adduser -S -G arena arena && \
    apk add --no-cache git && \
    git clone https://github.com/bee-queue/arena.git /opt/arena && \
    rm -fr /opt/arena/.git*

WORKDIR /opt/arena

RUN yarn --production && \
    chown -R arena:arena /opt/arena && \
    apk del git && \
    rm -rf /usr/include /etc/ssl /usr/share/man \
      /usr/local/share/.cache/yarn /tmp/* /var/cache/apk/*

USER arena

EXPOSE 4567

CMD ["yarn", "start"]
