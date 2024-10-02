FROM node:18.17.0-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install app dependencies
RUN npm install

# Install nodemon globally
RUN npm install -g nodemon

# Bundle app source
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Start the application using nodemon
CMD ["nodemon", "--watch", ".", "--exec", "npm", "run", "dev"]
