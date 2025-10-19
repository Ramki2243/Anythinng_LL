FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN yarn install --production

# Copy the rest of the project
COPY . .

# Expose the app port
EXPOSE 3000

# Start the app (adjust if your start script is different)
CMD ["yarn", "start:all"]