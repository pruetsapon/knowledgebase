# 1. build angular
# dockerfile
# base image
FROM nginx:alpine

# copy nginx config file
COPY nginx.conf /etc/nginx/nginx.conf

# set working directory
WORKDIR /usr/share/nginx/html

# copy to working directory
COPY dist/ .
# end dockerfile

# nginx config
worker_processes  1;
events {
    worker_connections  1024;
}

http {
    server {
        listen 4200;
        server_name  localhost;
        root   /usr/share/nginx/html;
        index  index.html index.htm;
        include /etc/nginx/mime.types;
        gzip on;
        gzip_min_length 1000;
        gzip_proxied expired no-cache no-store private auth;
        gzip_types text/plain text/css application/json application/javascript application/x-javascript text/xml application/xml application/xml+rss text/javascript;
        location / {
            try_files $uri $uri/ /index.html;
        }
    }
}


# 2. run with angular-cli
# dockerfile
# base image
FROM node:13.0.1-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
#RUN npm install
COPY node_modules /app/node_modules
RUN npm install -g @angular/cli
RUN npm install -g http-server

# add app
#COPY . /app
COPY ../dist /app

# start app
#CMD ng serve --aot=true --host 0.0.0.0
CMD http-server -p 4200 ./app
# end dockerfile