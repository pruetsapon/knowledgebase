# 1. run with build angular
# base image
FROM nginx:1.17.3-alpine

# copy nginx config file
COPY nginx.conf /etc/nginx/nginx.conf

# set working directory
WORKDIR /usr/share/nginx/html

# copy to working directory
COPY dist/ .


# 2. run with angular-cli
# base image
FROM node:13.0.1-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
# RUN npm install
COPY node_modules /app/node_modules
RUN npm install -g @angular/cli
RUN npm install -g http-server

# add app
#COPY . /app
COPY ../dist /app

# start app
CMD http-server -p 4200 ./app