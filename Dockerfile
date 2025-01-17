# syntax=docker/dockerfile:1
#GitHub Webhook test

FROM node:lts-alpine
RUN apk add --no-cache python3 make g++
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000