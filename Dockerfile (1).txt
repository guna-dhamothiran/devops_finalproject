# Use Node.js image for building the React app
FROM node:18 AS build

# Set working directory in container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy all source files
COPY . .

# Build the React app
RUN npm run build

# Use Nginx for serving the build files
FROM nginx:latest

# Copy built files from previous step to Nginx HTML directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 5003
EXPOSE 5003

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
