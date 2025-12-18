FROM node:18-slim
WORKDIR /usr/src/app
# แก้ไขจุดนี้ให้ชี้ไปที่ไฟล์ในโฟลเดอร์ backend โดยตรง
COPY backend/package*.json ./
RUN npm install
# คัดลอกโค้ดทั้งหมดจาก backend เข้ามา
COPY backend/ .
EXPOSE 8080
CMD [ "npm", "start" ]
