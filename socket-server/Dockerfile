# Use an official Node.js runtime as a parent image
FROM node:18.17.0-alpine

# Set the working directory
WORKDIR /app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Install nodemon globally
RUN npm install -g nodemon

# Bundle app source
COPY . .

# Expose the port the app runs on
EXPOSE 4000

# Use nodemon to start the server
CMD ["nodemon", "server.js"]
