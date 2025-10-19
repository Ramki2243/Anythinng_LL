# Stage 1: Build frontend
FROM node:20-alpine AS frontend-build
WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN yarn install
COPY frontend . 
RUN yarn build

# Stage 2: Build server
FROM node:20-alpine
WORKDIR /app

# Copy root package.json and install server deps
COPY package*.json ./
RUN yarn install --production

# Copy server code
COPY server ./server
COPY collector ./collector

# Copy built frontend from stage 1
COPY --from=frontend-build /app/frontend/dist ./frontend/dist

EXPOSE 3001
CMD ["yarn", "prod:server"]