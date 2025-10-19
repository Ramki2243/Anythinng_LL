# Use Node 20 instead of 18
FROM node:20-alpine

WORKDIR /app

COPY . .

# Install dependencies
RUN yarn install --production

# Build frontend
WORKDIR /app/frontend
RUN yarn install && yarn build

# Back to root
WORKDIR /app

# Expose backend port
EXPOSE 3001

# Start backend server
CMD ["yarn", "prod:server"]