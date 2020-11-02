
# Stage 1
# Installing node 
FROM node:10-alpine as build-step
#Make app directory 
RUN mkdir  /app
#Going to app directory
WORKDIR /app
#Copy all file in the position package.json to app directory
COPY package.json /app
#Installing npm dependncy because we were outsource the node_modules
RUN npm install
#copy all file to app folder
COPY . /app
#Generate build
RUN npm run build --prod
 
 #Stage 2
 #Installing nginx web browser
FROM nginx:1.17.1-alpine
#placing dist folder to nginx serving folder 
COPY --from=build-step /app/dist/angular /usr/share/nginx/html