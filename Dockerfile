FROM alpine as clone

WORKDIR /app

RUN apk update && apk add git 

RUN git clone https://github.com/mwangiKibui/node.js-rest-api-documentation.git clone 

FROM node:alpine  as build

ENV PORT=3000

WORKDIR /app

COPY --from=clone /app/clone .

RUN npm i 

EXPOSE 3000

CMD [ "npm", "start" ] 