FROM node:latest

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json /app
COPY package-lock.json /app

RUN npm install --silent
RUN npm install react-scripts@1.1.1 -g --silent

# add app
COPY . ./

RUN npm run build


# start app
CMD ["npm", "start"]