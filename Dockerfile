FROM node:14 as angular

WORKDIR /app

COPY package.json /app

RUN npm i

COPY . .

RUN npm run build

