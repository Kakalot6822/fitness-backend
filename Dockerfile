FROM node:18-slim
WORKDIR /usr/src/app

# คัดลอก package.json จากในโฟลเดอร์ backend มาที่ root ของ container
COPY backend/package*.json ./

# รัน install (รอบนี้จะเจอไฟล์แล้วครับ)
RUN npm install

# คัดลอกโค้ดทั้งหมดจาก backend มาวางที่ container
COPY backend/ .

EXPOSE 8080
CMD [ "npm", "start" ]
