# Dockerfile
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all project files
COPY . .

# ✅ Use OpenSSL Legacy Provider to fix build issues
ENV NODE_OPTIONS=--openssl-legacy-provider

# Build the application
RUN npm run build

# Expose port and run application
EXPOSE 5003
CMD ["npm", "start"]
