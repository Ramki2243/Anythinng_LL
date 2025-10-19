FROM node:18-alpine

WORKDIR /app

COPY anything-llm/package*.json ./anything-llm/
WORKDIR /app/anything-llm
RUN yarn install --production

COPY anything-llm/. .

EXPOSE 3000

CMD ["yarn", "start:all"]
