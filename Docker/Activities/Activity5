# Use an existing image as a base
FROM docker.io/node:18-alpine
 
# Create a Work Directory
WORKDIR /usr/app

#Copy the package.json to /usr/app
COPY package.json ./

#Install the required dependencies
RUN npm install

#Copy the  others files to /usr/app
COPY ./ ./
#Set the starting command for the container
CMD [ "npm", "start" ]
