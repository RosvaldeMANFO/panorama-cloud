FROM node:20 as builder

WORKDIR /app

COPY ./package*.json .

RUN npm install

COPY . .

RUN chmod +x ./node_modules/.bin/*

RUN npm run build

FROM nginx:alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*
COPY --from=builder /app/dist .

COPY ./env.sh .

RUN chmod +x env.sh

CMD ["/bin/sh", "-c", "/usr/share/nginx/html/env.sh && nginx -g \"daemon off;\""]