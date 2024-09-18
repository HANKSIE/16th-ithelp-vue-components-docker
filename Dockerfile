FROM node:22-alpine

RUN apk update && apk add git && apk add bash

RUN npm install -g pnpm

RUN pnpm add -D vite

EXPOSE 5173
