# Use official Node.js base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy dependency files and install
COPY package*.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Build the Next.js project
RUN npm run build

# Expose the default port
EXPOSE 3000

# Run the app in production mode
CMD ["npm", "start"]
