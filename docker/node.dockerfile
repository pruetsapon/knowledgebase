FROM node:13.0.1-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

#install program
RUN apk add --no-cache file
RUN apk --update add imagemagick
RUN apk --update add graphicsmagick

#EXPOSE 8080

CMD [ "node", "server.js" ]