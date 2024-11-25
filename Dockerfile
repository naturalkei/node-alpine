FROM node:22-alpine

ENV PNPM_VERSION 9

# install curl
RUN echo "Installing curl"
RUN apk add --no-cache curl
RUN echo "curl installed version $(curl --version)"

# install pnpm
RUN echo "Installing pnpm version ${PNPM_VERSION}"
RUN apk add --no-cache --virtual .build-deps \
    python3 \
    make \
    g++ \
    && npm install -g pnpm@${PNPM_VERSION} \
    && apk del .build-deps
RUN echo "pnpm installed version $(pnpm --version)"
