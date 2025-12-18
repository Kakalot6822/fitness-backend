FROM node:18-slim
WORKDIR /usr/src/app
COPY backend/package*.json ./
RUN npm install
COPY backend/ .
EXPOSE 8080
CMD [ "npm", "start" ]
