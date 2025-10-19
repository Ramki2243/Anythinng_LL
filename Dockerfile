FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy everything
COPY . .

# Install root dependencies
RUN yarn install --production

# Build frontend
WORKDIR /app/frontend
RUN yarn install && yarn build

# Go back to root
WORKDIR /app

# Expose backend port (AnythingLLM server runs on 3001)
EXPOSE 3001

# Start the backend server in production mode
CMD ["yarn", "prod:server"]