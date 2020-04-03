FROM node:13.8-alpine

ENV HOST 0.0.0.0

RUN mkdir -p /usr/src/nuxt
WORKDIR /user/src/nuxt

RUN apk add python make g++

COPY package.json yarn.lock ./
RUN yarn install

COPY . ./

CMD yarn dev
