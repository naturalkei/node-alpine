FROM node:22-alpine

ENV PNPM_VERSION 9

# install curl
RUN apk add --no-cache curl

# install pnpm
RUN apk add --no-cache --virtual .build-deps \
    python3 \
    make \
    g++ \
    && npm install -g pnpm@${PNPM_VERSION} \
    && apk del .build-deps

# ENTRYPOINT ["docker-entrypoint.sh"]
# CMD ["node"]
