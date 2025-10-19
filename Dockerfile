# # Stage 1: Build frontend
# FROM node:20-alpine AS frontend-build
# WORKDIR /app/frontend
# COPY frontend/package*.json ./
# RUN yarn install
# COPY frontend . 
# RUN yarn build

# # Stage 2: Build server
# FROM node:20-alpine
# WORKDIR /app

# # Copy root package.json and install server deps
# COPY package*.json ./
# RUN yarn install --production

# # Copy server code
# COPY server ./server
# COPY collector ./collector

# # Copy built frontend from stage 1
# COPY --from=frontend-build /app/frontend/dist ./frontend/dist

# EXPOSE 3001
# CMD ["yarn", "prod:server"]

FROM node:20-alpine

# # Set working directory
# WORKDIR /app

# # Copy everything
# COPY . .

# # Install root dependencies
# RUN yarn install --production

# # Build frontend
# WORKDIR /app/frontend
# RUN yarn install && yarn build

# # Go back to root
# WORKDIR /app

# # Expose backend port (AnythingLLM server runs on 3001)
# EXPOSE 3001

# # Start the backend server in production mode
# CMD ["yarn", "prod:server"]

# FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN yarn install --production

# Copy the rest of the project
COPY . .

# Expose the app port
EXPOSE 3001

# Start the app (adjust if your start script is different)
CMD ["yarn", "start:all"]