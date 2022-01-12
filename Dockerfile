FROM node:14-buster as angular
WORKDIR /app
COPY package.json /app/
RUN npm i
COPY . .
RUN npm run build


FROM nginx:alpine as nginx
VOLUME /var/cache/nginx
COPY --from=angular /app/ /usr/share/nginx/html
COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf
