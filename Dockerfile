FROM node:14-buster as angular
WORKDIR /app
COPY package.json /app/
RUN npm i
COPY . .
RUN npm run build:prod


FROM nginx:stable-alpine as nginx
VOLUME /var/cache/nginx
COPY --from=angular /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
