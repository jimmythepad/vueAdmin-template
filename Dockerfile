FROM node:alpine

ADD . /app

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH




# install and cache app dependencies
COPY package.json /app/package.json
RUN npm install --silent

ADD src /app
COPY . /app

RUN ["npm", "install"]
RUN ["npm", "run", "build"]

# start app
CMD ["npm", "start"]